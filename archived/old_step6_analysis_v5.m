% script to analyze_result
addpath('./function');
close all

%%
x        = Measurement(:,1);
y        = Measurement(:,2);
z        = Measurement(:,3);
r        = Measurement(:,1:3);
rot_x    = Measurement(:,4);
rot_y    = Measurement(:,5);
rot_z    = Measurement(:,6);
Tx       = Torque(:,1);
Ty       = Torque(:,2);
Tz       = Torque(:,3);
Force    = Torque(:,4);
int_Tx   = Torque(:,5);
int_Ty   = Torque(:,6);
int_Tz   = Torque(:,7);
int_F    = Torque(:,8);
r_dot    = Observer(:,1:3);
r_dotdot = Observer(:,4:6);
R1       = Observer(:,7:3:13);
R2       = Observer(:,8:3:14);
R3       = Observer(:,9:3:15);
wx       = Observer(:,16);
wy       = Observer(:,17);
wz       = Observer(:,18);
if size(Observer,2)>18
    x_af = Observer(:,19);
    y_af = Observer(:,20);
    z_af = Observer(:,21);
end
% Dr       = r-rd;
% Dr_dot   = r_dot-rd_d;
rd_dd    = zeros(length(z),3);
rd_ddd   = zeros(length(z),3);

on_time = Time - 2.0;

DS_Time  = 0:mdl.T_high:Time(end);

if length(DS_Time) ~= length(DrivingSignals)
    DS_Time = 0:mdl.T_high:Time(end);
end

if 0
    DS_Time = 0:mdl.T_high:Time(end)+mdl.T_high;
end

t0 = 2000;
tf = 2700;

%% Prepare Measurements
out.measurement.time = Time;
out.measurement.Time = Time;
out.measurement.Data = Measurement;

out.observer_log.time = Time;
out.observer_log.Data = Observer;

out.log_est_rpy.Time = Time;
out.log_est_rpy.Data = zeros(size(Observer(:, 1:3)));

for i = [1:numel(Observer(:,1))]
    R_flat = Observer(i,10:18);
    R = unflatten_rotm(R_flat);
    out.log_est_rpy.Data(i, :) = rotm2eul(R, 'XYZ');
end

out.log_cmd_B_omega.time = Time;
out.log_cmd_B_omega.Data = NMPC_log.cmd_vel;

out.log_cmd_rpyt.Time = Time;
out.log_cmd_rpyt.Data = zeros(numel(Time), 4);
out.log_cmd_rpyt.Data(:, 4) = NMPC_log.f_cmd;

out.log_cmd_B_torque.time = Time;
out.log_cmd_B_torque.Data = Torque(:, 1:3);

out.amplitude = Voltage;

out.en.time = Time;
out.en.Data = En;

clear raw_torque
raw_torque(:,1) = logsout.LiveStreamSignals.getElement('raw_tf').Values.Data(:,1);
raw_torque(:,2) = logsout.LiveStreamSignals.getElement('raw_tf').Values.Data(:,2);
raw_torque(:,3) = logsout.LiveStreamSignals.getElement('raw_tf').Values.Data(:,3);
raw_thrust = logsout.LiveStreamSignals.getElement('raw_tf').Values.Data(:,4);
%% plots
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

% velocity
figure(5)
labels_vel = {'x', 'y', 'z'};
for i = 1:3
    subplot(3, 1, i)
    plot(Time, Observer(:, 3 + i));
    title("Velocity World" + labels_angv{i});
    legend("est", "cmd");
    xlabel('Time (s)');
    ylabel('(m/s)');
end

% % Input of NN policy
% figure(5)
% signal_idx = {[1:3], [4:6], [7:10], [11:13], [14]};
% signal_name = {"pos", "vel", "att q.", "f ext", "time"};
% N_rows = 5;
% for row_id = 1:5
%     subplot(N_rows, 1, row_id);
%     ranges = cell2mat(signal_idx(row_id));
%     plot(out.log_x_in_nn.Time, out.log_x_in_nn.Data(:, ranges), 'LineWidth', 2.0);
%     title(signal_name{row_id})
% end
% 
% % plotting ypr
% figure(6);
% signal_name = {'yaw', 'pitch', 'roll'};
% for i = 1:3
%     subplot(3,1,i);
%     plot(out.ypr_IB.Time, out.ypr_IB.Data(:, i)); hold on;
%     plot(out.ypr_IB.Time, out.ypr_WI.Data(:, i)); hold on;
%     legend("IB", "WI")
%     title(signal_name{i})
% end

