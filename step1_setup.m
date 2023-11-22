%% 

clc
clear
close all

% Add path to subfolder
addpath("model");
addpath("function");
addpath("torque_observer")

% Simulink model
model_name = 'controller14';
load_system(model_name) % if it shows model not loaded, run this line in command window

% Load look-up table for thrust to voltage mapping
load('t2v_lut_20231027.mat')

% Use simulation or Vicon data
rsim.en = 1;

% Flight time for the model
flight_time = 20;

% Initialize controller parameters
[ctr, flight_time] = make_controller(flight_time);

% Initialize model parameters
mdl = make_model(flight_time,rsim);

% Initialize robot parameters
rbt = make_robot;

% Initialize robot simulation parameters
rsim = make_simulation(rbt,mdl,rsim);

% Initilaize pre-defined trajectory
traj = make_trajectory(ctr, mdl);

% Initialize external torque observer
ctr = make_ext_tor_observer(rsim, mdl, ctr);

ctr2 = ctr; % some Simulink parameters are from 2-robot controller
rbt2 = rbt; % some Simulink parameters are from 2-robot controller

% Lower sample time for simulation (to save time)
if rsim.en
    mdl.T_high = mdl.T;
end

% set_param(model_name,'SimulationCommand','update')

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
    warning("-->> using simulator")
    out = sim(model_name, 'SimulationMode','normal');
    step6_analysis_v1

else
    if mdl.rerun
        load('data/400s/400s_archived_data.mat')
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
        step2_build_v1
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
        set_param(strcat(model_name, '/Execution Time'), 'commented', 'off'); % comment out
        warning("-->> using real time Vicon data")
        step2_build_v1
    end

    % if flight_time > 100
        
end


