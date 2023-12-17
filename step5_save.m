close all

% details for saving data
sf.folder   = "E:\Dropbox (MIT)\SMRL\Soft_fly_data\videos\flight\20231216\";
sf.control  = "closedloop8_";
sf.robot    = "Nemo44_";
sf.date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
sf.filetype = ".mat";

% save data
sf.filename = sf.folder + sf.control + sf.robot + sf.date + sf.filetype;
save(sf.filename);