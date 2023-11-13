%% 

clc
clear

% Add path to subfolder
addpath('model');
addpath('function');
addpath("torque_observer")

% Simulink model
model_name = 'controller14';
load_system(model_name) % if it shows model not loaded, run the following line in command window

% Load look-up table for thrust to voltage mapping
load('t2v_lut_20231027.mat')

% Use simulation or Vicon data
rsim.en = 0;

% Flight time for the model
flight_time = 0.5;

% Initialize controller parameters
[ctr, flight_time] = make_controller(flight_time);

% Initialize model parameters
mdl = make_model(flight_time,rsim);

% Initialize robot parameters
rbt = make_robot(mdl);

% Initialize robot simulation parameters
rsim = make_robot_simulation(rbt,mdl,rsim);

% Initialize external torque observer
ctr = make_external_torque_observer(rsim, mdl, ctr);

ctr2 = ctr;
rbt2 = rbt;

% Check model timing
if (mdl.exe_time - mdl.flight_time) < 6
    error("-->> execution time is too short")
end

% set_param(model_name,'SimulationCommand','update')

%%
% set_param('controller_v13', 'SimulationCommand', 'start');
% out = sim('controller_v13','SimulationMode','normal'); % RapidAccelerator

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
    warning("-->> using simulator")
    out = sim(model_name, 'SimulationMode','normal');

else
    if mdl.rerun
        load('39s_failed/archived_data.mat')
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
        disp("-->> using saved Vicon data")
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
        warning("-->> using real time Vicon data")
    end

    % if flight_time > 100
        
end


