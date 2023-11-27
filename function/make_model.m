function [mdl] = make_model(flight_time,rsim)

    % Simulink model running frequency
    mdl.f           = 2e3;          % frequency of the controller
    mdl.f_high      = 10e3;         % frequency of the sine wave generator
    mdl.T           = 1 / mdl.f;
    mdl.T_high      = 1/mdl.f_high;

    % Set flight time 
    mdl.flight_time = flight_time; % actual flapping time
    if rsim.en
        mdl.i_delay = 0.01;
        mdl.rt      = flight_time + mdl.i_delay; % Simulink run time
    else
        mdl.i_delay = 2; % initial delay to receive Vicon signals
        mdl.rt      = flight_time + mdl.i_delay + 1; % Simulink run time
    end

    % Environmental parameters
    mdl.g                 = 9.80655;
    mdl.drag_force.linear = 2.5e-3;

    % Re-Scaling of Vicon measurement
    mdl.vicon.gain = 1e5;

    % Use archived data to rerun the experiment
    mdl.rerun = 1;
    
    % Set the sampling frequency of the filter
    if rsim.en
        mdl.omega_filter.Fs = mdl.f;
    else
        mdl.omega_filter.Fs = mdl.f_high;
    end

    % Lowpass filter
    % mdl.vlp.n       = 2;
    % mdl.vlp.d       = [1 -exp(-2*mdl.T*80)]; % Assuming a 2nd-order Butterworth filter.
    % mdl.vlp.n2      = 3;
    % mdl.vlp.d2      = [1 -exp(-3*mdl.T*60)]; % Another filter.
    % mdl.f1          = 500;
    % mdl.zf1         = exp(-mdl.f1*mdl.T);
    % mdl.f2          = 100;  
    % mdl.zf2         = exp(-mdl.f2*mdl.T);
    % mdl.fd_lim      = 3.0;
    
end