% plotting on x-z
figure(7);
t_idx_max = 1000; % samples (at 1 KHz usually)
plot3( ...
    out.measurement.Data(t0,1)*100, ...
    out.measurement.Data(t0,2)*100, ...
    out.measurement.Data(t0,3)*100, ...
    'o', 'MarkerSize',20); hold on;
plot3( ...
    out.measurement.Data(t0:tf,1)*100, ...
    out.measurement.Data(t0:tf,2)*100, ...
    out.measurement.Data(t0:tf,3)*100, ...
    'LineWidth', 2.0); hold on;
% coordintate system
colors = {"c", "m", "y"};
arrow_scale = 2.0;

% for j = 1:3
%     e = zeros(3, 1);
%     e(j) = 1;
%     pf = e*arrow_scale;
%     quiver3(0, 0, 0, pf(1), pf(2), pf(3), "LineWidth", 2.0, "Color", colors{j}); hold on;
% end
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
    % external force
    f_ext = UKF_log.UKF_state(i, 14:17)/mdl.g/rbt.m*2.0;
    quiver3(p0(1), p0(2), p0(3), f_ext(1), f_ext(2), f_ext(3), "LineWidth", 3.0, "Color", 'b');
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
    plot(out.log_cmd_B_torque.time, out.log_cmd_B_torque.Data(:, i), 'LineWidth',2.0); hold on
    plot(out.log_cmd_B_torque.time, raw_torque(:,i), 'LineWidth',2.0);
    yline(ctr.lim.taux, "Color",'r', 'LineStyle',":", 'LineWidth', 2.0);
    yline(-ctr.lim.taux, "Color",'r', 'LineStyle',":", 'LineWidth', 2.0);
    title("Body - " + axis_names{i})
    xlabel("Time (s)");
    ylabel("Torque (Nm)"); hold off
end
subplot(4,1,4);
plot(Torque(:, 4)/mdl.g/rbt.m, 'LineWidth', 2.0); hold on
plot(raw_thrust/mdl.g, 'LineWidth', 0.2);
xlabel("Time (s)");
ylabel("Acc (gs)"); 
legend('saturated', 'raw')
hold off

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
    yyaxis right
    plot(out.measurement.time, out.measurement.Data(:,4)*180/pi, '.', 'LineWidth', 2.0); hold on;
    yyaxis left
    plot(Time, UKF_log.UKF_state(:, 14 + i - 1)/mdl.g/rbt.m, 'LineWidth', 2.0);
    % plot(out.log_F_ext_gt.Time, out.log_F_ext_gt.Data(:, i)/mdl.g/rbt.m);
    xlabel("Time (s)");
    ylabel("Force (Gs)");
    title(sprintf("Ext. Force dist - ", axis_labels{i}));
    legend('force', 'roll')
    % Torque
    subplot(3,2,row_id+1);
    yyaxis right
    plot(out.measurement.time, out.measurement.Data(:,4)*180/pi, '.', 'LineWidth', 2.0); hold on;
    yyaxis left
    % plot(out.log_tau_ext_gt.Time, out.log_tau_ext_gt.Data(:, i)); hold on; 
    plot(Time, UKF_log.UKF_state(:, 17 + i - 1), 'LineWidth', 2.0);
    legend('torque', 'roll')
    title(sprintf("Ext. Torque dist - ", axis_labels{i}));
    xlabel("Time (s)");
    ylabel("Torque (Nm)"); 
end


