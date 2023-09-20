function [ctr] = make_rtnmpc_controller(ctr, mdl)
%MAKE_CONTROLLER Summary of this function goes here
%   Detailed explanation goes here

% MPC and LQR Settings;
% load rtmpc nn params generated via generate_simulink_nn_from_onnx_model
% (following instructions therein)
%ctr.mode = 0; % 0: rtmpc, 2: lqr v3; 1: old lqr, do not use
%ctr.rtmpc.traj = 1; % 0: 'circle, TODO'; 1: 'hover and land'; 2: pos from ctr.setpoint

ctr.rtmpc.max_obs = 2.0;
ctr.rtmpc.max_act = 50.0;
ctr.rtmpc.in_scaling = [10.0*ones(6,1); ones(7,1); ones(4,1)]; % convert m to dm for octabee normalization
ctr.rtmpc.out_scaling = ones(4,1);
ctr.rtmpc.t_max = 2.0; % [s]

% tuning: p2p-v1  -> large overshooting 
% load('evals_octabee_octabee_acrobatics_v0_tiny_anc_hover_simulink_tuning_v1_tmp_dagger_sa_50_dense_True_False_0_intermediate_policy_0_2023_02_23_11_29_06_nnparam.mat');

% tuning: p2p-v2 --> try this -> this is also has some slight tracking
% error
% load('evals_octabee_octabee_acrobatics_v0_tiny_anc_hover_simulink_tuning_v2_tmp_dagger_sa_50_dense_True_False_0_intermediate_policy_0_2023_02_23_12_59_09_nnparam.mat'); 

% tuning: p2p-v3
% load("evals_octabee_octabee_acrobatics_v0_tiny_anc_hover_simulink_tuning_v3_tmp_dagger_sa_50_dense_True_False_0_intermediate_policy_0_2023_02_23_13_17_50_nnparam.mat");

% tuning: p2p-v4 -> hsd position error on x-y 
% load("evals_octabee_octabee_acrobatics_v0_tiny_anc_hover_simulink_tuning_v4_tmp_dagger_sa_50_dense_True_False_0_intermediate_policy_0_2023_02_23_15_20_50_nnparam.mat");

% tuning: p2p-v5 (change from previous: vx from 20 to 100) 
% -> good, but slow response on z; 
% some tracking errors in z during experiment; 
% load("evals_octabee_octabee_acrobatics_v0_tiny_anc_hover_simulink_tuning_v5_tmp_dagger_sa_50_dense_True_False_0_intermediate_policy_0_2023_02_23_15_54_28_nnparam.mat");

% tuning: p2p-v6 (change from previous: vx from 100 to 60 -> half way) ->
% still some small tracking error
% Tested, ok but some altitude error; need toincrease gains
%onnx_modelfile = "tiny_anc_hover_simulink_tuning_v6_dagger_sa_100_intermediate_policy_0";
% onnx_modelfile = "tiny_anc_hover_simulink_tuning_v6_dagger_sa_100_intermediate_policy_0_opset_9";

