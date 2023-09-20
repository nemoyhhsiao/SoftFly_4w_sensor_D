function [K] = octabee_position_LQR_v3(Ts)
    % mass
    % system parameters
    % Ts: sampling time
    drag_const = [1.0, 1.0, 1.0];    % Firefly
%     tau_roll =      1.0; %0.19; % 0.193429;             % HX14
%     tau_pitch =     1.0; %0.19; % 0.0193941;             % HX14
%     roll_gain =     10.0; %1.0;             % HX14
%     pitch_gain =    10.0; %1.0;             % HX14
    tau_roll = 0.018; % was 0.01
    tau_pitch = 0.018;
    roll_gain = 9.0;
    pitch_gain = 9.0;
    gravity = 98.0655;
    
    
    %% MPC tuning
    % NN RTMPC
    Q = diag([7900, 7900, 7e3, 15, 15, 20, 0.0, 0.0, 0.0, 0.0]); 
    R = diag([1e1, 1e1, 2]);
    % Found with NEMO:
    %Q = diag([250, 250, 2000, 25, 25, 10, 0.5, 0.5]);
    %R = diag([50, 50, 0.1]);
    %Q = diag([300, 300, 3000, 15, 15, 0.1, 500, 500]);  % found with nemo
    %R = diag([50, 50, 0.1]);                            % found with nemo
    %N_horizon = 30;
    %T = 0.1;            % discretization time
    
    %% Continuous time model
    % State: [posx, posy, posz, velx, vely, velz, roll, pitch, roll_cmd, pitch_cmd]
    % Control input: [delta_roll_angle, delta_pitch_angle, thrust]
    Ac = zeros(10);
    Ac(1, 4) = 1;
    Ac(2, 5) = 1;
    Ac(3, 6) = 1;
    Ac(4, 4) = -drag_const(1);
    Ac(4, 8) = gravity;
    Ac(5, 5) = -drag_const(2);
    Ac(5, 7) = -gravity;
    Ac(6, 6) = -drag_const(3); 
    Ac(7, 7) = -1/tau_roll;
    Ac(8, 8) = -1/tau_pitch;
    Ac(7, 9) = roll_gain / tau_roll;
    Ac(8, 10) = pitch_gain / tau_pitch;
    
    Bc = zeros(10, 3);
    Bc(6, 3) = 1.0;
    Bc(9, 1) = 1.0;
    Bc(10, 2) = 1.0;
    
    sysc = ss(Ac, Bc, eye(10), zeros(10,3));
    
    K = lqrd(Ac, Bc, Q, R, Ts);
    
    %% Discrete time
    % sysd = c2d(sysc, T, 'tustin');
    % A = sysd.A;
    % B = sysd.B;
    
end