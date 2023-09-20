close all; clear all; clc;


m = 0.72e-3;
g = 9.81; 
poly_order = 5;

voltage = [1000, 1400, 1600, 1900, 2000];

lift = [m*g/64, m*g/8, m*g/4, m*g/2, m*g*1.2/2]; 

figure(1);
plot(voltage, lift, 'o');
xlabel("cmd voltage (v)"); 
ylabel("lift force (N)"); 
title("Voltage to Lift Mapping")


lifts = [lift(1):m*g/100:lift(end)];
thrust_to_voltage_poly_fit = polyfit(lift,voltage,poly_order);
pred_volages = polyval(thrust_to_voltage_poly_fit,lifts);

figure(2);
plot(lift, voltage, 'o'); hold on; 
plot(lifts, pred_volages, '--'); 
ylabel("cmd voltage (v)"); 
xlabel("lift force (N)"); 
title("Lift to Voltage Mapping"); 

save('thrust_to_voltage_poly_fit', 'thrust_to_voltage_poly_fit');

