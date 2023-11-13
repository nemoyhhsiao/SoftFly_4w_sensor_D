
load("39s_failed\ext_torque.mat")
figure(1001)
plot(x1,y1); hold on
plot(x1,y2)
xlim([10 39.5])
ylim([-6e-6 10e-6]); hold off


%%
xlim([35.5 39.5])

%%

ext.x = rst_ext_torque_b.signals.values(:,1);
ext.y = rst_ext_torque_b.signals.values(:,2);
ext.t = rst_ext_torque_b.time;

sd.folder   = "data/ext_";
sd.date     = string(datetime('now','Format','yyyy-MM-dd_HH-mm-ss'));
sd.filetype = ".mat";

sd.filename = sd.folder + sd.date + sd.filetype;
save(sd.filename,"ext","ctr");


%%

figure(1001); hold on
plot(ext.t,ext.x); hold on
plot(ext.t,ext.y); hold off
