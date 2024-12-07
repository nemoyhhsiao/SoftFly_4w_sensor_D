close all

opti_x = rst_xy_dot_compare.signals(1).values(:,1);
opti_y = rst_xy_dot_compare.signals(1).values(:,2);

vicon_x = rst_xy_dot_compare.signals(2).values(:,1);
vicon_y = rst_xy_dot_compare.signals(2).values(:,2);  

%%

k         = 0.206;
offset    = 0;
opti_gain = (mean(rst_p_raw.signals.values(:,3)) + offset) * k;

% k = opti_gain / mean(rst_leaf_paper.signals.values(:,3));
% 
% % th_gain = mean(rst_leaf_paper.signals.values) *deg2rad(42)/35

figure(859)
plot(vicon_x); hold on
plot(opti_x.* opti_gain);
legend("Vicon",  "Opti adjusted")
title("x dot")
set(gcf, 'Units', 'centimeters');
set(gcf, 'Position', [3, 3, 20, 20]); % [l b w h]
ylim([-1 1])
hold off

figure(858)
plot(vicon_y); hold on
plot(opti_y.* -opti_gain);
legend("Vicon", "Opti adjusted")
title("y dot")
set(gcf, 'Units', 'centimeters');
set(gcf, 'Position', [25, 3, 20, 20]); % [l b w h]
ylim([-1 1])
hold off


if 0
    figure()
    plot(opti_x); hold on
    plot(opti_y)
end

