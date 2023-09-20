%% 

clc
clear
% close all

% add path to subfolder
addpath('./model');
addpath('./function');
% addpath('E:\Dropbox\Shared\External\share_with_Andrea\octobee_control_collab\2022_07_26_simple_lee_hovering_test\octobee_control');

% set flight time for the model
flight_time = 2;
% setup controller parameter
% [mdl,rbt,ctr,flt,rsim,som] = controller_setup_v3(flight_time);
[mdl,rbt,ctr,flt,rsim,som] = controller_setup_v5(flight_time);

run_controller

%% select target (SpeedGoat)
tg      = slrealtime('TargetPC1');
mdlName = 'controller_v13';

% connect to target
connect(tg);

%% build model
load_system(mdlName);
set_param(strcat(mdlName, '/Real-Time Interfaces'), 'commented', 'off');
slbuild(mdlName);
