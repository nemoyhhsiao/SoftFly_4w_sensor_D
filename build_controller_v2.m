%% 

clc
clear

load('thrust2voltage_lut_20230809.mat')
load('MoI.mat')

mdlName = 'controller13';

% set flight time for the model
mdl.flight_time = 2;
mdl.exe_time    = 20;

% setup controller parameter
[mdl,rbt1,rbt2,ctr1,ctr2,flt,rsim1,rsim2,traj2,som] = controller_setup_v5(mdl.flight_time,mdl.exe_time);

% bsn customized parameters

mdl.leg_length = 0.08;
mdl.foot_altitude_threshold = 0.03;

mdl.high_thrust = 550;  % unit: mg 
mdl.low_thrust = 1;   % unit: mg 
mdl.landing_thrust = 800;  % unit: mg 
mdl.landing_thrust_climbing = 1;  % unit: mg 
% mdl.powered_climbing_time = 0.17;  % unit: s
mdl.powered_climbing_time = 0.13;  % unit: s

mdl.desired_x = 0;
mdl.desired_y = 0;

mdl.k1 = 1.25; % jumping model parameter
mdl.k2 = 2.3; % jumping model parameter
mdl.k3 = 0.6; % jumping model parameter
mdl.velocity_limit_ratio = 0.3;  % controller parameter
mdl.jumping_altitude = 0.12;

mdl.landing_counter = 10000;
mdl.sample_freq= 2000;
mdl.Filter_FStop = 15;
mdl.Filter_AStop = 7;
mdl.Filter_FStop_omega = 10;
mdl.Filter_Astop_omega = 25;


servo_config.z_lower_limit = 0.2;
servo_config.servo_location = [0.020;-0.015;1.03];
servo_config.cable_length = 0.75;
servo_config.angle_offset = 7;
servo_config.up_anlge = 126;


m = 1/1000;
g = 9.81;
I = [
    635,    0,      0; 
    0,      478,    0;
    0,      0,      892]/10^9;  % unit: kg/m^2
l_0 = 0.08; % unit: m

p0 = [0,0,0.241];
v0 = [0,0,0];

euler0 = [0,0,0]/180*pi;
rotm0 = eul2rotm(euler0,"ZYX");

