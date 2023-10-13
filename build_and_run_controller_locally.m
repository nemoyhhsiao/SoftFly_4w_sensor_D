 %% 

clc
clear
close all

% add path to subfolder
addpath('./model');
addpath('./function');

load('thrust2voltage_lut_20230829.mat')

model_name = 'controller13';

% set flight time for the model
flight_time = 3.0;

% setup controller parameter
setup_controller


% [mdl,rbt,ctr,flt,rsim,som] = controller_setup_v5(flight_time);
% run_controller

rsim.en = true;
r0 = [-0.053, -0.068, 0.069];
rsim.p0 = r0;

%%
% build model
% set_param('controller_v13', 'SimulationCommand', 'start');
% out = sim('controller_v13','SimulationMode','normal'); % RapidAccelerator
load_system(model_name);

if rsim.en
    set_param(strcat(model_name, '/Flying Simulation'), 'commented', 'off');
    set_param(strcat(model_name, '/UDP send to Arduino'), 'commented', 'on');
    set_param(strcat(model_name, '/Vicon UDP receive'), 'commented', 'on');
    warning("-->> using simulator")

else
    set_param(strcat(model_name, '/Flying Simulation'), 'commented', 'on');
    warning("-->> using Vicon data")
end

% set_param(strcat(model_name, '/Real-Time Interfaces'), 'commented', 'on');
out = sim(model_name, 'SimulationMode','normal');
% out = sim('controller_v13','SimulationMode','rapid');
% out = sim('controller_v13','SimulationMode','accelerate');
% plot position and UKF output

%% plots
if false

figure(1)
labels_xyz = {'x', 'y', 'z'};
setpoints = [ctr.setpoint.x; ctr.setpoint.y; ctr.setpoint.z];
for i = 1:3
    subplot(3,1,i);
    plot(out.measurement.time, out.measurement.Data(:,i)*100, '.', 'LineWidth', 2.0); hold on;
    plot(out.observer_log.time, out.observer_log.Data(:,i)*100, 'LineWidth', 2.0); hold on;
    yline(setpoints(i)*100, ':', 'LineWidth', 2.0);
    title("pos " + labels_xyz(i))
    legend("meas ", "est", "desired");
    xlabel("Time (s)")
    ylabel("(cm)")
end

% plot attitude
figure(2)
labels_rpy = {'roll', 'pitch', 'yaw'};
for i = 1:3
    subplot(3,1,i)
    plot(out.measurement.time, out.measurement.Data(:,3 + i)*180/pi, '.', 'LineWidth', 2.0); hold on;
    plot(out.log_est_rpy.Time, out.log_est_rpy.Data(:, i)*180/pi,'LineWidth', 2.0);
    title("att " + labels_rpy{i})
    legend("meas", "est");
    xlabel('Time (s)');
    ylabel('(deg)');
    %xlim(x_lim)
end

% plot angular velocities in body
% and the commanded angular velocity
figure(3)
labels_angv = {'x', 'y', 'z'};
for i = 1:3
    subplot(3,1,i)
    plot(out.observer_log.time, out.observer_log.Data(:, 19 + i - 1), 'LineWidth', 2.0); hold on;
    plot(out.log_cmd_B_omega.time, out.log_cmd_B_omega.Data(:, i), '--', 'LineWidth', 2.0); hold on;
    title("Angular Velocity Body " + labels_angv{i});
    legend("est", "cmd");
    xlabel('Time (s)');
    ylabel('(rad/s)');
end

% thrust force from neural network controller
figure(4)
plot(out.log_cmd_rpyt.Time, out.log_cmd_rpyt.Data(:, 4), '.');
title("Commanded Thrust");
xlabel("Time (s)");
ylabel("N");

% Input of NN policy
figure(5)
signal_idx = {[1:3], [4:6], [7:10], [11:13], [14]};
signal_name = {"pos", "vel", "att q.", "f ext", "time"};
N_rows = 5;
for row_id = 1:5
    subplot(N_rows, 1, row_id);
    ranges = cell2mat(signal_idx(row_id));
    plot(out.log_x_in_nn.Time, out.log_x_in_nn.Data(:, ranges), 'LineWidth', 2.0);
    title(signal_name{row_id})
end

% plotting ypr
figure(6);
signal_name = {'yaw', 'pitch', 'roll'};
for i = 1:3
    subplot(3,1,i);
    plot(out.ypr_IB.Time, out.ypr_IB.Data(:, i)); hold on;
    plot(out.ypr_IB.Time, out.ypr_WI.Data(:, i)); hold on;
    legend("IB", "WI")
    title(signal_name{i})
end

% plotting in 3D
figure(7);
t0 = 2000;
tf = 5000;
plot3( ...
    out.measurement.Data(1,1)*100, ...
    out.measurement.Data(1,2)*100, ...
    out.measurement.Data(1,3)*100, ...
    'o', 'MarkerSize',20); hold on;
plot3( ...
    out.measurement.Data(t0:tf,1)*100, ...
    out.measurement.Data(t0:tf,2)*100, ...
    out.measurement.Data(t0:tf,3)*100, ...
    'LineWidth', 2.0); hold on;
% coordintate system
colors = {"c", "m", "y"};
arrow_scale = 2.0;

for j = 1:3
    e = zeros(3, 1);
    e(j) = 1;
    pf = e*arrow_scale;
    quiver3(0, 0, 0, pf(1), pf(2), pf(3), "LineWidth", 2.0, "Color", colors{j}); hold on;
