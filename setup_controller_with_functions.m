% Initialize model parameters
mdl = make_model(flight_time);

% Initialize robot parameters
rbt = make_robot();

% Initialize controller parameters
ctr = make_controller();

% Initialize robot simulation parameters
rsim = make_robot_simulation();

U_max = 300;

%% Deploy
r0 = [-0.045; -0.090; 0.083];

[ctr] = make_rtnmpc_controller(ctr, mdl); % -> nonlinear mpc
% [ctr] = make_controller(ctr, mdl); -> linear mpc

[ctr] = make_external_torque_observer(rsim, mdl, ctr);
[ctr] = make_pos_vel_estimator(rsim, mdl, ctr);

% =========================================================================
% [ctr] = make_lee_controller()
% Let's make sure the inertia matches the robot's
ctr.lee.ixx = rsim.rbt.ixx;
ctr.lee.iyy = rsim.rbt.iyy;
ctr.lee.izz = rsim.rbt.izz;
ctr.lee.ang_acc_ff = 1;
% I have added noise to state estimation. 
frac = 0.4;
ctr.lee.kR = 1.e-6*diag([18*0.7083, 54*0.9227, 0.0])*1.65*1.3; %*2.0; %*2.0;  % rotation error [10, 40, 0.0]
%ctr.lee.kOmega = 1.e-6*diag([3.0*0.7083, 9*0.9227, 0.0])*0.85*1.3*1.5; % setup used for p2p up to closed loop 10
ctr.lee.kOmega = 1.e-6*diag([3.5*3.0, 13.7*3.0, 0.0]);
% =========================================================================

% Pakpong's attitude gains
%ctr.gain.at3 = 0.1;				% attitude controller's lambda
%ctr.gain.at2 = 1;

% Initialize UKF
% ukf_sys = create_ukf_sys(force_dist, torque_dist, rbt, mdl, rsim);
[ukf_sys, ukf_s0, ukf_P0_flat, ukf_prediction_time, ukf_use_prediction] = controller_setup_ukf(rbt, mdl, rsim);