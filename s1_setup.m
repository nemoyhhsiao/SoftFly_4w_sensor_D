%% 

clc, clear, close all

% Add path to subfolder
addpath("model","function","torque_observer","estimator","ukf");

% Simulink model
model_name = 'controller14';
load_system(model_name) 

% Load look-up table for thrust to voltage mapping
lut = gen_lut;

% Use simulation or Vicon data
rsim.en = 0;

% Re-run controller (use archived data to rerun the experiment)s4
mdl.rerun = 0;

% Flight time for the model
mdl.flight_time = 10;

% Initialize controller parameters
[ctr, mdl] = make_controller(mdl);

% Initialize model parameters
mdl = make_model(mdl,rsim);

% Initialize robot parameters
rbt = make_robot;

% Initialize sensor parameters
sen = make_sensor(mdl,rsim);

% Initialize robot simulation parameters
[rsim, rbt] = make_simulation(rbt,mdl,rsim);

% Initilaize pre-defined trajectory
traj = make_trajectory(ctr, mdl, rsim);

% Initialize external torque observer
ctr = make_ext_tor_observer(rsim, mdl, ctr);

% Initialize somersault strategy
som = make_somersault(mdl, rsim);

ctr2 = ctr; % some Simulink parameters are from 2-robot controller
rbt2 = rbt; % some Simulink parameters are from 2-robot controller

% Initialize UKF
[ukf_sys, ukf_s0, ukf_P0_flat, ukf_prediction_time, ukf_use_prediction, ukf_params] = controller_setup_ukf(rbt, mdl, rsim);


% Automatically update control parameters for simulation
% if rsim.en
%     set_param(model_name,'SimulationCommand','update')
% end

ctr.DV

%%

% Use simulator or real-time hardware interface
if rsim.en
    set_param(strcat(model_name, '/Flying Simulation'), 'commented', 'off'); % use simulator
    set_param(strcat(model_name, '/UDP send to Arduino'), 'commented', 'on'); % comment out
    set_param(strcat(model_name, '/Vicon UDP receive'), 'commented', 'on'); % comment out
    set_param(strcat(model_name, '/Archived data for rerun'), 'commented', 'on'); % not use saved Vicon data
    set_param(strcat(model_name, '/Goto sim_p for realtime'), 'commented', 'on'); % comment out
    set_param(strcat(model_name, '/Goto sim_Eul_XYZ for realtime'), 'commented', 'on'); % comment out
    set_param(strcat(model_name, '/Goto sim_p for Sim'), 'commented', 'off'); % comment out
    set_param(strcat(model_name, '/Goto sim_Eul_XYZ for Sim'), 'commented', 'off'); % comment out
    set_param(strcat(model_name, '/Goto vicon_measure for rerun'), 'commented', 'on'); % comment out
    set_param(strcat(model_name, '/Goto data_ready for rerun'), 'commented', 'on'); % comment out
    set_param(strcat(model_name, '/Goto vicon_measure for realtime'), 'commented', 'off'); % not use saved Vicon data
    set_param(strcat(model_name, '/Goto data_ready for realtime'), 'commented', 'off'); % not use saved Vicon data
    set_param(strcat(model_name, '/Execution Time'), 'commented', 'on'); % comment out
    set_param(strcat(model_name, '/Goto IMU for realtime'), 'commented', 'on'); 
    set_param(strcat(model_name, '/Goto range_finder for realtime'), 'commented', 'on'); 
    set_param(strcat(model_name, '/Goto optical for realtime'), 'commented', 'on'); 
    set_param(strcat(model_name, '/Goto IMU for sim'), 'commented', 'off'); 
    set_param(strcat(model_name, '/Goto range_finder for sim'), 'commented', 'off'); 
    set_param(strcat(model_name, '/Goto optical for sim'), 'commented', 'off'); 
    warning("-->> using simulator")
    out = sim(model_name, 'SimulationMode','normal');
    s6_analysis

else
    if mdl.rerun
        load('data/20231125/closedloop22.mat')
        set_param(strcat(model_name, '/Flying Simulation'), 'commented', 'on'); % comment out simulator
        set_param(strcat(model_name, '/UDP send to Arduino'), 'commented', 'on'); % use realtime block
        set_param(strcat(model_name, '/Vicon UDP receive'), 'commented', 'on'); % use realtime block
        set_param(strcat(model_name, '/Archived data for rerun'), 'commented', 'off'); % use saved Vicon data to rerun
        set_param(strcat(model_name, '/Goto sim_p for realtime'), 'commented', 'off'); % comment out
        set_param(strcat(model_name, '/Goto sim_Eul_XYZ for realtime'), 'commented', 'off'); % comment out
        set_param(strcat(model_name, '/Goto sim_p for Sim'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Goto sim_Eul_XYZ for Sim'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Goto vicon_measure for rerun'), 'commented', 'off'); % use saved Vicon data to rerun
        set_param(strcat(model_name, '/Goto data_ready for rerun'), 'commented', 'off'); % use saved Vicon data to rerun
        set_param(strcat(model_name, '/Goto vicon_measure for realtime'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Goto data_ready for realtime'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Execution Time'), 'commented', 'on'); % comment out
        disp("-->> using saved Vicon data")
        step2_build
    else
        set_param(strcat(model_name, '/Flying Simulation'), 'commented', 'on'); % comment out simulator
        set_param(strcat(model_name, '/UDP send to Arduino'), 'commented', 'off'); % use realtime block
        set_param(strcat(model_name, '/Vicon UDP receive'), 'commented', 'off'); % use realtime block
        set_param(strcat(model_name, '/Archived data for rerun'), 'commented', 'on'); % not use saved Vicon data
        set_param(strcat(model_name, '/Goto sim_p for realtime'), 'commented', 'off'); % comment out
        set_param(strcat(model_name, '/Goto sim_Eul_XYZ for realtime'), 'commented', 'off'); % comment out
        set_param(strcat(model_name, '/Goto sim_p for Sim'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Goto sim_Eul_XYZ for Sim'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Goto vicon_measure for rerun'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Goto data_ready for rerun'), 'commented', 'on'); % comment out
        set_param(strcat(model_name, '/Goto vicon_measure for realtime'), 'commented', 'off'); % not use saved Vicon data
        set_param(strcat(model_name, '/Goto data_ready for realtime'), 'commented', 'off'); % not use saved Vicon data
        % set_param(strcat(model_name, '/Execution Time'), 'commented', 'off'); % comment out
        set_param(strcat(model_name, '/Goto IMU for realtime'), 'commented', 'off'); 
        set_param(strcat(model_name, '/Goto range_finder for realtime'), 'commented', 'off'); 
        set_param(strcat(model_name, '/Goto optical for realtime'), 'commented', 'off'); 
        set_param(strcat(model_name, '/Goto IMU for sim'), 'commented', 'on'); 
        set_param(strcat(model_name, '/Goto range_finder for sim'), 'commented', 'on'); 
        set_param(strcat(model_name, '/Goto optical for sim'), 'commented', 'on'); 
            warning("-->> using real time Vicon data")
        s2_build
    end
        
end


