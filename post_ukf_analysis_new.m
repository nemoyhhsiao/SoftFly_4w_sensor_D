
% Plot UKF signals

% relevant timeseries in the workspace: 
% ukf_z_in, ukf_s, ukf_z_raw_euler, ukf_z_raw_p
% ukf_r_out, ukf_r_dot_out, ukf_R_out, ukf_omega_out
% ukf_r_out1, ukf_r_dot_out1, ukf_R_out1, ukf_omega_out1
% ukf_P_flats
% ukf_p_dot_ground_truth, ukf_omega_ground_truth
% ukf_p_ground_truth, ukf_eul_ground_truth
% ukf_f_cmd_in, ukf_tau_cmd_x_in, ukf_tau_cmd_y_in
% ukf_f_cmd_truth, ukf_tau_cmd_x_truth, ukf_tau_cmd_y_truth

% Plot linear KF results (ignore P)
% ukf_r_out = ukf_r_out1;
% ukf_r_dot_out = ukf_r_dot_out1;
% ukf_R_out = ukf_R_out1;
% ukf_omega_out = ukf_omega_out1;

close all;

ukf_plot_position = true;
ukf_plot_attitude = true;
ukf_plot_velocity = true;
ukf_plot_angular_velocity = true;
ukf_plot_external_force = true;
ukf_plot_external_torque = true;
ukf_plot_s_prediction_out = true;

% The actuations match up. No need to plot them
ukf_plot_actuations = false;

