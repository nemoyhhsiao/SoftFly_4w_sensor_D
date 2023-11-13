%% 

clc
clear
% close all

% add path to subfolder
addpath('./model');
addpath('./function');
load('thrust2voltage_lut_20230829.mat')

% set flight time for the model
flight_time = 2;

[mdl,rbt,ctr,flt,rsim,som] = controller_setup_v5(flight_time);
[ctr] = make_external_torque_observer(rsim, mdl, ctr);


%% select target (SpeedGoat)

mdlName = 'controller_v13';

% connect to target
connect(tg);

%% build model
load_system(mdlName);
set_param(strcat(mdlName, '/Real-Time Interfaces'), 'commented', 'off');
slbuild(mdlName);
