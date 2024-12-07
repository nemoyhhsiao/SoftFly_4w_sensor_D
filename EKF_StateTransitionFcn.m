function x_new = EKF_StateTransitionFcn(x, StateTransitionFcnInputs)

    % Robot inertia matirx
    J     = diag([rbt.ixx; rbt.iyy; rbt.izz;]);
    J_inv = diag([1/rbt.ixx; 1/rbt.iyy; 1/rbt.izz;]);

    % Define control input
    u     = StateTransitionFcnInputs;
    tau_x = u(1,:);
    tau_y = u(2,:);

    % Define state
    phi     = x(1,:);
    theta   = x(2,:);
    psi     = x(3,:);
    Eul_XYZ = x(1:3,:);
    omega   = x(4:6,:);

    % T (from body frame velocity to Euler angle)
    T = [1,  sin(phi)*tan2(theta),  cos(phi)*tan(theta);
         0,  cos(phi),              -sin(phi);
         0,  sin(phi)/cos(theta),   cos(phi)/cos(theta); ];

    % Rotational dynamics
    Eul_dot   = T * omega;
    omega_dot = J_inv * ([tau_x; tau_y; 0;] - cross(omega, (J*omega)) );

    % Get new states
    Eul_new   = Eul_XYZ + Eul_dot .* mdl.T_high;
    omega_new = omega + omega_dot .* mdl.T_high;

    % Get new x
    x_new      = ones(6,1);
    x_new(1:6) = [Eul_new;
                  omega_new;];
    % x_new      = x_new(:);


end