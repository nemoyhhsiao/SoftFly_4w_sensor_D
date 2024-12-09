function sen = make_sensor(mdl, rsim)

    % Use sensor input (master switch)
    sen.en = 1; % 1: use on-board sensor, 0: use Vicon only

    % Use IMU
    sen.IMU.en = 1; % 0/1

    % Use range finder (laser distance sensor)
    sen.rgf.en = 1; % 0/1
    sen.rgf.filt_fc = 0.1;
    if rsim.en
        sen.rgf.filt_fs = 400;
    else
        sen.rgf.filt_fs = mdl.f_high;
    end
    sen.rgf.safety.en    = 1;
    sen.rgf.safety.count = 20;

    % Use optical flow
    sen.opt.en        = 1;      % 0/1
    sen.opt.k         = 0.206;  % optical flow x_dot = h * k * opti_input
    sen.opt.threshold = 2;      % if opti input less threshold, just consider as 0
    sen.opt.obs.gain  = 150;     % observer gain (L)


end