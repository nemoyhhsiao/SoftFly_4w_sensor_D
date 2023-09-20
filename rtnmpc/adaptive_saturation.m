function [cmd_torque_x, cmd_torque_y, cmd_thrust_z, exitflag] = adaptive_saturation(des_torque_x, des_torque_y, des_thrust_z, rbt, ctr)

g = 9.80655; 
des_wrench = [des_thrust_z - rbt.m*g; des_torque_x; des_torque_y];

max_act_force = 0.5*rbt.m*g; 
min_act_force = 0.0*rbt.m*g;

Q = ctr.adaptive_saturation.Q; % how much to penalize deviations. Little penalty on y.

options = optimoptions('quadprog','Algorithm','active-set', 'StepTolerance', 1e-10, 'MaxIterations' ,220,'ConstraintTolerance',1e-9);

% objective function
H = Q; 
f = -Q'*des_wrench;

% inequality constraint
A = [rbt.Apinv; -rbt.Apinv]; 
b = [max_act_force*ones(4,1) - rbt.Apinv*[rbt.m*g; 0; 0]; -min_act_force*ones(4,1) + rbt.Apinv*[rbt.m*g; 0; 0]];

x0 = des_wrench;

exitflag = false; 
fval = 0;
% solve qp
[cmd_wrench,fval,exitflag,output]  = quadprog(H, f, A, b, [], [], [], [], x0, options);

cmd_thrust_z = cmd_wrench(1) + rbt.m*g;
cmd_torque_x = cmd_wrench(2);
cmd_torque_y = cmd_wrench(3);


% cmd_torque_x = des_torque_x; 
% cmd_torque_y = des_torque_y;
% cmd_thrust_z = des_thrust_z;

end