% Identify voltage to thrust coefficients
% Andrea Tagliabue, 2022 MIT
% assume: voltage $v_i = \beta_i + \alpha f_i$, $f_i$ is thrust force
close all
%% Load signals (from analysis_v4)
if 1
    x        = Measurement(:,1);
    y        = Measurement(:,2);
    z        = Measurement(:,3);
    
    Tx       = Torque(:,1);
    Ty       = Torque(:,2);
    Tz       = Torque(:,3);
    Force    = Torque(:,4);
    
    wx       = Observer(:,19);
    wy       = Observer(:,20);
    wz       = Observer(:,21);
    
    DS_Time  = 0:mdl.T_high:Time(end);
    
    if length(DS_Time) ~= length(DrivingSignals)
        DS_Time = 0:mdl.T_high:Time(end);
    end
    
    if 0
        DS_Time = 0:mdl.T_high:Time(end)+mdl.T_high;
    end

else
   Time = yout(:,1);
   x = yout(:,2);
   y = yout(:,3);
   z = yout(:,4);

   Tx = yout(:,18);
   Ty = yout(:,19);
   Tz = yout(:,20);

   Force = yout(:, 21);

   Voltage = yout(:,14:17);

   wx = log_est_B_omega.Data(:, 1);
   wy = log_est_B_omega.Data(:, 2);
   wz = log_est_B_omega.Data(:, 3);

   rbt.VM_robot_1 = rbt.VM;

end



%% Robot and experiment parameters
mass = rbt.m;
gravity = 9.80655;
Ixx = rbt.ixx;
Iyy = rbt.iyy;
lx = rbt.ld;
ly = rbt.lt;
t0 = 2.3;
tend = 2.85; %mdl.rt-0.1;
VM = rbt.VM_robot_1; 
DV = rbt.DV;
DV_new = 90;
% the thrust to voltage coeff for the first act. $v_1 = \beta_1 + \alpha*f_1$
fprintf("==============\n");
fprintf(" Existing thrust to voltage coeff: \n")
fprintf("alpha = %.2f \n", VM(1));
fprintf("beta_1 = %.2f \n",  DV(1));
fprintf("beta_2 = %.2f \n",  DV(2));
fprintf("beta_3 = %.2f \n",  DV(3));
fprintf("beta_4 = %.2f \n",  DV(4));
fprintf("==============")
theta_existing = [1/VM(1), (VM(2) + DV(2))/VM(1), (VM(2) + DV(3))/VM(1), (VM(2) + DV(4))/VM(1)]';

%% Compute delay: 
% Compute actuation delay - torque to angular acceleration
figure(23)

ax      = diff(wx)/mdl.T;
ay      = diff(wy)/mdl.T;

subplot(2,2,1)
ax_ts = timeseries(ax, Time(1:end-1), 'Name', 'ang acc x');
tx_ts = timeseries(Tx(2:end)./rbt.ixx, Time(2:end), 'Name', 'cmd torque x');

d1 = designfilt("lowpassiir",'FilterOrder', 12, ...
    'HalfPowerFrequency', 0.006, 'DesignMethod', "butter");
ax_ts = timeseries(filtfilt(d1,ax_ts.Data), ax_ts.Time, 'Name', 'ang acc x LP');



ax_ts_exp = getsampleusingtime(ax_ts, t0, tend);
tx_ts_exp = getsampleusingtime(tx_ts, t0, tend);
plot(ax_ts_exp); hold on;
plot(tx_ts_exp);
title("torque, ang acc, x axis")
xlabel("Time (s)")
ylabel("ang acc (rad/s^2)")
legend("meas acc", "cmd acc")

subplot(2,2,2);
[c,lags] = xcorr(ax_ts_exp.Data, tx_ts_exp.Data, 'normalized', 0.1/mdl.T);
stem(lags*mdl.T,c)
title("Cross correlation torque-ang acc, x axis")
xlabel("Time (s)")

[~, max_lag_idx] = max(c);
delay_torque_x = lags(max_lag_idx)*mdl.T;
fprintf("============\n")
fprintf("delay (torque x) %.4f\n", delay_torque_x);

