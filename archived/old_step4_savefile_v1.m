% details for saving data
folder   = "D:\Nemo\Video\Flight\20230719\";
control  = "closedloop3_";
robot    = "Nemo37_";
date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
filetype = ".mat";

% save data
filename = folder + control + robot + date + filetype;
save(filename,'Time','Voltage','Measurement','DrivingSignals','Torque','mdl','rbt','som','ctr','En','Observer','DS_Time','rsim','logsout','UKF_log','NMPC_log');