% Position
if ukf_plot_position
    figure(37)
    axs_name = {'x', 'y', 'z'};

    % Convert flattened Ps to diagonal entries
    ts = 1 : size(ukf_P_flats.Time, 1);
    ukf_P_flats_position = zeros(3, size(ukf_P_flats.Time, 1));
    for i = ts
        P = UKF.unflatten_matrix(ukf_P_flats.Data(i, :)');
        ukf_P_flats_position(:, i) = sqrt([P(1,1); P(2,2); P(3,3)]);
    end
    
    for i = 1:3
        subplot(3,1,i)

        % Input
        plot(ukf_z_raw_p.Time, ukf_z_raw_p.Data(:, i), "r");
        hold on;

        % Truth
        plot(ukf_p_ground_truth.Time, ukf_p_ground_truth.Data(:, i), "m");
        hold on;
        
        % Output
        plot(ukf_r_out.Time, ukf_r_out.Data(:, i), "b");
        hold on;

        % Old output
        plot(ukf_r_out_old.Time, ukf_r_out_old.Data(:, i), "color", [0.4660 0.6740 0.1880]);
        hold on;

        % Covariance
        plot(ukf_P_flats.Time, ukf_r_out.Data(:, i) + ukf_P_flats_position(i, :)', "b", LineStyle="--");
        plot(ukf_P_flats.Time, ukf_r_out.Data(:, i) - ukf_P_flats_position(i, :)', "b", LineStyle="--");
        hold off;

        legend(axs_name{i} + "_{input}", axs_name{i} + "_{truth}", axs_name{i} + "_{ukf}", axs_name{i} + "_{old}");

        title("Position vs Time")
        xlabel('Time (s)');
        ylabel('Position (m)');
    end

    % Covs on separate plot
    figure(401);
    for i = 1:3
        subplot(3,1,i);
        % Covariance
        plot(ukf_P_flats.Time, ukf_P_flats_position(i, :), "b");
        title("Estimated Position Uncertainty")
        xlabel('Time (s)');
        ylabel('Position (m)');
    end
end

% Attitude
if ukf_plot_attitude
    figure(38)
    axs_name = {'x', 'y', 'z'};
    
    % Convert flattened Rs to euls
    ts = 1 : size(ukf_R_out.Time, 1);
    processed_ukf_R_out_data = zeros(3, size(ukf_R_out.Time, 1));
    for i = ts
        R = UKF.unflatten_matrix(ukf_R_out.Data(i, :)');
        eul_xyz = rotm2eul(R, "XYZ")';
        processed_ukf_R_out_data(:, i) = eul_xyz;
    end

    % Same, but for old
    ts = 1 : size(ukf_R_out_old.Time, 1);
    processed_ukf_R_out_old_data = zeros(3, size(ukf_R_out_old.Time, 1));
    for i = ts
        R = UKF.unflatten_matrix(ukf_R_out_old.Data(i, :)');
        eul_xyz = rotm2eul(R, "XYZ")';
        processed_ukf_R_out_old_data(:, i) = eul_xyz;
    end

    % Convert flattened Ps to diagonal entries
    ts = 1 : size(ukf_P_flats.Time, 1);
    ukf_P_flats_attitude = zeros(3, size(ukf_P_flats.Time, 1));
    for i = ts
        P = UKF.unflatten_matrix(ukf_P_flats.Data(i, :)');
        curr_dp = sqrt([P(4,4); P(5,5); P(6,6)]);
        curr_dq = UKF.mrp_dp_to_dq(curr_dp, ukf_sys.constants.mrp_a);

        curr_R = UKF.unflatten_matrix(ukf_R_out.Data(i, :)');
        curr_q = transpose(rotm2quat(curr_R));

        curr_q_bound_1 = Quaternion.multiply(curr_dq, curr_q);
        curr_q_bound_2 = Quaternion.multiply(Quaternion.inverse(curr_dq), curr_q);

        curr_R_bound_1 = quat2rotm(Quaternion.to_matlab(curr_q_bound_1));
        curr_R_bound_2 = quat2rotm(Quaternion.to_matlab(curr_q_bound_2));

        curr_euls_bound_1 = rotm2eul(curr_R_bound_1, "XYZ");
        curr_euls_bound_2 = rotm2eul(curr_R_bound_2, "XYZ");

        curr_bound = abs(curr_euls_bound_1 - curr_euls_bound_2) / 2;
        ukf_P_flats_attitude(:, i) = curr_bound;
    end

    for i = 1:3
        subplot(3,1,i)
        
        % Input
        plot(ukf_z_raw_euler.Time, ukf_z_raw_euler.Data(:, i), "r");
        hold on;

        % Truth
        plot(ukf_eul_ground_truth.Time, ukf_eul_ground_truth.Data(:, i), "m");
        hold on;

        % Output
        plot(ukf_R_out.Time, processed_ukf_R_out_data(i, :), "b");
        hold on;

        % Old output
        plot(ukf_R_out_old.Time, processed_ukf_R_out_old_data(i, :), "color", [0.4660 0.6740 0.1880]);
        hold on;

        % Covariance
        plot(ukf_P_flats.Time, processed_ukf_R_out_data(i, :) + ukf_P_flats_attitude(i, :), "b", LineStyle="--");
        plot(ukf_P_flats.Time, processed_ukf_R_out_data(i, :) - ukf_P_flats_attitude(i, :), "b", LineStyle="--");
        hold off;

        legend(axs_name{i} + "_{input}", axs_name{i} + "_{truth}", axs_name{i} + "_{ukf}", axs_name{i} + "_{old}");

        title("Euler angle vs Time")
        xlabel('Time (s)');
        ylabel('Euler (rad)');
        % ylim([-0.3,0.3]);
    end
    
    % Covs on separate plot
    figure(402);
    for i = 1:3
        subplot(3,1,i);
        % Covariance
        plot(ukf_P_flats.Time, ukf_P_flats_attitude(i, :), "b");
        title("Estimated Attitude Uncertainty")
        xlabel('Time (s)');
        ylabel('Attitude (error)');
    end
end

% Velocity
if ukf_plot_velocity
    figure(39)
    axs_name = {'x', 'y', 'z'};

    % Convert flattened Ps to diagonal entries
    ts = 1 : size(ukf_P_flats.Time, 1);
    ukf_P_flats_velocity = zeros(3, size(ukf_P_flats.Time, 1));
    for i = ts
        P = UKF.unflatten_matrix(ukf_P_flats.Data(i, :)');
        ukf_P_flats_velocity(:, i) = sqrt([P(7,7); P(8,8); P(9,9)]);
    end

    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_p_dot_ground_truth.Time, ukf_p_dot_ground_truth.Data(:, i), "m");
        hold on;

        % Output
        plot(ukf_r_dot_out.Time, ukf_r_dot_out.Data(:, i), "b");
        hold on;

        % Old output
        plot(ukf_r_dot_out_old.Time, ukf_r_dot_out_old.Data(:, i), "color", [0.4660 0.6740 0.1880]);
        hold on;

        % Covariance
        plot(ukf_P_flats.Time, ukf_r_dot_out.Data(:, i) + ukf_P_flats_velocity(i, :)', "b", LineStyle="--");
        plot(ukf_P_flats.Time, ukf_r_dot_out.Data(:, i) - ukf_P_flats_velocity(i, :)', "b", LineStyle="--");
        hold off;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf}", axs_name{i} + "_{old}");
        title("Estimated Velocity")
        xlabel('Time (s)');
        ylabel('Velocity (m/s)');
    end

    % Covs on separate plot
    figure(403);
    for i = 1:3
        subplot(3,1,i);
        % Covariance
        plot(ukf_P_flats.Time, ukf_P_flats_velocity(i, :), "b");
        title("Estimated Velocity Uncertainty")
        xlabel('Time (s)');
        ylabel('Velocity (m/s)');
    end
end

% Angular velocity
if ukf_plot_angular_velocity
    figure(40)
    axs_name = {'x', 'y', 'z'};

    % Convert flattened Ps to diagonal entries
    ts = 1 : size(ukf_P_flats.Time, 1);
    ukf_P_flats_angular_velocity = zeros(3, size(ukf_P_flats.Time, 1));
    for i = ts
        P = UKF.unflatten_matrix(ukf_P_flats.Data(i, :)');
        ukf_P_flats_angular_velocity(:, i) = sqrt([P(10,10); P(11,11); P(12,12)]);
    end

    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_omega_ground_truth.Time, ukf_omega_ground_truth.Data(:, i), "m");
        hold on;

        % Output
        plot(ukf_omega_out.Time, ukf_omega_out.Data(:, i), "b");
        hold on;

        % Old output
        plot(ukf_omega_out_old.Time, ukf_omega_out_old.Data(:, i), "color", [0.4660 0.6740 0.1880]);
        hold on;

        % Covariance
        plot(ukf_P_flats.Time, ukf_omega_out.Data(:, i) + ukf_P_flats_angular_velocity(i, :)', "b", LineStyle="--");
        plot(ukf_P_flats.Time, ukf_omega_out.Data(:, i) - ukf_P_flats_angular_velocity(i, :)', "b", LineStyle="--");
        hold off;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf}", axs_name{i} + "_{old}");
        title("Estimated Angular Velocity")
        xlabel('Time (s)');
        ylabel('Angular Velocity (rad/s)');
        % ylim([-2,2]);
    end

    % Covs on separate plot
    figure(404);
    for i = 1:3
        subplot(3,1,i);
        % Covariance
        plot(ukf_P_flats.Time, ukf_P_flats_angular_velocity(i, :), "b");
        title("Estimated Angular Velocity Uncertainty")
        xlabel('Time (s)');
        ylabel('Angular Velocity (rad/s)');
        % ylim([0,1]);
    end
end

% External Force
if ukf_plot_external_force
    figure(41)
    axs_name = {'x', 'y', 'z'};

    % Convert flattened Ps to diagonal entries
    ts = 1 : size(ukf_P_flats.Time, 1);
    ukf_P_flats_F_ext = zeros(3, size(ukf_P_flats.Time, 1));
    for i = ts
        P = UKF.unflatten_matrix(ukf_P_flats.Data(i, :)');
        ukf_P_flats_F_ext(:, i) = sqrt([P(13,13); P(14,14); P(15,15)]);
    end

    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_F_ext_ground_truth.Time, ukf_F_ext_ground_truth.Data(:, i), "m");
        hold on;
        
        % Estimate
        plot(ukf_s.Time, ukf_s.Data(:, 13 + i), "b");
        hold on;

        % Covariance
        plot(ukf_P_flats.Time, ukf_s.Data(:, 13 + i) + ukf_P_flats_F_ext(i, :)', "b", LineStyle="--");
        plot(ukf_P_flats.Time, ukf_s.Data(:, 13 + i) - ukf_P_flats_F_ext(i, :)', "b", LineStyle="--");
        hold off;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf}");
        title("Estimated External Force")
        xlabel('Time (s)');
        ylabel('(N)');
    end

    % Covs on separate plot
    figure(405);
    for i = 1:3
        subplot(3,1,i);
        % Covariance
        plot(ukf_P_flats.Time, ukf_P_flats_F_ext(i, :), "b");
        title("Estimated External Force Uncertainty")
        xlabel('Time (s)');
        ylabel('Force (N)');
    end
end

% External Torque
if ukf_plot_external_torque
    figure(42)
    axs_name = {'x', 'y', 'z'};

    % Convert flattened Ps to diagonal entries
    ts = 1 : size(ukf_P_flats.Time, 1);
    ukf_P_flats_tau_ext = zeros(3, size(ukf_P_flats.Time, 1));
    for i = ts
        P = UKF.unflatten_matrix(ukf_P_flats.Data(i, :)');
        ukf_P_flats_tau_ext(:, i) = sqrt([P(16,16); P(17,17); P(18,18)]);
    end

    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_tau_ext_ground_truth.Time, ukf_tau_ext_ground_truth.Data(:, i), "m");
        hold on;
        
        % Estimate
        plot(ukf_s.Time, ukf_s.Data(:, 16 + i), "b");
        hold on;

        % Covariance
        plot(ukf_P_flats.Time, ukf_s.Data(:, 16 + i) + ukf_P_flats_tau_ext(i, :)', "b", LineStyle="--");
        plot(ukf_P_flats.Time, ukf_s.Data(:, 16 + i) - ukf_P_flats_tau_ext(i, :)', "b", LineStyle="--");
        hold off;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf}");
        title("Estimated External Torque (body frame)")
        xlabel('Time (s)');
        ylabel('(Nm)');
    end

    % Covs on separate plot
    figure(406);
    for i = 1:3
        subplot(3,1,i);
        % Covariance
        plot(ukf_P_flats.Time, ukf_P_flats_tau_ext(i, :), "b");
        title("Estimated External Torque Uncertainty")
        xlabel('Time (s)');
        ylabel('Torque (Nm)');
    end
end

% Predicted state
if ukf_plot_s_prediction_out
    axs_name = {'x', 'y', 'z'};

    % Position
    figure(643)
    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_p_ground_truth.Time, ukf_p_ground_truth.Data(:, i), "m");
        hold on;
        
        % Estimate
        plot(ukf_s_prediction_out.Time + ukf_prediction_time, ukf_s_prediction_out.Data(:, i), "b");
%         plot(ukf_s_prediction_out.Time, ukf_s_prediction_out.Data(:, i), "b");
        hold on;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf prediction}");
        title("Predicted Position")
        xlabel('Time (s)');
        ylabel('(m)');
        xlim([0, 10]);
    end
    
    % Attitude
    figure(644)
    % Convert flattened Rs to euls
    ts = 1 : size(ukf_s_prediction_out.Time, 1);
    ukf_s_prediction_out_euls = zeros(3, size(ukf_s_prediction_out.Time, 1));
    for i = ts
        q = ukf_s_prediction_out.Data(i, 4:7);
        eul = quat2eul(q, "XYZ");
        ukf_s_prediction_out_euls(:, i) = eul;
    end
    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_eul_ground_truth.Time, ukf_eul_ground_truth.Data(:, i), "m");
        hold on;

        % Output
        plot(ukf_s_prediction_out.Time + ukf_prediction_time, ukf_s_prediction_out_euls(i, :), "b");
%         plot(ukf_s_prediction_out.Time, ukf_s_prediction_out_euls(i, :), "b");
        hold on;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf prediction}");

        title("Predicted Euler Angle")
        xlabel('Time (s)');
        ylabel('Euler (rad)');
        xlim([0, 10]);
    end

    % Velocity
    figure(645)
    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_p_dot_ground_truth.Time, ukf_p_dot_ground_truth.Data(:, i), "m");
        hold on;
        
        % Estimate
        plot(ukf_s_prediction_out.Time + ukf_prediction_time, ukf_s_prediction_out.Data(:, 7+i), "b");
%         plot(ukf_s_prediction_out.Time, ukf_s_prediction_out.Data(:, 7+i), "b");
        hold on;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf prediction}");
        title("Predicted Velocity")
        xlabel('Time (s)');
        ylabel('(m/s)');
        xlim([0, 10]);
    end

    % Angular Velocity
    figure(646)
    for i = 1:3
        subplot(3,1,i)

        % Truth
        plot(ukf_omega_ground_truth.Time, ukf_omega_ground_truth.Data(:, i), "m");
        hold on;
        
        % Estimate
        plot(ukf_s_prediction_out.Time + ukf_prediction_time, ukf_s_prediction_out.Data(:, 10+i), "b");
%         plot(ukf_s_prediction_out.Time, ukf_s_prediction_out.Data(:, 10+i), "b");
        hold on;

        legend(axs_name{i} + "_{truth}", axs_name{i} + "_{ukf prediction}");
        title("Predicted Angular Velocity")
        xlabel('Time (s)');
        ylabel('(rad/s)');
        xlim([0, 10]);
    end
end

if ukf_plot_actuations
    Plotter.plot_single_timeseries_comparison(ukf_f_cmd_truth, ukf_f_cmd_in, "truth", "in", "f cmd", "Time (s)", "(N)", 630);
    Plotter.plot_single_timeseries_comparison(ukf_tau_cmd_x_truth, ukf_tau_cmd_x_in, "truth", "in", "tau cmd x", "Time (s)", "(Nm)", 631);
    Plotter.plot_single_timeseries_comparison(ukf_tau_cmd_y_truth, ukf_tau_cmd_y_in, "truth", "in", "tau cmd y", "Time (s)", "(Nm)", 632);
end