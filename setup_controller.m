%% 
% close all; clear all; clc;
addpath("rtnmpc")
addpath("rtnmpc/nn_weigths")
addpath("torque_observer")
addpath("pos_vel_estimator")
addpath("ukf")


% todo:
% #1 function for each class

% ex: [mdl] = make_model(ctr)
% [rbt] = make_robot()
% [ctr] = make_controller()
% [rsim] = make_robot_simulation()

% get rid of controller_setup_v5


[mdl,rbt,ctr,flt,rsim,som] = controller_setup_v5(flight_time);

U_max = 300;

%% Deploy
r0 = [-0.045; -0.090; 0.083];        % initial position of Softfly, in [m]
% r_origin_offset = [0.0; 0.0; 0.0]; % in [m]. Desired change in position from the initial position r0. 
%                                      % This is is where the Softly will go when learning a step; 

[ctr] = make_rtnmpc_controller(ctr, mdl); % -> nonlinear mpc
% [ctr] = make_controller(ctr, mdl); -> linear mpc

[ctr] = make_external_torque_observer(rsim, mdl, ctr);
[ctr] = make_pos_vel_estimator(rsim, mdl, ctr);

% % For existing controller, do not change for MPC
% rd = r0(:) + des_pos_change(:);
% ctr.setpoint.x = rd(1);
% ctr.setpoint.y = rd(2);
% ctr.setpoint.z = rd(3);

% ctr.rtmpc.r_origin_offset = r_origin_offset(:); % Position of the origin for rtnmpc, in [m].

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


% Sensing noise in obsever: 
rsim.sensing_noise.pos.enable = 1;
rsim.sensing_noise.rpy.enable = 1;
rsim.sensing_noise.pos_sigma = 0.03e-3*ones(3, 1); % 0.5 mm
rsim.sensing_noise.rpy_sigma = 0.5*ones(3, 1)/180*pi; % 0.5 deg
rsim.sensing_noise.pos.enable = 1;
rsim.sensing_noise.rpy.enable = 1;

ctr.baseline = 0;
ctr.adaptive_saturation.enable = 1;
ctr.adaptive_saturation.Q = diag([1e2*0.5, 1e5*10, 1e5*5.0]); 
% rsim.dist.wx.mean = 1.0*1.0e-5;
% rsim.dist.wy.mean = 1.0*1.0e-5;
ctr.rtmpc.lim.att = pi/6.0;
ctr.torque_obs.enable = 1;
ctr.torque_obs.factor = 1;
% ctr.mode = 2; % 0: rtmpc; 1: lqr v2; 2: lqr v3.




% Pakpong's attitude gains
%ctr.gain.at3 = 0.1;				% attitude controller's lambda
%ctr.gain.at2 = 1;

% Initialize UKF
% ukf_sys = create_ukf_sys(force_dist, torque_dist, rbt, mdl, rsim);
[ukf_sys, ukf_s0, ukf_P0_flat, ukf_prediction_time, ukf_use_prediction] = controller_setup_ukf(rbt, mdl, rsim);

