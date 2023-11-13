%% Trigger the model
% clc
addpath('./model');
addpath('./function');

load(tg,mdlName);
disp(' ')
disp('#### model loaded ####')

%%
% rbt.DV = [-600 -600 -600 -600]; 
% rbt.DV = [-400 -400 -400 -400]; 
% rbt.DV = [-300 -300 -300 -300]; 
% rbt.DV = [60 0 0 0]; 


rbt.DV = [90 78 -176 106];  % Nemo37

setparam(tg,'','rbt.DV',rbt.DV)

rsim.en = 0;
setparam(tg,'','rsim.en',rsim.en)

% ctr.adaptive_saturation.Q = diag([1e2*1, 1e5*10, 1e5*1]); 
% setparam(tg,'','ctr.adaptive_saturation.Q',ctr.adaptive_saturation.Q)
% 
% rbt.DV = [-35 -120 -95 -60];  % Nemo31
% 
% rbt.m        = 4*180e-6;
% rbt.offset.x = deg2rad(0); % last flight by KC: -0.3
% rbt.offset.y = deg2rad(0);
% rbt.base.th  = 0.0*rbt.m; % 0.2 at 10cm
% rbt.base.xt  = 0.0*1e-5;			
% rbt.base.yt  = 0.0*1e-5; % last flight by KC: -0.2
% rbt.base.zt  = 0.0*1e-5;
% 
% mdl.freq_vec = [380 380 380 380];
% 
ctr.safety.T        = 0.5; % 0.04 / 100
setparam(tg,'','ctr.safety.T',ctr.safety.T)
% ctr.safety.volt     = [1800 1800 1800 1800]';
% ctr.safety.land.volt = 1750;
% 
% 
% ctr.lee.kR = 1.e-6*diag([18*0.7083, 54*0.9227, 0.0])*1.65*1.5;  % rotation error 
% ctr.lee.kOmega = 1.e-6*diag([3.0*0.7083, 9*0.9227, 0.0])*0.85*1.5; % angular velocity error
% 
% 
% ctr.setpoint.x   = -0.023;
% ctr.setpoint.y   = -0.094;
% ctr.setpoint.z   = 0.08;
% ctr.setpoint.yaw = deg2rad(0);

% ==================================================================

% ctr.takeoff.en     = 1;
% ctr.takeoff.height = 0.14; %0.008; 
% ctr.takeoff.time   = 1;
% 
% ctr.landing.en     = 0;
% ctr.landing.height = -0.02;
% ctr.landing.time   = 1; 

% ctr.gain.al0 = 150*0.8; % 0.8
% ctr.gain.al1 = 30*0.6;  % 0.6
% 
% ctr.yaw.en          = 0;
% ctr.yaw.dy.en       = 0;
% ctr.yaw.dy.angle    = deg2rad([0 -45 0 0 0]);
% ctr.yaw.dy.duration = [1 1 1 1 1];
% ctr.yaw.dy.trans    = [1 1 1 1];
% ctr.lim.tauz        = 4e-6*5;
% 
% ctr.gain.at3 = 62    *0.55; % old: 0.501
% ctr.gain.at2 = 798   *0.48; % old: 0.585
% ctr.gain.at1 = 6631  *0.65; %0.75
% ctr.gain.at0 = 13608 *1.4; %0.75
% ctr.gain.ati = 0.5e4*0.001;
% 
% ctr.gain.yaw.fw = 1.78e-5*1.25;
% ctr.gain.yaw.p  = 8e-6*4.0;  
% ctr.gain.yaw.d  = 8e-6*0.55;
% ctr.gain.yaw.i  = 8e-9*0; % 0.4
% ctr.integral.yaw.upper = 4e-6*0.5;
% ctr.integral.yaw.lower = -4e-6*0.5;

if ctr.en == 0
    rbt.base.th = mdl.g*rbt.m*cosd(rbt.til);
