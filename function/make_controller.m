function [ctr, flight_time] = make_controller(flight_time)
    % Initialize the 'ctr' structure with the same parameters as in the code

    % Controller enable
    ctr.en = 1;

    if ctr.en
        flight_time = flight_time;
    else
        flight_time = 0.2;
    end

    % Flapping frequency of all four units (Hz)
    ctr.freq_vec = [330 330 330 330];

    % Yaw control enable
    ctr.yaw.en = 0;

    % Integral control enable
    ctr.integral.en = 1;
    ctr.integral.lim.upper = [1e-5, 1e-5, 1e-7, 1];
    ctr.integral.lim.lower = [-1e-5, -1e-5, -1e-7, -1];
    % ctr.integral.yaw.upper = 3e-6;
    % ctr.integral.yaw.lower = -3e-6;

    % Attitude controller gains (Pakpong's lateral)
    ctr.gain.at3 = 62 * 0.6;
    ctr.gain.at2 = 798 * 0.6;
    ctr.gain.at1 = 6631 * 0.05;
    ctr.gain.at0 = 13608 * 0.05;
    ctr.gain.ati = 1e-5 * 0;

    % Altitude controller gains (Pakpong's altitude)
    ctr.gain.al0 = 150 * 0.55;
    ctr.gain.al1 = 30 * 0.9;
    ctr.gain.ali = 15 * 1;

    % Yaw controller gains
    ctr.gain.yaw.fw = 1.78e-5;
    ctr.gain.yaw.p = 8e-6 * 1;
    ctr.gain.yaw.d = 8e-6 * 1;
    ctr.gain.yaw.i = 0.1e-6;

    % Torque/force limits
    ctr.lim.taux = 10.0e-5;
    ctr.lim.tauy = 10.0e-5;
    ctr.lim.tauz = 4e-6 * 1;

    % Safety and landing parameters
    ctr.safety.T = 0.04;
    ctr.safety.enableZone.xmax = 0.35;
    ctr.safety.enableZone.ymax = 0.35;
    ctr.safety.enableZone.zmax = 0.6;
    ctr.safety.volt = [1999, 1999, 1999, 1999];
    ctr.safety.land.xmax = 0.25;
    ctr.safety.land.ymax = 0.25;
    ctr.safety.land.zmax = 0.2;
    ctr.safety.land.volt = 1950;
    ctr.safety.land.T = 0.15;
    ctr.safety.min_cos_roll_pitch = -1;
    ctr.safety.overload.T = 1;
    ctr.safety.overload.count = 10;

    % Setpoint (initial position and orientation)
    ctr.setpoint.x = 0.046;
    ctr.setpoint.y = -0.085;
    ctr.setpoint.z = 0.03; % 0.106
    ctr.setpoint.yaw = deg2rad(0);

    % Landing and takeoff parameters
    ctr.landing.en = 0;
    ctr.landing.height = 0.0055;
    ctr.landing.time = 1;
    ctr.takeoff.en = 1;
    ctr.takeoff.height = 0.0059;
    ctr.takeoff.time = 0.3;

    % Desired yaw trajectory (if needed)
    ctr.yaw.dy.en = 0;
    ctr.yaw.dy.angle = deg2rad([0, -45, 0, 0, 0]);
    ctr.yaw.dy.duration = [1, 1, 1, 1, 1];
    ctr.yaw.dy.trans = [1, 1, 1, 1];

    % Additional parameters
    ctr.baseline = 0;

    % Adaptive Saturation
    ctr.adaptive_saturation.enable = 1;
    ctr.adaptive_saturation.Q = diag([1e2 * 0.5, 1e5 * 10, 1e5 * 5.0]);

    % Mode (You can uncomment and set this if needed)
    % ctr.mode = 2; % 0: rtmpc; 1: lqr v2; 2: lqr v3;

    % ctr.traj.en = 1;
    % ctr.traj.ome = 2;

    % controller gains

    ctr.lim.att = 0.05; % 0.25

    % Return the initialized 'ctr' structure
end
