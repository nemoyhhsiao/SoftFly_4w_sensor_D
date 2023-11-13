
% start simulation
set_param(model_name,'SimulationCommand','start')
pause(2)
for i = 1:mdl.rt
    disp("operating at around "+num2str(i)+" s") % rough timing only
    pause(1)
end
pause(2)
disp(' ')
disp('==== reached execution time ====')
disp(' ')

% check whether the simulation has been stopped
counter = 0;
while convertCharsToStrings(get_param(model_name,'SimulationStatus')) ~= "stopped"
    counter = counter + 1;
    pause(1)
    if counter >= 20
        set_param(model_name,'SimulationCommand','stop')
        pause(2)
    end
end
if convertCharsToStrings(get_param(model_name,'SimulationStatus')) == "stopped"
    disp("==== execution is stopped ====")
else
    warning("==== execution is not stopped ====")
end

% details for saving data (sd.) 
sd.folder   = "data/";
sd.robot    = "Nemo42_";
sd.date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
sd.filetype = ".mat";
sd.filename = sd.folder + sd.robot + sd.date + sd.filetype;
save(sd.filename);

% details for saving archived data (sda.)
if rsim.en ~= 1 && mdl.rerun ~= 1 
    sda.folder   = "data/";
    sda.name     = "archived_";
    sda.date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
    sda.filetype = ".mat";
    sda.filename = sda.folder + sda.name + sda.date + sda.filetype;
    
    archived_data_ready = rst_vicon_data_ready.signals.values;
    archived_p_raw      = rst_p_raw.signals.values;
    archived_Eul_XYZ    = rst_Eul_XYZ.signals.values;
    save(sda.filename, "archived_data_ready","archived_p_raw","archived_Eul_XYZ");
end

% show in command windows
disp(' ')
disp('======================================================')
disp('flight data successfully saved in the "data" folder as')
disp("-->  " + sd.robot + "flight_" + sd.date + sd.filetype)
disp('======================================================')
disp(' ')
