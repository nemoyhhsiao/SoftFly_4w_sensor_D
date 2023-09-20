%% Minimal closed loop mpc/simulink example
close all; clear all; clc;
addpath("~/Documents/acados/examples/acados_matlab_octave/getting_started") % load the mpc for softfly, but not the c-gen code 
addpath("~/octobee_control/c_generated_code")   % simulink s functions that will be used also for full softly simulink simulation

T_sim = 1.0/1000.0;
T_delays = [0.0, 0.005, 0.01, 0.015, 0.016, 0.017]; % 0.016, 0.017, 0.018 % works up to 0.016
tuning_param = [0.25, 0.5, 0.85, 0.9, 0.95, 1.0, 1.25, 1.5, 2.0, 4.0]; %[0.8, 0.9, 0.95, 1.0, 1.05, 1.1, 1.2];
stop_time = 5;
nu = 4;
U_max = 1;
N = 100;

% load parameters and actuation constraints
% nmpc_acados_setup %-> replaced by make_mpc_params

% x0 = [
%     zeros(3,1); ... 
%     zeros(3,1); ...
%     [zeros(3,1); 1]; ... 
%     zeros(3, 1); 
%     zeros(4,1)];

x0 = [
    0.3*ones(3,1); ... 
    0.2*ones(3,1); ...
    [zeros(3,1); 1]; ... 
    zeros(3, 1); 
    zeros(4,1)];

nmpc_acados_setup

% runs simulink simulations
figure 
for j = 1:length(tuning_param)
    for i = 1:length(T_delays)
        
        T_delay = T_delays(i);
        Q_p_tuned = [Q_p(1); Q_p(2); Q_p(3)];
        Q_v_tuned = [Q_v(1); Q_v(2); Q_v(3)];
        r_f_dot_tuned = r_f_dot*tuning_param(j);
        [params, params_i] = make_simulink_params(Q_p_tuned, Q_v_tuned, Q_q, Q_w, q_f, r_f_dot_tuned, ref);
        out{i, j} = sim("nmpc_acados/simulink_model_closed_loop");
        
        % plots signals
        log_x_in = out{i, j}.log_x_in;
        hold on; 
        p = sub2ind([length(tuning_param), length(T_delays)], j, i);
        subplot(length(T_delays),length(tuning_param),p);
        plot(log_x_in.Time, log_x_in.Data(:, 1:3), 'LineWidth', 3); title("Pos.");
        subtitle(sprintf("delay: %.3f, tuning_val: %.3f", T_delays(i), tuning_param(j)));

    %     subplot(7,1,2)
    %     plot(log_x_in.Time, log_x_in.Data(:, 4:6),'LineWidth', 3); title("Vel.");
    %     subplot(7,1,3)
    %     plot(log_x_in.Time, log_x_in.Data(:, 7:10),'LineWidth', 3); title("Quat.");
    %     subplot(7,1,4)
    %     plot(log_x_in.Time, log_x_in.Data(:, 11:13),'LineWidth', 3); title("Ang. vel.");
    %     subplot(7,1,5)
    %     plot(log_x_in.Time, log_x_in.Data(:, 14:17),'LineWidth', 3); title("f cmd.");
    %     subplot(7,1,6)
    %     %plot(log_x_in.Time, log_x_in.Data(:, 18:20),'LineWidth', 3); title("f ext");
    %     subplot(7,1,7)
    %     %plot(log_x_in.Time, log_x_in.Data(:, 21),'LineWidth', 3); title("time");
    end
end

function [params, params_i] = make_simulink_params(Q_p, Q_v, Q_q, Q_w, q_f, r_f_dot, ref) 
N = 100;
nu = 4;
params = [];
for i = 1:N

%     % Tuning weigths of the controller
%     This specific tuning worked up to 0.016 ms.
%     Q_p = [1.4, 1.5, 1.5*200]';
%     Q_v = [0.12, 0.12, 1.5*10.0]';
%     Q_q = [2, 2, 2, 2]';
%     Q_w = [0.1, 0.1, 0.0]';
%     q_f = 1e-4;
% 
%     r_f_dot = 170;

    cost = [Q_p; ...
            Q_v; ...
            Q_q; ...
            Q_w; ...
            q_f; ...
            r_f_dot];  

    params_i = [ref; cost];
    params = [params; params_i];
end
params = [params; params_i];

end