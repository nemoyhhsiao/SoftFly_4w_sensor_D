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
    
    wx       = Observer(:,16);
    wy       = Observer(:,17);
    wz       = Observer(:,18);
    
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
t0 = 2.15;
tend = mdl.rt - 2.1;
VM = rbt.VM_robot_1; 
DV = rbt.DV;
DV_new = -45;
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


%% De-trend data
freq = 1/mean(diff(ax_ts_exp.Time));
T = 1/freq;
att_roll = iddata(ax_ts_exp.Data, tx_ts_exp.Data, T);
[att_roll_detrend,Tr] = detrend(att_roll);
fprintf("Roll Trend:"); Tr

att_pitch = iddata(ay_ts_exp.Data, ty_ts_exp.Data, T);
[att_pitch_detrend,Tr] = detrend(att_pitch);
fprintf("Pitch Trend:"); Tr

figure; 
titles = ["x", "y"];
datasets = {att_roll_detrend, att_pitch_detrend};
for i = 1:2
    subplot(2, 1, i)
    plot(datasets{i}.InputData); hold on; plot(datasets{i}.OutputData, '--');
    legend('ref', 'est');
    title(titles(i));
    xlabel("time (s)")
    ylabel("ang acc")
end

%% Identify first order model for roll and pitch. 
                      
roll_first_order = tfest(att_roll_detrend, 1, 0);
pitch_first_order = tfest(att_pitch_detrend, 1, 0);

disp('=====================================================================');
disp('1st order dynamics'); 
fprintf('pitch fit percentage: %f%%\n', pitch_first_order.Report.Fit.FitPercent);
fprintf('roll fit percentage: %f%%\n\n', roll_first_order.Report.Fit.FitPercent);
disp('---------------------------------------------------------------------');
disp('# Controller Parameters:');
fprintf('roll_time_constant: %f\n', -1/pole(roll_first_order));
fprintf('roll_gain: %f\n', dcgain(roll_first_order));
fprintf('pitch_time_constant: %f\n', -1/pole(pitch_first_order));
fprintf('pitch_gain: %f\n', dcgain(pitch_first_order));
disp('---------------------------------------------------------------------');

% =====================================================================
% 1st order dynamics
% pitch fit percentage: 32.276897%
% roll fit percentage: 42.843360%
% 
% ---------------------------------------------------------------------
% # Controller Parameters:
% roll_time_constant: 0.063085
% roll_gain: 0.956315
% pitch_time_constant: 0.061410
% pitch_gain: 0.788807
% ---------------------------------------------------------------------

figure; step(pitch_first_order); hold on; step(roll_first_order);
legend('pitch', 'roll')

