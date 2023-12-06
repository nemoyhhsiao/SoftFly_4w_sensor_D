function som = make_somersault(mdl)
    
    % enable somersault
    som.en = 1;

    % somersault time
    som.t.acc = 1; % time to accelerate upward

    % somersault openloop thrust
    som.thrust.acc = mdl.g * 1.5; % acceleration at phase 1 (lift2weight ratio)
    som.thrust.dec = mdl.g * 1.3; % deceleration at phase 4 (lift2weight ratio)

    % somersault openloop torque
    som.tor_x.acc = 12e-5;
    som.tor_x.dec = -12e-5;

    % somersault tunable threshold
    som.threshold.z_dot.acc = 0.5; % positive (m/s)
    som.threshold.z_dot.dec = -0.05; % negative (m/s)
    som.threshold.ang.down = -0.87; % determine when to decelerate, R33, the body z-axis projection to the world z 
    som.threshold.ang.up = 0.95; % determine when to get back to hovering, R33, the body z-axis projection to the world z 

end

