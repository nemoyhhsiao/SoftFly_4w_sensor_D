%% 

clc, clear, close all

% Add path to subfolder
addpath("model","function","torque_observer");

% Simulink model
model_name = 'controller14';
load_system(model_name) 

% Load look-up table for thrust to voltage mapping
lut = gen_lut;

% Use simulation or Vicon data
rsim.en = 0;

% Re-run controller (use archived data to rerun the experiment)
mdl.rerun = 0;

% Flight time for the model
mdl.flight_time = 5;

% Initialize controller parameters
[ctr, mdl] = make_controller(mdl);

% Initialize model parameters
mdl = make_model(mdl,rsim);

% Initialize robot parameters
rbt = make_robot;

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

% Automatically update control parameters for simulation
% if rsim.en
%     set_param(model_name,'SimulationCommand','update')
% end

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
    step6_analysis

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
        set_param(strcat(model_name, '/Execution Time'), 'commented', 'off'); % comment out
        warning("-->> using real time Vicon data")
        s2_build
    end
        
end