subplot(2,2,3)
ay_ts = timeseries(ay, Time(2:end), 'Name', 'ang acc y');
ty_ts = timeseries(Ty(2:end)./rbt.iyy, Time(2:end), 'Name', 'cmd torque y');
ay_ts = timeseries(filtfilt(d1,ay_ts.Data), ay_ts.Time, 'Name', 'ang acc y LP');
ay_ts_exp = getsampleusingtime(ay_ts, t0, tend);
ty_ts_exp = getsampleusingtime(ty_ts, t0, tend);
plot(ay_ts_exp); hold on;
plot(ty_ts_exp);
title("torque, ang acc, y axis")
xlabel("Time (s)")
ylabel("ang acc (rad/s^2)")
legend("meas acc", "cmd acc")

subplot(2,2,4)
[c,lags] = xcorr(ay_ts_exp.Data,ty_ts_exp.Data, 'normalized', 0.1/mdl.T);
stem(lags*mdl.T,c)
title("Cross correlation torque-ang acc, y axis")
xlabel("Time (s)")

[~, max_lag_idx] = max(c);
delay_torque_y = lags(max_lag_idx)*mdl.T;
fprintf("delay (torque y) %.4f\n", delay_torque_y);

avg_delay = mean([delay_torque_x, delay_torque_y]);
fprintf("delay (avg) %.4f\n", avg_delay);
fprintf("============\n")
if ctr.en == 0
    avg_delay = 0.027;
end
avg_delay = 0.015
%% Compute voltages, and correct for delay
% we compensate for the delays by shifting the time of the voltages in the
% future
figure
voltage_ts = timeseries(Voltage, Time, 'Name', 'act. voltage'); 
voltage_ts_exp = getsampleusingtime(voltage_ts, t0 - avg_delay, tend - avg_delay);
plot(voltage_ts_exp)

%% Compute the thrust force in body 
figure
pos_ts = timeseries([x, y, z], Time, 'Name', 'pos');
plot(pos_ts); hold on
d1 = designfilt("lowpassiir",'FilterOrder', 12, ...
    'HalfPowerFrequency', 0.025, 'DesignMethod', "butter");
pos_filt_ts = timeseries(filtfilt(d1,pos_ts.Data), Time, 'Name', 'pos LP');
plot(pos_filt_ts);
title("Position & Position filtered")

figure
lin_acc_ts = timeseries(diff(diff(pos_filt_ts.Data))/mdl.T^2, Time(3:end));
plot(lin_acc_ts);
title("acceleration in world")

figure
thrust_force_world_ts = timeseries(rbt.m.*lin_acc_ts.Data, lin_acc_ts.Time, 'Name', 'thrust force W');
thrust_force_world_ts.Data(:, 3) = thrust_force_world_ts.Data(:, 3) + mass*gravity;
plot(thrust_force_world_ts);
title("thrust force in world");

% compute thrust force in body 
figure
thrust_force_body_ts = timeseries(vecnorm(thrust_force_world_ts.Data, 2, 2), thrust_force_world_ts.Time, 'Name', 'thrust force B');
plot(thrust_force_body_ts);
title("thrust force in body");

figure
thrust_force_body_ts_exp = getsampleusingtime(thrust_force_body_ts, t0, tend);
plot(thrust_force_body_ts_exp);
title("thrust force in body selected for experiment");

%% Compute gyroscopic effects
% omega cross J omega
tau_gyro = zeros(numel(Time), 3);
for i = 1:numel(Time)
    w = [wx(i); wy(i); wz(i)];
    tau_gyro(i, :) = cross(w,diag([rbt.ixx, rbt.iyy, rbt.izz])*w);
end

tau_gyro_ts = timeseries(tau_gyro, Time, 'Name', 'torque: omega cross J omega');
tau_gyro_ts_exp = getsampleusingtime(tau_gyro_ts, t0, tend);
figure
plot(tau_gyro_ts_exp);
title("Gyroscopic effects")

%% Ensure that all the signals have same len
min_len = min([numel(thrust_force_body_ts_exp.Time), numel(ax_ts_exp.Time), ...
    numel(ay_ts_exp.Time),  numel(voltage_ts_exp.Time), numel(tau_gyro_ts_exp.Time)]);
