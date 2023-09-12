
% update parameter in the workspace to the compiled file
set_param(mdlName,'SimulationCommand','update')
disp('updating ...')
pause(8)
disp("status: "+get_param(mdlName,'SimulationStatus'))

% connect
set_param(mdlName,'SimulationCommand','connect')
disp('connecting ...')
pause(8)
disp("status: "+get_param(mdlName,'SimulationStatus'))
if convertCharsToStrings(get_param(mdlName,'SimulationStatus')) == "external"
    disp("--> ready to run")
else
    error("-->> might not be connected")
end