end
for i = [t0:50:tf]
    p0 = out.measurement.Data(i,1:3)*100;
    R = pakpongs_euler_to_rotm(out.measurement.Data(i,4:6));
    arrow_scale = 1.0;
    colors = {"r", "g", "b"};
    for j = 1:3
        e = zeros(3, 1);
        e(j) = 1;
        pf = R*e*arrow_scale;
        quiver3(p0(1), p0(2), p0(3), pf(1), pf(2), pf(3), "LineWidth", 1.0, "Color", colors{j}); hold on;
    end
end
% xlim([-10, 10]);
% ylim([-10, 10]);
% zlim([-5, 30]);
xlabel("x (cm)");
ylabel("y (cm)");
zlabel("z (cm)");
axis equal
grid on

% x-z and y-z plots showing the flip.
figure(8); 
axis_names = {"x", "y"};
axis_limits = [ctr.safety.enableZone.xmax, ctr.safety.enableZone.ymax];
for i = 1:2
    subplot(1,2,i);
    h_axis = i;
    plot(out.measurement.Data(t0:tf,h_axis)*100, ...
            out.measurement.Data(t0:tf,3)*100, ...
            'LineWidth', 3); hold on;
    plot(out.measurement.Data(1,h_axis)*100, ...
            out.measurement.Data(1,3)*100, ...
            'o','MarkerSize',20, ...
            'LineWidth', 3);
    for j = [t0:20:tf]
        p0 = out.measurement.Data(j,1:3)*100;
        R = pakpongs_euler_to_rotm(out.measurement.Data(j,4:6));
        pf = R*[0; 0; 1]*2;
        quiver(p0(h_axis), p0(3), pf(h_axis), pf(3), 'LineWidth',1.5, 'Color', 'r');
    end
    title("Position " + axis_names{i} + "-z");
    xlim([-axis_limits(i), axis_limits(i)]*100);
    ylim([0, ctr.safety.enableZone.zmax]*100);
    xlabel("(cm)");
    ylabel("(cm)");
end

% actuation
figure(9); 
axis_names = {"x", "y", "z"};
for i = 1:3
    subplot(4,1,i);
    plot(out.log_cmd_B_torque.time, out.log_cmd_B_torque.Data(:, i), 'LineWidth',2.0);
    yline(ctr.lim.taux, "Color",'r', 'LineStyle',":", 'LineWidth', 2.0);
    yline(-ctr.lim.taux, "Color",'r', 'LineStyle',":", 'LineWidth', 2.0);
    title("Body - " + axis_names{i})
    xlabel("Time (s)");
    ylabel("Torque (Nm)");
end
subplot(4,1,4);
plot(out.log_cmd_B_acc_z/mdl.g, 'LineWidth', 2.0);
xlabel("Time (s)");
ylabel("Acc (gs)");

figure(10); 
plot(out.amplitude); 
xlabel("Time (s)");
ylabel("Actuator's cmds (V)");

% traj on x-z, y-z
figure(11);
subplot(3,1,1)
plot(out.measurement.Time, out.measurement.Data, 'Linewidth', 2.0); hold on;
legend("meas x", "meas y", "meas z", ...
    "meas r", "meas p", "meas y");
subplot(3,1,2)
plot(out.en.time, out.en.Data, 'LineWidth', 2.0, 'LineStyle',':');
legend("safety 1", "safety 2", "safety 3", ...
    "safety 4", "safety 5", "safety 6");
subplot(3,1,3)
plot(out.measurement.Time, out.measurement.Data, 'Linewidth', 2.0); hold on;
plot(out.en.time, out.en.Data, 'LineWidth', 2.0, 'LineStyle',':');
legend("meas x", "meas y", "meas z", ...
    "meas r", "meas p", "meas y", ...
    "safety 1", "safety 2", "safety 3", ...
    "safety 4", "safety 5", "safety 6");
title("safety");
xlabel("Time (s)");

% external disturbance
figure(12);
axis_labels = {'x', 'y', 'z'};
for i = 1:3
    row_id = 2*i-1;
    % Force
    subplot(3,2,row_id);
    plot(out.log_F_ext_gt.Time, out.log_F_ext_gt.Data(:, i)/mdl.g/rbt.m);
    xlabel("Time (s)");
    ylabel("Force (% of m*g)");
    title(sprintf("Ext. Force dist - ", axis_labels{i}));
    % Torque
    subplot(3,2,row_id+1);
    plot(out.log_tau_ext_gt.Time, out.log_tau_ext_gt.Data(:, i)); hold on; 
    plot(out.log_tau_ext.Time, out.log_tau_ext.Data(:, i));
    legend('gt', 'est');
    title(sprintf("Ext. Torque dist - ", axis_labels{i}));
    xlabel("Time (s)");
    ylabel("Torque (Nm)"); 
end


% Quaternion input of NN
figure
plot(out.log_x_in_nn.Data(:, 7:10))
legend('x', 'y', 'z', 'w')

%%
figure(13); 
axis_names = {"x", "y", "z"};
for i = 1:3
    subplot(4,1,i);
    plot(out.log_cmd_B_torque.time, out.log_cmd_B_torque.Data(:, i), 'LineWidth',2.0); hold on
    plot(out.torque.Time, out.torque.Data(:,i))
    yline(ctr.lim.taux, "Color",'r', 'LineStyle',":", 'LineWidth', 2.0);
    yline(-ctr.lim.taux, "Color",'r', 'LineStyle',":", 'LineWidth', 2.0);
    title("Body - " + axis_names{i})
    xlabel("Time (s)");
    ylabel("Torque (Nm)");
    hold off
end
subplot(4,1,4);
plot(out.log_cmd_B_acc_z/mdl.g, 'LineWidth', 2.0); hold on
plot(out.torque.Time, out.torque.Data(:,4)/mdl.g/rbt.m, 'LineWidth', 2.0)
xlabel("Time (s)");
ylabel("Acc (gs)");
hold off

end