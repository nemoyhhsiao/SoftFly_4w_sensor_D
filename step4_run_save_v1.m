
% start simulation
set_param(mdlName,'SimulationCommand','start')
pause(2)
for i = 1:mdl.exe_time
    disp("operating at around "+num2str(i)+" s") % rough timing only
    pause(1)
end
pause(2)
disp('==== reached execution time ====')

% check whether the simulation has been stopped
counter = 0;
while convertCharsToStrings(get_param(mdlName,'SimulationStatus')) ~= "stopped"
    counter = counter + 1;
    pause(1)
    if counter >= 20
        set_param(mdlName,'SimulationCommand','stop')
        pause(2)
    end
end
if convertCharsToStrings(get_param(mdlName,'SimulationStatus')) == "stopped"
    disp("==== execution is stopped ====")
else
    warning("==== execution is not stopped ====")
end

% details for saving data (sd.) 
sd.folder   = "data/";
sd.robot    = "Nemo42_";
sd.date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
sd.filetype = ".mat";

% save data
sd.filename = sd.folder + sd.robot + sd.date + sd.filetype;
save(sd.filename);

% show in command windows
disp(' ')
disp('======================================================')
disp('flight data successfully saved in the "data" folder as')
disp("-->  " + sd.robot + "flight_" + sd.date + sd.filetype)
disp('======================================================')
disp(' ')