end
% [1 62 798 6631 13608]
% [1 62*0.55 798*0.48 6631*0.65 13608*1.4]
%% ================================
if 0
setparam(tg,'','rbt.DV',rbt.DV)
setparam(tg,'','rbt.m',rbt.m)
setparam(tg,'','rbt.base.th',rbt.base.th)
setparam(tg,'','rbt.base.xt',rbt.base.xt)
setparam(tg,'','rbt.base.yt',rbt.base.yt)
setparam(tg,'','rbt.base.zt',rbt.base.zt)
setparam(tg,'','rbt.offset.x',rbt.offset.x)
setparam(tg,'','rbt.offset.y',rbt.offset.y)
setparam(tg,'','mdl.freq_vec',mdl.freq_vec)
setparam(tg,'','ctr.safety.T',ctr.safety.T)
setparam(tg,'','ctr.safety.volt',ctr.safety.volt)
setparam(tg,'','ctr.safety.land.volt',ctr.safety.land.volt)
setparam(tg,'','ctr.setpoint.x',ctr.setpoint.x)
setparam(tg,'','ctr.setpoint.y',ctr.setpoint.y)
setparam(tg,'','ctr.setpoint.z',ctr.setpoint.z)
setparam(tg,'','ctr.setpoint.yaw',ctr.setpoint.yaw)
% setparam(tg,'','ctr.gain.al0',ctr.gain.al0)
% setparam(tg,'','ctr.gain.al1',ctr.gain.al1)
% setparam(tg,'','ctr.landing.en',ctr.landing.en)
% setparam(tg,'','ctr.landing.height',ctr.landing.height)
% setparam(tg,'','ctr.landing.time',ctr.landing.time)
% setparam(tg,'','ctr.takeoff.en',ctr.takeoff.en)
% setparam(tg,'','ctr.takeoff.height',ctr.takeoff.height)
% setparam(tg,'','ctr.takeoff.time',ctr.takeoff.time)
% setparam(tg,'','ctr.yaw.en',ctr.yaw.en)
% setparam(tg,'','ctr.yaw.dy.en',ctr.yaw.dy.en)
% setparam(tg,'','ctr.yaw.dy.angle',ctr.yaw.dy.angle)
% setparam(tg,'','ctr.yaw.dy.duration',ctr.yaw.dy.duration)
% setparam(tg,'','ctr.yaw.dy.trans',ctr.yaw.dy.trans)
% setparam(tg,'','ctr.lim.tauz',ctr.lim.tauz)
% setparam(tg,'','ctr.gain.at3',ctr.gain.at3)
% setparam(tg,'','ctr.gain.at2',ctr.gain.at2)
% setparam(tg,'','ctr.gain.at1',ctr.gain.at1)
% setparam(tg,'','ctr.gain.at0',ctr.gain.at0)
% setparam(tg,'','ctr.gain.ati',ctr.gain.ati)
% setparam(tg,'','ctr.gain.yaw.p',ctr.gain.yaw.p)
% setparam(tg,'','ctr.gain.yaw.d',ctr.gain.yaw.d)
% setparam(tg,'','ctr.gain.yaw.i',ctr.gain.yaw.i)
% setparam(tg,'','ctr.gain.yaw.fw',ctr.gain.yaw.fw)
% setparam(tg,'','ctr.integral.yaw.upper',ctr.integral.yaw.upper)
% setparam(tg,'','ctr.integral.yaw.lower',ctr.integral.yaw.lower)
setparam(tg,'','ctr.lee.kR',ctr.lee.kR)
setparam(tg,'','ctr.lee.kOmega',ctr.lee.kOmega)
% setparam(tg,'','rsim.delay.en',rsim.delay.en)
% setparam(tg,'','rsim.delay.time',rsim.delay.time)

% ================================
disp(' ')
disp('#### model parameters set ####')
end
% 
% %%
% % actually start
% start(tg,'StopTime',Inf);
% 
% % check_error = 1;
% % while check_error
% %     disp('in while loop')
% % %     if isempty(tg.TargetStatus.Error) ~= 1
% % %         warning('#### Target Error ####')
% % %         check_error = 0;
% % %         break
% % %     end
% %     if tg.TargetStatus.State == "IDLE" && tg.ModelStatus.State == "DONE"
% %         disp('execution completed successfully')
% %         check_error = 0;
% %         break
% %     end
% % end
% % disp('out of while')
% pause(mdl.rt+2);
% 
% 
% 
% %% Save data
% 
% % log data from 
% YawPD          = logsout.FileLogSignals{1}.Values.Data;
% Observer       = logsout.FileLogSignals{2}.Values.Data;
% rd             = logsout.FileLogSignals{3}.Values.Data(:,1);
% rd_dot         = logsout.FileLogSignals{3}.Values.Data(:,2);
% Time           = logsout.FileLogSignals{4}.Values.Time;
% Voltage        = logsout.FileLogSignals{4}.Values.Data;
% En             = logsout.FileLogSignals{5}.Values.Data;
% Measurement    = logsout.FileLogSignals{6}.Values.Data;
% DrivingSignals = logsout.FileLogSignals{7}.Values.Data;
% Torque         = logsout.FileLogSignals{8}.Values.Data;
% 
% % details for saving data
% folder   = "data/";
% robot    = "Nemo6_";
% date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
% filetype = ".mat";
% 
% % save data
% filename = folder + robot + date + filetype;
% save(filename,'Time','Voltage','Measurement','DrivingSignals','Torque','rbt','som','ctr','En','rd','rd_dot','YawPD','Observer');
% 
% % show in command windows
% disp(' ')
% disp(' ')
% disp(' ')
% disp('======================================================')
% disp('Flight data successfully saved in the "data" folder as')
% disp("-->  " + robot + "flight_" + date + filetype)
% disp('======================================================')
% disp(' ')
% 
% 
% %% Error detaction
%  
% if isempty(tg.TargetStatus.Error) ~= 1
%     warning('#### Target Error ####')
%     warning('#### Dangerous! Switch off the safety box! ####')
%     target.error = tg.TargetStatus.Error;
%     load(tg,'forced_stop')
%     start(tg,'StopTime',0.1);
%     warning(target.error);
% end
% %%
% if 0
%     
%     % details for saving data
%     folder   = "D:\Nemo\Video\Flight\2021\";
%     control  = "openloop1_";
%     robot    = "Nemo2_";
%     date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
%     filetype = ".mat";
% 
%     % save data
%     filename = folder + control + robot + date + filetype;
%     save(filename,'Time','Voltage','Measurement','DrivingSignals','Torque','rbt','som','ctr','En','rd');
% 
% end