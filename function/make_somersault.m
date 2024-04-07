function som = make_somersault(mdl, rsim)
    
    % enable somersault
    som.en = 0;

    % somersault testing
    som.testing.en = 0;
    som.testing.drop_time = 0.18;
    som.testing.z = 0.35;

    % somersault time
    som.t.acc = 3; % time to accelerate upward
    if rsim.en
        som.t.acc = 1.2;
    end

    % somersault openloop thrust
    som.thrust.acc = mdl.g * 1.6; % acceleration at phase 1 (lift2weight ratio)
    som.thrust.dec = mdl.g * 1.37; % deceleration at phase 4 (lift2weight ratio)

    % somersault openloop torque & gain
    % som.tor_x.acc = 6e-5;
    % som.tor_x.dec = -8e-5; % not use
    % som.tor_x.gain.dec.p = 1.74e-4;a
    % som.tor_x.gain.dec.d = 4.73e-6;

    som.tor_y.acc = 8.5e-5; % 7.5e-5;
    som.tor_y.dec = -10e-5; 
    som.tor_y.gain.dec.p = 1.74e-4;
    som.tor_y.gain.dec.d = 4.73e-6*1;

    % somersault tunable threshold
    som.threshold.z_dot.acc = 1; % positive (m/s)
    som.threshold.z_dot.dec = 0; % negative (m/s)
    som.threshold.down.R33  = 1; % condition 1: determine when to decelerate, the body z-axis projection to the world z 
    % som.threshold.down.eulx = -2.7; % condition 2: determine when to decelerate
    som.threshold.down.euly = -6; % determine when to decelerate 5.2
    som.threshold.up.R33    = 0.85; % determine when to get back to hovering, the body z-axis projection to the world z 
    som.threshold.up.wy    = 20; % determine whether the robot has decelerate enough
    som.threshold.wy       = 40; % determine whether to use feedback control or just decelerate
    som.threshold.t_rot_acc = 0.123; % time threshold to enable double flip

    % somersault gain factor to prioritize attitude & thrust (som_state == 3)
    som.gain.fact.st3.at3 = 0.5; % attitude d
    som.gain.fact.st3.at2 = 0.5; % attitude p
    som.gain.fact.st3.at1 = 0.0; % position d 
    som.gain.fact.st3.at0 = 0.0; % position p

    % somersault gain factor to prioritize attitude & thrust (som_state == 4)
    som.gain.fact.st4.at3 = 0.8; % attitude d
    som.gain.fact.st4.at2 = 0.8; % attitude p
    som.gain.fact.st4.at1 = 0.25; % position d 
    som.gain.fact.st4.at0 = 0.25; % position p

    % time to stay hovering after transit to phase 5
    som.t_hover = 1.5;

end

