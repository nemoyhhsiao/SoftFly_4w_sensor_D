
% update parameter in the workspace to the compiled file
set_param(model_name,'SimulationCommand','update')
disp('updating ...')
pause(8)
disp("status: "+get_param(model_name,'SimulationStatus'))

% connect
set_param(model_name,'SimulationCommand','connect')
disp('connecting ...')
pause(8)
disp("status: "+get_param(model_name,'SimulationStatus'))
if convertCharsToStrings(get_param(model_name,'SimulationStatus')) == "external"
    disp("--> ready to run")
else
    error("-->> might not be connected")
end