t_idx = [1:min_len];
thrust_force_body_ts_exp = getsamples(thrust_force_body_ts_exp, t_idx);
ax_ts_exp = getsamples(ax_ts_exp, t_idx);
ay_ts_exp = getsamples(ay_ts_exp, t_idx);
voltage_ts_exp = getsamples(voltage_ts_exp, t_idx);
tau_gyro_ts_exp = getsamples(tau_gyro_ts_exp, t_idx);


%% Linear LS: Estimate only beta2, ..., beta4 & not alpha
alpha = VM(1);
beta_1 = VM(2) + DV_new;
% Identify coefficiens by solving LS problem
% E.g. torque x:
% (meas) y: $(meas_ang_acc_x*Ixx + [\omega \cross J \omega]_1)/ly*alpha -
% (-v_1 + v_2 + v_3 - v_4) - \beta_1$
% assume: voltage $v_i = \beta_i + \alpha f_i$, $f_i$ is thrust force
% (params) theta:  $[\beta_2, ..., \beta_4]$

if ctr.en
    factor = 1;
else
    factor = 1;
end

% Torque on x
Yx = (ax_ts_exp.Data*Ixx + tau_gyro_ts_exp.Data(:,1))/ly*alpha ...
    - (-voltage_ts_exp.Data(:,1) + voltage_ts_exp.Data(:,2) + voltage_ts_exp.Data(:,3) - voltage_ts_exp.Data(:,4)) - beta_1;
n = numel(Yx);
Xx = zeros(n, 3);
Xx(:, 1) = -ones(n, 1);
Xx(:, 2) = -ones(n, 1);
Xx(:, 3) = ones(n, 1);

% torque on y
Yy = (ay_ts_exp.Data*Iyy + tau_gyro_ts_exp.Data(:,2))/lx*alpha ...
    - (-voltage_ts_exp.Data(:,1) - voltage_ts_exp.Data(:,2) + voltage_ts_exp.Data(:,3) + voltage_ts_exp.Data(:,4)) - beta_1;
Xy = zeros(n, 3);
Xy(:, 1) = ones(n, 1);
Xy(:, 2) = -ones(n, 1);
Xy(:, 3) = -ones(n, 1);


% thrust
Yt = thrust_force_body_ts_exp.Data*factor*alpha ...
    - (voltage_ts_exp.Data(:,1) + voltage_ts_exp.Data(:,2) + voltage_ts_exp.Data(:,3) + voltage_ts_exp.Data(:,4)) + beta_1;
Xt = zeros(n, 3);
Xt(:, 1) = -ones(n, 1);
Xt(:, 2) = -ones(n, 1);
Xt(:, 3) = -ones(n, 1);

% combine torques, thrust and solve LS problem
theta = [Xx; Xy; Xt]\[Yx; Yy; Yt];
beta_2 = theta(1);
beta_3 = theta(2);
beta_4 = theta(3);
fprintf("==============\n");
fprintf(" Thrust to voltage coeff. assuming alpha, beta_1 fixed: \n")
fprintf("alpha = %.2f \n", alpha);
fprintf("beta_1 = %.2f \n", beta_1-VM(2));
fprintf("beta_2 = %.2f \n", beta_2-VM(2));
fprintf("beta_3 = %.2f \n", beta_3-VM(2));
fprintf("beta_4 = %.2f \n", beta_4-VM(2));
fprintf("==============")
% used to make a nicer plot later on:
theta_fixed_alpha = [1/alpha, beta_2/alpha, beta_3/alpha, beta_4/alpha]';

%% Verify solution found by plotting predicted torques/thrust:
figure
t = ax_ts_exp.Time;
subplot(3,1,1);
plot(t, Yx); hold on;
plot(t, Xx*theta)
title("Torque x axis")
legend("measured", "predicted from voltage")

subplot(3,1,2);
plot(t, Yy); hold on;
plot(t, Xy*theta)
title("Torque y axis")
legend("measured", "predicted from voltage")

subplot(3,1,3);
plot(t, Yt); hold on;
plot(t, Xt*theta)
title("Thrust body")
legend("measured", "predicted from voltage")

