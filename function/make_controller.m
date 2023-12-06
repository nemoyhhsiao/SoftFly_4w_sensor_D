function [ctr, mdl] = make_controller(mdl)
    % Initialize the 'ctr' structure with the same parameters as in the code

    % Controller enable
    ctr.en = 1;

    % Flapping frequency of all four units (Hz)
    ctr.freq_vec = [330 330 330 330];

    % Voltage offset
    ctr.DV = [60 -55 -70 40]; % 195 -5 -130 160

    % Use pre-defined trajectory
    ctr.traj.en = 0;

    % Yaw control enable
    ctr.yaw.en = 0;

    % Setpoint (relative to the initital position
    ctr.setpoint.x = 0; %0.0062;
    ctr.setpoint.y = 0; %-0.0876;
    ctr.setpoint.z = 0.105; %0.082; % 0.106
    ctr.setpoint.yaw = deg2rad(0);

    % Landing and takeoff parameters
    ctr.landing.en = 1;
    ctr.landing.time = 1;
    ctr.takeoff.en = 1;
    ctr.takeoff.time = 1;

    % Attitude controller gains [ att_d att_p pos_d pos_p ]
    ctr.factor = [1 1 1 1]; 
    ctr.gains = [62   798    6631   13608;     % #1 pakpong nominal gains
                 36   486    2916    6561;     % #2 (S+9)^4
                 48   864    6912   20736;     % #3 (S+12)^4
                 52  1014    8788   28561; ... % #4 (S+13)^4
                 56  1176   10976   38416; ... % #5 (S+14)^4
                 60  1350   13500   50625; ... % #6 (S+15)^4
                 64  1536   16384   65536; ... % #7 (S+16)^4 % too aggressive
                 ].*ctr.factor; 
    ctr.gain.n = 6;
    
    % Check stability criterion
    rhStabilityCriterion([1,ctr.gains(ctr.gain.n,:)]);

    % Attitude controller gains (lateral)
    ctr.gain.at3  = ctr.gains(ctr.gain.n,1); % attitude d
    ctr.gain.at2  = ctr.gains(ctr.gain.n,2); % attitude p
    ctr.gain.at1  = ctr.gains(ctr.gain.n,3); % position d
    ctr.gain.at0  = ctr.gains(ctr.gain.n,4); % position p
    ctr.gain.ati  = 1e-4 * 3; % world p error to body torque -> i gain
    ctr.gain.atfd = ctr.gain.at0 * 0; 
    
    % Attitude controller divide by g factor
    ctr.atmg.en            = 1;
    ctr.gain.atmg.factor.x = 1.3;
    ctr.gain.atmg.factor.y = 1.3;

    % Altitude controller gains (altitude)
    ctr.gain.al0  = 150 * 0.9;  % p gain [0.55]
    ctr.gain.al1  = 30 * 0.9;    % d gain [0.9]
    ctr.gain.ali  = 15 * 0.6;    % i gain [15]
    ctr.gain.alfd = 1.1;           % feedforward (tether weight) [0.7 - 1.5]

    % Yaw controller gains
    ctr.gain.yaw.fw = 1.78e-5;
    ctr.gain.yaw.p = 8e-6 * 1;
    ctr.gain.yaw.d = 8e-6 * 1;
    ctr.gain.yaw.i = 0.1e-6;

    % Integral control enable
    ctr.integral.en = 1;
    ctr.integral.lim.upper = [1e-5, 1e-5, 1e-7, 1]; % [torque x y z, thrust]
    ctr.integral.lim.lower = [-1e-5, -1e-5, -1e-7, -1];

    % Torque offset
    ctr.torque_offset.x = 0;
    ctr.torque_offset.y = 0;
    ctr.thrust_offset   = 0.2; % in acceleration

    % Torque/force limits
    ctr.lim.taux = 10.0e-5;
    ctr.lim.tauy = 10.0e-5;
    ctr.lim.tauz = 4e-6 * 1;

    % Safety and landing parameters
    ctr.safety.T = 0.04;
    ctr.safety.enableZone.xmax = 0.6;
    ctr.safety.enableZone.ymax = 0.3;
    ctr.safety.enableZone.zmax = 0.6;
    ctr.safety.volt = [1950, 1950, 1950, 1950];
    ctr.safety.min_cos_roll_pitch = -1;

    % Desired yaw trajectory (if needed)
    ctr.yaw.dy.en = 0;
    ctr.yaw.dy.angle = deg2rad([0, -45, 0, 0, 0]);
    ctr.yaw.dy.duration = [1, 1, 1, 1, 1];
    ctr.yaw.dy.trans = [1, 1, 1, 1];

    % % Additional parameters
    % ctr.baseline = 0;
    % 
    % % Adaptive Saturation
    % ctr.adaptive_saturation.enable = 1;
    % ctr.adaptive_saturation.Q = diag([1e2 * 0.5, 1e5 * 10, 1e5 * 5.0]);

    % Set flight time to 0.2 if it's openloop
    if ~ctr.en
        mdl.flight_time = 0.2;
    end

end
