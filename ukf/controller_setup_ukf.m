function [ukf_sys, ukf_s0, ukf_P0_flat, ukf_prediction_time, ukf_use_prediction, ukf_params] = controller_setup_ukf(rbt, mdl, rsim)

%% UKF options

ukf_params = struct();

% Q closed loop, noise, no disturbances
% Q_translation_val = 1e-8;
% Q_rotation_val = 1e-14;

% Q closed loop, noise, disturbances
% Not very sensitive to Q_p_val and Q_p_dot_val
% Extremely sensitive to Q_e_val (and to an extent Q_omega)
% Extremely sensitive to initial P and s, as well, so make sure to change those

% Q_F_ext and Q_tau_ext are determined by the ground truth disturbances

% Q
% ukf_params.Q_p = 1e-4;
% ukf_params.Q_p_dot = 1e-2;
% ukf_params.Q_F_ext = 1e-6;

% ukf_params.Q_dp = 1e-5;
% ukf_params.Q_omega = 5e-1;
% ukf_params.Q_tau_ext = 5e-13;

ukf_params.Q_p       = 1e-6;
ukf_params.Q_p_dot   = 1e-7;
ukf_params.Q_F_ext   = 5e-6; % 5e-5 (05.22 20:45) 
ukf_params.Q_dp      = 1e-3;
ukf_params.Q_omega   = 1e-1; % e-5
ukf_params.Q_tau_ext = 1e-13; % was 10e-13

% ukf_params.Q_p = 1e-9;
% ukf_params.Q_p_dot = 1e-9;
% ukf_params.Q_F_ext = 1e-9;

% ukf_params.Q_dp = 1e-11;
% ukf_params.Q_omega = 1e-11;
% ukf_params.Q_tau_ext = 9e-11; %1e-11

% ukf_params.Q_p = 1e-11;
% ukf_params.Q_p_dot = 1e-11;
% ukf_params.Q_F_ext = 1e-11; % no smaller than 1e-11?

% ukf_params.Q_dp = 1e-9;
% ukf_params.Q_omega = 1e-15; % Why does this have no effect?
% ukf_params.Q_tau_ext = 1e-13; % no smaller than 1e-12?


% P0
ukf_params.P0_p       = 1e-8;
ukf_params.P0_p_dot   = 1e-8;
ukf_params.P0_F_ext   = 1e-8;

ukf_params.P0_dp      = 1e-3;
ukf_params.P0_omega   = 1e-8;
ukf_params.P0_tau_ext = 1e-8;

% R
if rsim.sensing_noise.pos.enable
    ukf_params.R_p = rsim.sensing_noise.pos_sigma(1);
else
    ukf_params.R_p = 0.5e-5; %1e-11*1e13;
end
if rsim.sensing_noise.rpy.enable
    ukf_params.R_dp = rsim.sensing_noise.rpy_sigma(1);
else
    ukf_params.R_dp = 1e-4; % 1e-11*1e13;
end

ukf_params.R_omega = rsim.sensing_noise.rpy_sigma(1)*sqrt(2)/(1/400) *5; %1e-2*1e4;

% Misc params
ukf_params.mrp_a  = 0.5;
ukf_params.lambda = 2;

ukf_params.c_dv = 0.0014; % rbt.drag_force exists, but isn't actually used in simulink dynamics?
% FOR ON-ROBOT DEPLOYMENT: SET TO 0.0035
% ukf_params.c_dv = 0; % rbt.drag_force exists, but isn't actually used in simulink dynamics?
% FOR ON-ROBOT DEPLOYMENT: SET TO 7e-7 
ukf_params.c_domega = 2.5e-7;

% Safety
ukf_params.max_P_val = -1;

% Initialize the system
ukf_sys = UKF.initialize_ukf_sys(rbt, mdl, ukf_params);

% Set initial conditions properly
ukf_s0 = ukf_sys.s0;
ukf_P0_flat = UKF.flatten_matrix(ukf_sys.P0);

% Set initial prediction time (units are seconds)
ukf_prediction_time = 0.007; % Get rid of some sensing delay
ukf_use_prediction = -1; % -1 to disable

if ukf_prediction_time > 0.025
    error("estimated time too long")
end

end