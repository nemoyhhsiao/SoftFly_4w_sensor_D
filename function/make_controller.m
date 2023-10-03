function ctr = make_controller()
    % Initialize the 'ctr' structure with the same parameters as in the code

    % Controller enable
    ctr.en = 1;

    % Yaw control enable
    ctr.yaw.en = 0;

    % Integral control enable
    ctr.integral.en = 0;
    ctr.integral.lim.upper = [10e-2, 3e-2, 1e-6, 3.5e-4];
    ctr.integral.lim.lower = [-10e-2, -3e-2, -1e-6, -6e-4];
    ctr.integral.yaw.upper = 3e-6;
    ctr.integral.yaw.lower = -3e-6;

    % Attitude controller gains
    ctr.gain.at3 = 62 * 0.75;
    ctr.gain.at2 = 798 * 0.75;
    ctr.gain.at1 = 6631 * 1.15;
    ctr.gain.at0 = 13608 * 1.1;
    ctr.gain.ati = 0.5e4 * 1.5;

    % Altitude controller gains
    ctr.gain.al0 = 150 * 0.55;
    ctr.gain.al1 = 30 * 0.9;
    ctr.gain.ali = 20 * 0.9;

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
    ctr.safety.volt = [1950, 1950, 1950, 1900];
    ctr.safety.land.xmax = 0.25;
    ctr.safety.land.ymax = 0.25;
    ctr.safety.land.zmax = 0.2;
    ctr.safety.land.volt = 1950;
    ctr.safety.land.T = 0.15;
    ctr.safety.min_cos_roll_pitch = -1;
    ctr.safety.overload.T = 1;
    ctr.safety.overload.count = 10;

    % Setpoint (initial position and orientation)
    ctr.setpoint.x = 0;
    ctr.setpoint.y = 0;
    ctr.setpoint.z = 0.05;
    ctr.setpoint.yaw = deg2rad(0);

    % Landing and takeoff parameters
    ctr.landing.en = 0;
    ctr.landing.height = 0.001;
    ctr.landing.time = 1;
    ctr.takeoff.en = 0;
    ctr.takeoff.height = 0.012;
    ctr.takeoff.time = 1;

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

    % RTMPC Limits
    ctr.rtmpc.lim.att = pi / 6.0;

    % Torque Observer
    ctr.torque_obs.enable = 1;
    ctr.torque_obs.factor = 1;

    % Mode (You can uncomment and set this if needed)
    % ctr.mode = 2; % 0: rtmpc; 1: lqr v2; 2: lqr v3;

    %% ==== cascaded parameters ====
    %  =============================

    ctr.casd.en = 1; % 1 for cascaded, 0 for geometric 
    ctr.casd.yaw = 1; % 1 to enable yaw control
    ctr.traj.en = 1;
    ctr.traj.ome = 2;

    % controller gains

    % attitude controller
    ctr.casd.att.x.p = 0.001;
    ctr.casd.att.x.d = 0.00006; %4.6e-05;
    ctr.casd.att.y.p = 0.001;
    ctr.casd.att.y.d = 0.00008; %6.6e-05;
    ctr.casd.att.z.p = 3e-5;  % 2021.12.28 3e-4
    ctr.casd.att.z.d = 1e-5;  % 2021.12.28 1e-4  % old: 4e-05

    % position controller
    ctr.casd.pos.x.p = 6; % 17
    ctr.casd.pos.x.d = 2;
    ctr.casd.pos.y.p = 6; % 16
    ctr.casd.pos.y.d = 2;

    ctr.lim.att = 0.05; % 0.25

    % Return the initialized 'ctr' structure
end
