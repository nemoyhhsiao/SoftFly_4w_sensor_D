% close all

t_con  = rst_driving_signals.time;
dr_con = rst_driving_signals.signals.values;

t_mea  = time; % -44.8460;
dr_mea = raw_data(:,1:2:7);

figure()
plot(t_con,dr_con(:,1),t_mea,dr_mea(:,4))


%%
threshold = 1;
dr_m = dr_mea(:,1);
dr_m(dr_m< threshold) = 0;
dr_c = dr_con(:,1);
dr_c(dr_c< threshold) = 0;

%%
threshold = 0.5;

sq     = double(squarewave_udp.signals.values);
udp    = data_udp;
t_sq   = squarewave_udp.time;
t_udp  = time_udp;

udp(udp < threshold) = 0;
sq(sq < threshold) = 0;

[pks_udp, locs_udp] = findpeaks(udp);
[pks_sq, locs_sq] = findpeaks(sq);

t_diff_udp = t_udp(locs_udp(2)) - t_sq(locs_sq(1))

t_udp_plot = t_udp-t_diff_udp;

figure()
plot(t_sq,sq,t_udp_plot,udp)
xlim([0, 15])
legend("driving","measured")
%%
[pks_m, locs_m] = findpeaks(dr_m,'MinPeakDistance',40);
[pks_c, locs_c] = findpeaks(dr_c,'MinPeakDistance',10);

%%
t_diff = time(locs_m(1)) - t_con(locs_c(1))
t_mea = time - t_diff;


figure()
plot(t_con,dr_con(:,1),t_mea,dr_mea(:,1))
xlim([0, 15])
title("Amplifier 1")
legend("driving","measured")

figure()
plot(t_con,dr_con(:,2),t_mea,dr_mea(:,2))
xlim([0, 15])
title("Amplifier 2")
legend("driving","measured")

figure()
plot(t_con,dr_con(:,3),t_mea,dr_mea(:,3))
xlim([0, 15])
title("Amplifier 3")
legend("driving","measured")

figure()
plot(t_con,dr_con(:,4),t_mea,dr_mea(:,4))
xlim([0, 15])
title("Amplifier 4")
legend("driving","measured")