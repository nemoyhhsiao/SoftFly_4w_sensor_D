function [ctr] = make_external_torque_observer(rsim, mdl, ctr)
% omega_dot = J^-1 tau_ext + theta_ext
% theta_ext_dot = 0
% x = [omega_xy, theta_ext_xy]
% u = tau_xy 

%% Torque observer params: 
ctr.torque_obs.enable = 1;
ctr.torque_obs.noise.process.torque_x = 0.25*1.25;
ctr.torque_obs.noise.process.torque_y = 1*1.25;
ctr.torque_obs.noise.process.omega = 0.1;
ctr.torque_obs.noise.meas = 1.0;

%%
ctr.torque_obs.initial_torque.x = 0;
ctr.torque_obs.initial_torque.y = 0;

%% Make torque observer (KF)
n_x = 4;
n_u = 2;
n_y = 2;
J = diag([rsim.rbt.ixx, rsim.rbt.iyy])*1e5; % units: [g][dm^2][rad]/[s]
A = zeros(n_x, n_x);
%A(1:2, 1:2) = inv(J);
A(1:2, 3:4) = inv(J);

B = zeros(n_x, n_u); 
B(1:2, 1:2) = inv(J);

% we measure the angular velocity
C = [eye(2), zeros(2)];

G = eye(n_x);
H = zeros(n_u, n_x);

Q = diag([ctr.torque_obs.noise.process.omega, ctr.torque_obs.noise.process.omega,...
    ctr.torque_obs.noise.process.torque_x, ctr.torque_obs.noise.process.torque_y]);
R = diag([ctr.torque_obs.noise.meas, ctr.torque_obs.noise.meas]);

D = zeros(n_y,n_u);

sys = ss(A, [B, G], C, [D, H]);

dsys = c2d(sys, mdl.T, 'tustin');

[kalmf,L,~,Mx,Z] = kalman(dsys,Q,R);

ctr.torque_obs.Q = Q;
ctr.torque_obs.R = R;
ctr.torque_obs.A = dsys.A;
ctr.torque_obs.B = dsys.B;
ctr.torque_obs.C = dsys.C;
ctr.torque_obs.D = dsys.D;
ctr.torque_obs.L = L;
% Express omega in rad/s and the external torque in [g][dm^2]/[s^2]
ctr.torque_obs.state_scaling = [1.0; 1.0; 1e5; 1e5];
% Express input torque in [g][dm^2]/[s^2]
ctr.torque_obs.input_scaling = [1e5; 1e5];
% Meas. expressed in rad/s
ctr.torque_obs.meas_scaling = [1.0; 1.0];
% output state from omage in rad/s and ext torque in [g][dm^2]/[s^2] to rad/s, Nm
ctr.torque_obs.out_scaling = 1./ctr.torque_obs.state_scaling;
end