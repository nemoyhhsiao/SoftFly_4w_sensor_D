function [ctr] = make_pos_vel_estimator(rsim, mdl, ctr)
% x = [p, v, f_ext]
% p_dot = v 
% v_dot = acc_cmd - f_ext 
% acc_ext_dot = 0
% everything in world frame
% acc_des = (R*f_cmd - m*g)/m
% meas: pos.

%% Torque observer params: 
% ctr.pos_vel_est.enable = 0;
ctr.pos_vel_est.noise.process.vel = 1e-3;
% ctr.pos_vel_est.noise.process.acc_ext = 1e-2;
ctr.pos_vel_est.noise.meas.pos = 1e-10;

%% Make torque observer (KF)
n_x = 6;
n_u = 3;
n_y = 3;
A = zeros(n_x, n_x);
A(1:3, 4:6) = eye(3);
%A(4:6, 7:9) = eye(3);

B = zeros(n_x, n_u); 
B(4:6, 1:3) = eye(3);

% we measure the position
C = [eye(3), zeros(3)];

G = eye(n_x);
H = zeros(n_y, n_y);

Q = diag([ctr.pos_vel_est.noise.process.vel, ...
          ctr.pos_vel_est.noise.process.vel, ...
          ctr.pos_vel_est.noise.process.vel]);
R = diag([ctr.pos_vel_est.noise.meas.pos, ...
          ctr.pos_vel_est.noise.meas.pos, ...
          ctr.pos_vel_est.noise.meas.pos]);

D = zeros(n_y,n_u);

sys = ss(A, [B, B], C, [D, H]);

dsys = c2d(sys, mdl.T, 'tustin');

[kalmf,L,~,Mx,Z] = kalman(dsys,Q,R);

ctr.pos_vel_est.Q = Q;
ctr.pos_vel_est.R = R;
ctr.pos_vel_est.A = dsys.A;
ctr.pos_vel_est.B = dsys.B;
ctr.pos_vel_est.C = dsys.C;
ctr.pos_vel_est.D = dsys.D;
ctr.pos_vel_est.L = L;
end