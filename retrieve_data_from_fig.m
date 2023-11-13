
fig = openfig('39s_failed/ext_torque.fig');
ax = fig.CurrentAxes;
g_array = ax.Children;
x1 = g_array(1).XData;
y1 = g_array(1).YData;
y2 = g_array(2).YData;