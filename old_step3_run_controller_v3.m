%% start target

start(tg,'StopTime',mdl.rt+2);

%%
while 1
    disp('model running')
    pause(0.5)
    if isempty(tg.TargetStatus.Error) ~= 1
        stop(tg)
        warning('#### Target Error ####')
        break
    end
    if tg.ModelStatus.State == "DONE" %&& tg.TargetStatus.State == "IDLE"
        disp(' '); disp('execution completed successfully'); disp(' ');
        break
    end
end

%% Save data

pause(1)

% log data from 
% Observer       = logsout.FileLogSignals.getElement('observer').Values.Data;
% rd             = logsout.FileLogSignals.getElement('rd').Values.Data(:,1:3);
% rd_d           = logsout.FileLogSignals.getElement('rd').Values.Data(:,4:6);
% Time           = logsout.FileLogSignals.getElement('voltage').Values.Time;
% Voltage        = logsout.FileLogSignals.getElement('voltage').Values.Data;
% En             = logsout.FileLogSignals.getElement('en').Values.Data;
% Measurement    = logsout.FileLogSignals.getElement('measurement').Values.Data;
% DrivingSignals = logsout.FileLogSignals.getElement('driving signal').Values.Data;
% DS_Time        = logsout.FileLogSignals.getElement('driving signal').Values.Time;
% Torque         = logsout.FileLogSignals.getElement('torque').Values.Data;
% Vicon          = logsout.FileLogSignals.getElement('vicon').Values.Data;
% VC             = logsout.FileLogSignals{10}.Values.Data;

Observer       = logsout.LiveStreamSignals.getElement('observer').Values.Data;
Time           = logsout.LiveStreamSignals.getElement('voltage').Values.Time;
Voltage        = logsout.LiveStreamSignals.getElement('voltage').Values.Data;
En             = logsout.LiveStreamSignals.getElement('en').Values.Data;
Measurement    = logsout.LiveStreamSignals.getElement('measurement').Values.Data;
DrivingSignals = logsout.LiveStreamSignals.getElement('driving signal').Values.Data;
DS_Time        = logsout.LiveStreamSignals.getElement('driving signal').Values.Time;
Torque         = logsout.LiveStreamSignals.getElement('torque').Values.Data;
% Vicon          = logsout.LiveStreamSignals.getElement('vicon').Values.Data;
if 1
    NMPC_log.cmd_vel = logsout.LiveStreamSignals.getElement('B_omega_d').Values.Data;
    NMPC_log.f_cmd   = logsout.LiveStreamSignals.getElement('f_cmd').Values.Data;
    NMPC_log.F_ext   = logsout.LiveStreamSignals.getElement('F_ext').Values.Data;
    NMPC_log.tau_ext = logsout.LiveStreamSignals.getElement('tau_ext').Values.Data;
end
if 1
    UKF_log.UKF_state      = logsout.LiveStreamSignals.getElement('UKF states').Values.Data;
    UKF_log.UKF_state_pred = logsout.LiveStreamSignals.getElement('UKF states prediction').Values.Data;
%     NMPC_log.NMPC_x_in     = logsout.LiveStreamSignals.getElement('NMPC x_in').Values.Data;
%     NMPC_log.NMPC_x_in_nn  = logsout.LiveStreamSignals.getElement('NMPC log_x_in_nn').Values.Data;
%     NMPC_log.cmd_B_torque  = logsout.LiveStreamSignals.getElement('cmd_B_torque').Values.Data;
else
    UKF_log = 1;
    NMPC_log.NMPC_x_in_nn = 1;
end

% details for saving data
folder   = "data/";
robot    = "Nemo37_";
date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
filetype = ".mat";

% save data
filename = folder + robot + date + filetype;
% save(filename,'Time','Voltage','Measurement','DrivingSignals','Torque','mdl','rbt','som','ctr','En','rd','rd_d','Observer','DS_Time','rsim','logsout','UKF_state_pred','UKF_state');
save(filename,'Time','Voltage','Measurement','DrivingSignals','Torque','mdl','rbt','som','ctr','En','Observer','DS_Time','rsim','logsout','UKF_log','NMPC_log');

% show in command windows

disp(' ')
disp('======================================================')
disp('Flight data successfully saved in the "data" folder as')
disp("-->  " + robot + "flight_" + date + filetype)
disp('======================================================')
disp(' ')


%% Error detaction

if isempty(tg.TargetStatus.Error) ~= 1
    warning('#### Target Error ####')
    warning('#### Dangerous! Switch off the safety box! ####')
    run.TargetError = tg.TargetStatus.Error;
    run.ModelError  = tg.ModelStatus.Error;
    load(tg,'forced_stop')
    start(tg,'StopTime',0.1);
    error(run.TargetError);
    error('#### Target error! ####')
end