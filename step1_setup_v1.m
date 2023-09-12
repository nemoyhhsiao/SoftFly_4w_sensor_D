%% 

clc
clear

% simulink model
mdlName = 'controller13';

% if it shows model not loaded, run the following line in command window
% load_system(mdlName)

% load look-up table
load('thrust2voltage_lut_20230829.mat')

% use simulation or Vicon data
use_simulation = 1;

% set flight time for the model
mdl.flight_time = 8; % actual flapping time
mdl.exe_time    = mdl.flight_time + 6; % computer running time to data logging

% setup controller parameter
[mdl,rbt1,rbt2,ctr1,ctr2,flt,rsim1,rsim2,traj2,som] = step0_fn_setup_v1(mdl.flight_time,mdl.exe_time);

% jumping controller parameters
% mdl.servo_drop_time = 4;
% mdl.leg_length = 0.08;
% mdl.foot_altitude_threshold = 0.02;
% 
% mdl.high_thrust = 940;  % unit: mg 
% mdl.high_thrust2 = 1000;  % unit: mg 
% mdl.low_thrust = 1;   % unit: mg 
% mdl.landing_thrust = 800;  % unit: mg 
% mdl.landing_thrust_climbing = 0.9;  % unit: mg 
% mdl.powered_climbing_time = 0.13;  % unit: s
% 
% mdl.desired_x = 0;
% mdl.desired_y = 0;
% 
% mdl.k1 = 1.25; % jumping model parameter
% mdl.k2 = 2.0; % jumping model parameter
% mdl.k3 = 0.6; % jumping model parameter
% mdl.velocity_limit_ratio = 1;  % controller parameter
% mdl.jumping_altitude = 0.1;
% 
% mdl.predicted_x_factor = 1;
% mdl.predicted_y_factor = 1;
% 
% mdl.landing_counter = 10000;
% mdl.sample_freq= 2000;
% mdl.Filter_FStop = 15;
% mdl.Filter_AStop = 7;
% mdl.Filter_FStop_omega = 10;
% mdl.Filter_Astop_omega = 25;
% 
% % servo control parameters
% servo_config.z_lower_limit = 0.15;
% servo_config.servo_location = [-0.245;0.178;1.03+0.7];
% servo_config.cable_length = 0.8+0.7;
% servo_config.angle_offset = 7;
% servo_config.up_anlge = 110; % 126
% 
% % jumping simulation parameters
% rjsim.m = 1/1000;
% rjsim.g = 9.81;
% rjsim.I = [
%     478,    0,      0; 
%     0,      635,    0;
%     0,      0,      892]/10^9;  % unit: kg/m^2
% rjsim.l_0 = 0.08; % unit: m
% 
% rjsim.p0 = [0,0,0.15]; % 0.251
% rjsim.v0 = [0,0,0];
% rjsim.euler0 = [rad2deg(0.22),rad2deg(0.25),rad2deg(0.09)]/180*pi;
% rjsim.rotm0 = eul2rotm(rjsim.euler0,"ZYX");

% check model timing
if (mdl.exe_time - mdl.flight_time) < 6
    error("-->> execution time is too short")
end

% notify user about which is in use & comment out simulation
if use_simulation == 0
    set_param(strcat(mdlName, '/Jumping Simulation'), 'commented', 'on');
    warning("-->> using Vicon data")
else
    set_param(strcat(mdlName, '/Jumping Simulation'), 'commented', 'off');
    set_param(strcat(mdlName, '/UDP send to Arduino'), 'commented', 'on');
    set_param(strcat(mdlName, '/Vicon UDP receive'), 'commented', 'on');
    set_param(strcat(mdlName, '/servo control'), 'commented', 'on');
    set_param(strcat(mdlName, '/sync with Speedgoat'), 'commented', 'on');
    error("-->> using simulator")
end
