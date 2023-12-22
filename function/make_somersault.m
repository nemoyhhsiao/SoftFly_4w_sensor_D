function som = make_somersault(mdl)
    
    % enable somersault
    som.en = 1;

    % somersault testing
    som.testing.en = 0;
    som.testing.drop_time = 0.18;
    som.testing.z = 0.35;

    % somersault time
    som.t.acc = 3.5; % time to accelerate upward

    % somersault openloop thrust
    som.thrust.acc = mdl.g * 1.5; % acceleration at phase 1 (lift2weight ratio)
    som.thrust.dec = mdl.g * 1.3; % deceleration at phase 4 (lift2weight ratio)

    % somersault openloop torque & gain
    % som.tor_x.acc = 6e-5;
    % som.tor_x.dec = -8e-5; % not use
    % som.tor_x.gain.dec.p = 1.74e-4;
    % som.tor_x.gain.dec.d = 4.73e-6;

    som.tor_y.acc = 8e-5;
    som.tor_y.dec = -8e-5; 
    som.tor_y.gain.dec.p = 1.74e-4;
    som.tor_y.gain.dec.d = 4.73e-6*1;

    % somersault tunable threshold
    som.threshold.z_dot.acc = 0.9; % positive (m/s)
    som.threshold.z_dot.dec = -0.05; % negative (m/s)
    som.threshold.down.R33  = -0.5; % condition 1: determine when to decelerate, the body z-axis projection to the world z 
    % som.threshold.down.eulx = -2.7; % condition 2: determine when to decelerate
    som.threshold.down.euly = 2.5;
    som.threshold.up.R33    = 0.85; % determine when to get back to hovering, the body z-axis projection to the world z 

    % somersault gain factor to prioritize attitude & thrust (som_state == 4)
    som.gain.fact.at3 = 0.3; % attitude d
    som.gain.fact.at2 = 0.7; % attitude p
    som.gain.fact.at1 = 0.1; % position d 
    som.gain.fact.at0 = 0.1; % position p

end

