
% details for saving data
sf.folder   = "D:\Nemo\Video\Flight\20231114\";
sf.control  = "closedloop6_";
sf.robot    = "Nemo44_";
sf.date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
sf.filetype = ".mat";

% save data
sf.filename = sf.folder + sf.control + sf.robot + sf.date + sf.filetype;
save(sf.filename);