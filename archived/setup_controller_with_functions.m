clear, close, clc

addpath('./model');
addpath('./function');
addpath("rtnmpc")
addpath("rtnmpc/nn_weigths")
addpath("torque_observer")
addpath("pos_vel_estimator")
addpath("ukf")

flight_time = 8;


% Initialize model parameters
mdl = make_model(flight_time);

% Initialize robot parameters
rbt = make_robot(mdl);

% Initialize controller parameters
ctr = make_controller();

% Initialize robot simulation parameters
rsim = make_robot_simulation(rbt,mdl);

% Initialize rtnmpc & lee's controller parameters
[ctr] = make_rtnmpc_controller(ctr, mdl,rbt); % -> nonlinear mpc & Lee's

% Initialize external torque observer
[ctr] = make_external_torque_observer(rsim, mdl, ctr);

% Initialize position & velocity estimator
[ctr] = make_pos_vel_estimator(rsim, mdl, ctr);

% Initialize UKF
% ukf_sys = create_ukf_sys(force_dist, torque_dist, rbt, mdl, rsim);
[ukf_sys, ukf_s0, ukf_P0_flat, ukf_prediction_time, ukf_use_prediction] = controller_setup_ukf(rbt, mdl, rsim);