%% Minimal closed loop mpc/simulink example
close all; clear all; clc;
addpath("~/Documents/acados/examples/acados_matlab_octave/getting_started") % load the mpc for softfly, but not the c-gen code 
addpath("~/octobee_control/c_generated_code")   % simulink s functions that will be used also for full softly simulink simulation

T_sim = 1.0/1000.0;
T_delay = 0.00;     % works up to 0.016
stop_time = 5.0;

% load parameters and actuation constraints
nmpc_acados_setup

x0 = [
    0.0*ones(3,1); ... 
    0.0*ones(3,1); ...
    [zeros(3,1); 1]; ... 
    zeros(3,1); 
    zeros(4,1)];

% runs simulink
out = sim("nmpc_acados/simulink_model_closed_loop");

% plots signals
log_x_in = out.log_x_in;
figure 
subplot(7,1,1)
plot(log_x_in.Time, log_x_in.Data(:, 1:3), 'LineWidth', 3); title("Pos.");
subplot(7,1,2)
plot(log_x_in.Time, log_x_in.Data(:, 4:6),'LineWidth', 3); title("Vel.");
subplot(7,1,3)
plot(log_x_in.Time, log_x_in.Data(:, 7:10),'LineWidth', 3); title("Quat.");
subplot(7,1,4)
plot(log_x_in.Time, log_x_in.Data(:, 11:13),'LineWidth', 3); title("Ang. vel.");
subplot(7,1,5)
plot(log_x_in.Time, log_x_in.Data(:, 14:17),'LineWidth', 3); title("f cmd.");
subplot(7,1,6)
%plot(log_x_in.Time, log_x_in.Data(:, 18:20),'LineWidth', 3); title("f ext");
subplot(7,1,7)
%plot(log_x_in.Time, log_x_in.Data(:, 21),'LineWidth', 3); title("time");