% **** 2023.03.11 closedloop1 ****
% load("tiny_anc_hover_simulink_tuning_v6_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% point to point, 5 cm with the same gains as p2p-v6

%**** 2023.03.11 closedloop1 ****
% load("tiny_anc_hover_simulink_tuning_v6_dagger_sa_100_intermediate_policy_0_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0.1];
% ctr.rtmpc.max_obs = 2.0;
% ctr.rtmpc.t_max = 2.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0.03];

% **** 2023.03.11 closedloop2 ****
% load("p2p_v10_sa_50_dense_intermediate_policy_0_nnparam.mat");

% **** 2023.03.11 closedloop3 ****
% load("p2p-v12_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% **** 2023.03.13 closedloop3 ****
% load("p2p_v16_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% **** 2023.03.13 closedloop6 ****
% This is a p2p, 10 cm
% load("p2p_v19_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% ***** 2023.03.13 closedloop7 ****
% p2p, 10 cm, with drag force coefficient of 2.2 g s / dm
% load("p2p_v20_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% ***** 2023.03.13 closedloop8 ****
% p2p, 7 cm, drag, more aggressive f_dot (600->800 max, 400->600 safe)
% load("p2p_v21_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% ***** 2023.03.13 closedloop9 ****
% p2p, 7 cm, drag, more aggressive f_dot (1000 max, 800 safe. v max 5 dm/s)
% load("p2p_v23_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% %%%% 2023.03.12 closedloop10 ****
% drag to 3.0
% load("p2p_v24_dagger_sa_100_intermediate_policy_0_nnparam.mat");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% flip v3
% this is the flip learned with the same parameters as p2p-v1 (may not
% work)
%onnx_modelfile = "evals_octabee_octabee_acrobatics_v0_tiny_anc_flip_v3_tmp_dagger_sa_50_dense_True_False_0_intermediate_policy_0_2023_03_08_15_03_38";
%ctr.rtmpc.nnparam = generate_simulink_nn_from_onnx_model(onnx_modelfile, false);

% flip v5 This uses a similar tuning of p2p-v6 (vz = 40 instead of 60?)
% onnx_modelfile = "flip_v5_dagger_sa_100_dense_intermediate_policy_0";

% flip v17 - this uses a tuning simular to p2p - 24
% load("flip_v17_dagger_sa_50_intermediate_policy_0_nnparam.mat");

% flip v18 - slower rotation
% load("flip_v18_dagger_sa_100_intermediate_policy_0_nnparam.mat");

% % flip v22 - take-off landing state machine, slightly larger policy. Wrong
% % take-off spot at 0.2 cm from origin, then navigates to z = 10 cm and flip there
% %load("flip_v22_policy_32_64_shorter_mission_200_hz_tmp_dagger_sa_100_dense_True_False_0_intermediate_policy_1_2023_03_23_12_33_22_nnparam.mat")
% load("flip_v22_dagger_sa_50_intermediate_policy_1_nnparam.mat") % closedloop1 03/23
% ctr.rtnmpc.r0_policy = [0; 0; 0.08]; % inital state of policy, in m. It is [0; 0; 0.1] for everything before 23/03 (up to and including flip 18, p2p 24)

load("flip_v22-hovering_dagger_sa_50_intermediate_policy_2_nnparam.mat")
ctr.rtnmpc.r0_policy = [0; 0; 0.08]; 
ctr.rtmpc.max_obs = 5.0;
ctr.rtmpc.r_origin_offset = [0; 0; 0];

% flip v24 - more aggressive gains x-y pos; faster flip, lower altitdude
% load("flip_v24_dagger_sa_50_intermediate_policy_1_nnparam.mat"); % ->
% worse yaw issue
% ctr.rtnmpc.r0_policy = [0; 0; 0.08];
% ctr.rtmpc.max_obs = 5.0;

% % flip v24 - more aggressive gains x-y pos; faster flip, lower altitdude
% load("flip_v26_dagger_sa_50_intermediate_policy_2_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0.08];
% ctr.rtmpc.max_obs = 5.0;

% load("flip_v27_dagger_sa_100_intermediate_policy_1_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0.05];
% ctr.rtmpc.max_obs = 5.0;


% load("flip_v28_dagger_sa_50_intermediate_policy_1_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0];
% ctr.rtmpc.max_obs = 5.0;

% load("flip_v32_dagger_sa_100_intermediate_policy_2_nnparam");
% ctr.rtnmpc.r0_policy = [0; 0; 0.00];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 1.5; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

% load("flip_v34_dagger_sa_100_intermediate_policy_2_nnparam");
% ctr.rtnmpc.r0_policy = [0; 0; 0.05];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 3.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

% % % flip using 45% max thrust and -55% min thrust --> this next on
% 07/19/23
% load("flip_v33_dagger_sa_100_intermediate_policy_1_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0.0];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 3.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

% load("flip_v34_dagger_sa_100_intermediate_policy_2_nnparam");
% ctr.rtnmpc.r0_policy = [0; 0; 0.05];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 3.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 30 cm fall
% load("fall_v1_dagger_sa_100_intermediate_policy_1_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0.0];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 2.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

% 30 cm fall, attitude gain from 100 to 50
load("fall_v2_dagger_sa_100_intermediate_policy_2_nnparam.mat");
ctr.rtnmpc.r0_policy = [0; 0; 0.0];
ctr.rtmpc.max_obs = 5.0;
ctr.rtmpc.t_max = 2.0; % [s]
ctr.rtmpc.r_origin_offset = [0; 0; 0];

% 20 cm fall, attitude gain from 100 to 50
% load("fall_v3_dagger_sa_100_intermediate_policy_2_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0.0];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 2.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

% % flip using 45% max thrust and -55% min thrust
% load("flip_v33_dagger_sa_100_intermediate_policy_1_nnparam.mat");
% ctr.rtnmpc.r0_policy = [0; 0; 0.0];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 3.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

% load("flip_v36_dagger_sa_100_intermediate_policy_1_nnparam.mat"); 
% ctr.rtnmpc.r0_policy = [0; 0; 0.0];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 3.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

% load("flip_v37_dagger_sa_100_intermediate_policy_2_nnparam.mat"); -->
% also uncommented on 07/19
% ctr.rtnmpc.r0_policy = [0; 0; 0.0];
% ctr.rtmpc.max_obs = 5.0;
% ctr.rtmpc.t_max = 3.0; % [s]
% ctr.rtmpc.r_origin_offset = [0; 0; 0];

ctr.rtmpc.nnparam = nnparam;
% ctr.rtmpc.nnparam = generate_simulink_nn_from_onnx_model(onnx_modelfile);
% ctr.rtmpc.r_origin = [-0.045; -0.052; 0.068];

% for rtnmpc:
ctr.rtnmpc.yaw_fixed_frame.en = false;
ctr.rtnmpc.yaw_fixed_framw.align_on_x = true; % true for flip on x.
ctr.rtnmpc.set_cmd_omega_y_to_zero = false; % will set omega_B(2) = 0
ctr.rtmpc.lim.omega = 60; % rad/s
ctr.rtmpc.lim.f_cmd_norm = 0.95; % percentage of mg

ctr.rtmpc.lim.torque_x = 10e-5;
ctr.rtmpc.lim.torque_y = 10.0e-5;
ctr.rtmpc.lim.torque_z = 0.0;

[ctr.rtnmpc_ang_acc_lp.num, ctr.rtnmpc_ang_acc_lp.den] = butter(2, 90/mdl.f);

%
% low pass filter simulating actuation dela
act_resp_freq = 60; % Hz
[ctr.ukf_act_delay.num, ctr.ukf_act_delay.den] = butter(2, act_resp_freq/mdl.f);

end