%% external disturbance
figure(13);
axis_labels = {'x', 'y', 'z'};
for i = 1:3
    row_id = 2*i-1;
    % Force
    subplot(3,2,row_id);
    yyaxis right
    plot(Time, UKF_log.UKF_state(:, 8 + i - 1), '.', 'LineWidth', 2.0); hold on;
    yyaxis left
    plot(Time, UKF_log.UKF_state(:, 14 + i - 1)/mdl.g/rbt.m, 'LineWidth', 2.0);
    plot(Time, UKF_log.UKF_state(:, 1 + i - 1)*3, 'LineWidth', 2.0);
    % plot(out.log_F_ext_gt.Time, out.log_F_ext_gt.Data(:, i)/mdl.g/rbt.m);
    xlabel("Time (s)");
    ylabel("Force (% of m*g)");
    title(sprintf("Ext. Force dist - ", axis_labels{i}));
    legend('velocity', 'force');
    % Torque
    subplot(3,2,row_id+1);
    yyaxis right
    plot(Time, UKF_log.UKF_state(:, 8 + i - 1), '.', 'LineWidth', 2.0); hold on;
    yyaxis left
    % plot(out.log_tau_ext_gt.Time, out.log_tau_ext_gt.Data(:, i)); hold on; 
    plot(Time, UKF_log.UKF_state(:, 17 + i - 1), 'LineWidth', 2.0);
    legend('velocity', 'torque' )
    title(sprintf("Ext. Torque dist - ", axis_labels{i}));
    xlabel("Time (s)");
    ylabel("Torque (Nm)"); 
end

% %% Quaternion input of NN
% figure
% plot(out.log_x_in_nn.Data(:, 7:10))
% legend('x', 'y', 'z', 'w')

%%

sat_ft = [Torque(:,4), Torque(:, 1:2)]';

for i = 1:length(sat_ft')
    unit_force(:,i) = rbt.Apinv*sat_ft(:,i);
end

figure(14)
plot(unit_force')

%% Fall analysis: 
figure(15);

t0 = 3.0; 
tf = 4.0; 

% pos z
subplot(3,1,1);
plot(out.measurement.time, out.measurement.Data(:,3)*100, '.', 'LineWidth', 2.0); hold on;
plot(out.observer_log.time, out.observer_log.Data(:,3)*100, 'LineWidth', 2.0); hold on;
xlim([t0, tf]);
legend('meas', 'est');
title('Position - z axis');
xlabel('Time (s)');
ylabel('Position z (cm)')
grid on


% vel z
subplot(3,1,2)
plot(Time, Observer(:, 3 + 3), 'LineWidth',2.0); hold on;
title('Velocity');
xlim([t0, tf]);

% d1 = designfilt("lowpassiir",FilterOrder=12, ...
%     HalfPowerFrequency=0.15,DesignMethod="butter");
[b,a] = butter(6,0.05,'low');           % IIR filter design
vel_filt = filtfilt(b,a,Observer(:, 3 + 3));
% 
plot(Time, vel_filt, 'LineWidth',2.0);
legend('est', 'est + low-pass-filt');
xlabel('Time (s)');
ylabel('Velocity z (m/s)')
grid on
% 
% acc z
subplot(3,1,3)
plot(out.measurement.time, raw_thrust/mdl.g - 1.0, 'LineWidth', 2.0); hold on;
plot(out.measurement.time, Torque(:, 4)/mdl.g/rbt.m - 1.0, 'LineWidth', 1.0); hold on
dt = mean(diff(out.measurement.time));
plot(out.measurement.time(1:end-1), diff(vel_filt)/dt/mdl.g, 'LineWidth', 2.0);
legend('raw cmd thrust', 'saturated cmd thrust', 'actual accel'); 
title('Cmd thrust');
xlim([t0, tf]);
xlabel('Time (s)');
ylabel('Accelerations z (Gs)');
grid on

%%
t0 = 3000;
tf = 3800;
cmd_thrust = Torque(t0:tf-1, 4)/rbt.m/mdl.g - 1.0;
eps = diff(vel_filt(t0:tf))/dt/mdl.g - (Torque(t0:tf-1, 4)/rbt.m/mdl.g - 1.0);

figure(16);
scatter(cmd_thrust, -eps);
grid on
xlabel("cmd thrust (Gs)"); 
ylabel("Acceleration error (Gs)"); 
title("Thrust error vs cmd thrust"); hold on

poly_order = 1;
cmd_thrusts = -1.2:0.01:1.2;
thrust_error_poly_fit = polyfit(cmd_thrust,-eps,poly_order);
pred_error = polyval(thrust_error_poly_fit, cmd_thrusts);
plot(cmd_thrusts,pred_error); hold off

% figure(2);
% plot(lift, voltage, 'o'); hold on; 
% plot(lifts, pred_volages, '--'); 
% ylabel("cmd voltage (v)"); 
% xlabel("lift force (N)"); 
% title("Lift to Voltage Mapping"); 
