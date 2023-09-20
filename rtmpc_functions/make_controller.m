function [ctr] = make_controller(ctr, mdl)
%MAKE_CONTROLLER Summary of this function goes here
%   Detailed explanation goes here

% MPC and LQR Settings;
% load rtmpc nn params generated via generate_simulink_nn_from_onnx_model
% (following instructions therein)
ctr.mode = 0; % 0: rtmpc, 2: lqr v3; 1: old lqr, do not use
ctr.rtmpc.traj = 1; % 0: 'circle, TODO'; 1: 'hover and land'; 2: pos from ctr.setpoint

if ctr.rtmpc.traj == 0
    % circle -- TODO
%     load('octabee_v2_circle_v1_tmp_dagger_sa_200_0_intermediate_policy_0_2022_08_31_23_11_26_nnparam.mat')
    load('octabee_v2_circle_v1_tmp_dagger_sa_200_0_intermediate_policy_0_2022_09_08_22_08_37_18_e3_pos_gain_nnparam.mat')
    ctr.rtmpc.in_scaling = [10, 10, 10, 10, 10, 10, 1, 1, 1, 1]';
    ctr.rtmpc.out_scaling = [1; 1; 0.1*9.8065]; % last entry is 1 because we output in m/s^2 directly...
    ctr.rtmpc.ref_len = 50;  % prediction horizon
    ctr.rtmpc.pred_T = 0.02; % [s]
elseif ctr.rtmpc.traj == 1 || ctr.rtmpc.traj == 2
    % hover, new parameters
%     load('octabee_v2_hover_v2_tmp_dagger_sa_50_0_intermediate_policy_0_2022_08_31_10_35_53_nnparam.mat')
%     load('octabee_v2_hover_v2_tmp_dagger_sa_200_0_intermediate_policy_0_2022_08_31_19_25_43_nemo_tuning_nnparam')
    load('octabee_v2_hover_v2_tmp_dagger_sa_200_0_intermediate_policy_0_2022_08_31_20_28_16_p_9_omega_40_nnparam.mat')
    ctr.rtmpc.in_scaling = [10, 10, 10, 10, 10, 10, 1, 1, 1, 1]';
    ctr.rtmpc.out_scaling = [1; 1; 0.1*9.8065]; % last entry is 1 because we output in m/s^2 directly...
    ctr.rtmpc.ref_len = 50;  % prediction horizon
    ctr.rtmpc.pred_T = 0.02; % [s]
else
    disp('trajectory not recognized!')
end

ctr.rtmpc.max_obs = 2.0;
ctr.rtmpc.max_act = 50.0;
%ctr.rtmpc.in_scaling = [10.0*ones(6,1); ones(7,1); ones(4,1); ones(3,1); 1]; % convert m to dm for octabee normalization
ctr.rtmpc.in_scaling = [10.0*ones(6,1); ones(7,1); ones(4,1)]; % convert m to dm for octabee normalization
ctr.rtmpc.out_scaling = ones(4,1);
ctr.rtmpc.t_max = 1.0; % [s]
ctr.rtmpc.state_predictor.active = 0;  % 0 to turn off

load('evals_octabee_octabee_acrobatics_v0_tiny_anc_hovering_v2_tmp_dagger_sa_20_facets_True_False_0_intermediate_policy_0_2023_02_15_23_43_56_nnparam.mat');

ctr.rtmpc.nnparam = nnparam;
ctr.rtmpc.r_origin = [-0.023; -0.095; 0.073];
ctr.rtmpc.lim.att = pi/8.0;
ctr.rtmpc.acc_max = mdl.g*1.5;
ctr.rtmpc.acc_min = mdl.g*0.5;
ctr.rtmpc.compensate_attitude = 1;
ctr.rtmpc.init = 0;

% Add LQR gain
% ctr.lqr.K = octabee_position_LQR(mdl.T);
% ctr.lqr.in_scaling = ones(8, 1);
% ctr.lqr.out_scaling = ones(3, 1);

% 8 state LQR
ctr.lqrv2.K = octabee_position_LQR_v2(mdl.T);
ctr.lqrv2.in_scaling = [10, 10, 10, 10, 10, 10, 1.0, 1.0]';
ctr.lqrv2.out_scaling = [1.0, 1.0, 0.1]';

% 10 state LQR
ctr.lqr.K = octabee_position_LQR_v3(mdl.T);
ctr.lqr.in_scaling = [10, 10, 10, 10, 10, 10, 1.0, 1.0, 1.0, 1.0]';
ctr.lqr.out_scaling = [1.0, 1.0, 0.1]';

% Add Lee controller tuning
% Lee pos + att
%ctr.lee.kR = 1.e-6*diag([10.0, 40.0, 0.0]) %*2.0;  % rotation error [10, 40, 0.0]
%ctr.lee.kOmega = 1.e-6*diag([1.0, 4.0, 0.0]) %*1.4; % angular velocity error [3, 12, 0]
%ctr.lee.pos.kx = -1e-2*diag([1.0, 1.0, 6.4]);
%ctr.lee.pos.kv = -1e-3*diag([3.0, 3.0, 24.0])*1.2;

%ctr.lee.kR = 1.e-6*diag([15.0, 50.0, 0.0])*1.0; %*2.0;  % rotation error [10, 40, 0.0]
%ctr.lee.kOmega = 1.e-6*diag([3.5, 13.5, 0.0]); %*1.4; % angular velocity error [3, 12, 0]

% ctr.lee.kR = 1.e-6*diag([10.0, 40.0, 0.0]);  % rotation error
% ctr.lee.kOmega = 1.e-6*diag([3.0, 12.0, 0.0]); % angular velocity error

%% Lee rtmpc
ctr.lee.kR = 1.e-6*diag([10.0, 40.0, 0.0]); %*2.0;  % rotation error [10, 40, 0.0]
ctr.lee.kOmega = 1.e-6*diag([3.0, 12.0, 0.0]); %*1.4; % angular velocity error [3, 12, 0]
ctr.lee.pos.kx = -7.0e-3*diag(ones(3,1));
ctr.lee.pos.kv = -5.82e-3*diag(ones(3,1));

%% PD attitude controller
p_gain = 10.*1.6;
d_gain = 3.0*1.0;
frac = 0.4187;
%ctr.att_pid_e = -1e-6*[20.0, 40.0, 0.0]*1.6;
%ctr.att_pid_e_dot = -1e-6*[6.0, 12.0, 0.0]*0.9;
ctr.att_pid_e = -1e-6*[p_gain, p_gain/frac, 0.0];
ctr.att_pid_e_dot = -1e-6*[d_gain, d_gain/frac, 0.0];

end