%% Linear LS - estimate beta 2 ... 4 and alpha
% Identify coefficiens by solving LS problem 
% E.g. torque x:
% (meas) y: $(meas_ang_acc_x*Ixx + [\omega \cross J \omega]_1)/ly$
% assume: voltage $v_i = \beta_i + \alpha f_i$, $f_i$ is thrust force
% (params) theta:  $[\frac{1}{\alpha}, \frac{\beta_2}{\alpha}, ..., \frac{\beta_4}{\alpha}]$

beta_1 = VM(2) + DV_new;
% torque x
Yx = (ax_ts_exp.Data*Ixx + tau_gyro_ts_exp.Data(:,1))/ly;
n = numel(Yx);
Xx = zeros(n, 4);
Xx(:, 1) = -voltage_ts_exp.Data(:,1) + voltage_ts_exp.Data(:,2) + voltage_ts_exp.Data(:,3) - voltage_ts_exp.Data(:,4) + beta_1;
Xx(:, 2) = -ones(n, 1);
Xx(:, 3) = -ones(n, 1);
Xx(:, 4) = ones(n, 1);

% torque y
Yy = (ay_ts_exp.Data*Iyy + + tau_gyro_ts_exp.Data(:,2))/lx;
Xy = zeros(n, 4);
Xy(:, 1) = -voltage_ts_exp.Data(:,1) - voltage_ts_exp.Data(:,2) + voltage_ts_exp.Data(:,3) + voltage_ts_exp.Data(:,4) + beta_1;
Xy(:, 2) = ones(n, 1);
Xy(:, 3) = -ones(n, 1);
Xy(:, 4) = -ones(n, 1);

% thrust 
Yt = thrust_force_body_ts_exp.Data;
Xt = zeros(n, 4);
Xt(:, 1) = voltage_ts_exp.Data(:,1) + voltage_ts_exp.Data(:,2) + voltage_ts_exp.Data(:,3) + voltage_ts_exp.Data(:,4) - beta_1;
Xt(:, 2) = -ones(n, 1);
Xt(:, 3) = -ones(n, 1);
Xt(:, 4) = -ones(n, 1);


% combine
theta = [Xx; Xy; Xt]\[Yx; Yy; Yt];
alpha = 1/theta(1);
beta_2 = theta(2)*alpha;
beta_3 = theta(3)*alpha;
beta_4 = theta(4)*alpha;
fprintf("==============\n");
fprintf(" Thrust to voltage coeff. assuming beta_1 fixed: \n")
fprintf("alpha = %.2f \n", alpha);
fprintf("beta_1 = %.2f \n", beta_1);
fprintf("beta_2 = %.2f \n", beta_2);
fprintf("beta_3 = %.2f \n", beta_3);
fprintf("beta_4 = %.2f \n", beta_4);
fprintf("==============")

%% Verify solution found by plotting predicted torques/thrust:
figure
subplot(3,1,1);
plot(t, Yx*ly); hold on;
plot(t, Xx*theta_fixed_alpha*ly); hold on;
plot(t, Xx*theta*ly); hold on;
plot(t, Xx*theta_existing*ly)
xlabel("Time (s)")
ylabel("~ prop. to torque")
title("Torque x axis")
legend("measured", "predicted, fixed alpha", "predicted, free alpha", "predicted, existing mapping")

subplot(3,1,2);
plot(t, Yy*lx); hold on;
plot(t, Xy*theta_fixed_alpha*lx); hold on;
plot(t, Xy*theta*lx); hold on;
plot(t, Xy*theta_existing*lx)
xlabel("Time (s)")
ylabel("~ prop. to torque")
title("Torque y axis")
legend("measured", "predicted, fixed alpha", "predicted, free alpha", "predicted, existing mapping")

subplot(3,1,3);
plot(t, Yt/mass); hold on;
plot(t, Xt*theta_fixed_alpha/mass); hold on;
plot(t, Xt*theta/mass)
plot(t, Xt*theta_existing/mass)
xlabel("Time (s)")
ylabel("~ prop. to thrust")
title("Thrust body")
legend("measured", "predicted, fixed alpha", "predicted, free alpha", "predicted, existing mapping")