% UKF Implementation

classdef UKF
    methods(Static)
        function [p, q, p_dot, omega, F_ext, tau_ext] = unpack_s(s)
            p = s(1:3);
            q = s(4:7);
            p_dot = s(8:10);
            omega = s(11:13);
            F_ext = s(14:16);
            tau_ext = s(17:19);
        end

        function [p, dp, p_dot, omega, F_ext, tau_ext] = unpack_s_dp(s_dp)
            p = s_dp(1:3);
            dp = s_dp(4:6);
            p_dot = s_dp(7:9);
            omega = s_dp(10:12);
            F_ext = s_dp(13:15);
            tau_ext = s_dp(16:18);
        end

        function [z_dp] = z_to_z_dp(z, dp)
            Validate.z(z);
            Validate.dp(dp);
            z_dp = vertcat(z(1:3,1), dp);
        end

        function [dp] = mrp_dq_to_dp(dq, a)
            Validate.q(dq);
            
            % Formulation of MRP in the report
            f = 2 * ( a + 1 );
            q_scalar = Quaternion.extract_scalar(dq);
            q_vector = Quaternion.extract_vector(dq);
            dp = f * q_vector / ( a + q_scalar );
            
            Validate.dp(dp);
        end

        function [dq] = mrp_dp_to_dq(dp, a)
            Validate.dp(dp);

            % Formulation of MRP in the report
            f = 2 * ( a + 1 );
            norm_dp_squared = norm(dp) ^ 2;
            q_scalar = ( (- a) * norm_dp_squared + f * sqrt(f^2 + (1 - a^2) * norm_dp_squared) ) ...
                        / ( f^2 + norm_dp_squared );
            q_vector = (1 / f) * (a + q_scalar) * dp;

            dq = Quaternion.reconstruct(q_scalar, q_vector);
            dq = Quaternion.clean(dq);
            
            Validate.q(dq);
        end

        function [dp] = q_to_dp(q, q_ref, a)
            q_ref_inv = Quaternion.inverse(q_ref);
            dq = Quaternion.multiply(q, q_ref_inv);
            dp = UKF.mrp_dq_to_dp(dq, a);
        end

        function [q] = dp_to_q(dp, q_ref, a)
            dq = UKF.mrp_dp_to_dq(dp, a);
            q = Quaternion.multiply(dq, q_ref);
        end
        
        function [s_dp] = s_to_s_dp(s)
            s_dp = vertcat(s(1:3), zeros(3,1), s(8:end));
        end

        function [s] = s_dp_to_s(s_dp, q)
            s = vertcat(s_dp(1:3), q, s_dp(7:end));
        end

        function [w_m, w_c] = generate_sigma_point_weights(n_dp, lambda)
            % From journal
            w_c_0 = lambda / (lambda + n_dp);
            w_m_0 = lambda / (lambda + n_dp);
            w_rest = 1 / (2 * (lambda + n_dp));

            w_raw = ones(2 * n_dp, 1) * w_rest;

            w_m = vertcat(w_m_0, w_raw);
            w_c = vertcat(w_c_0, w_raw);
        end

        function [s_dp_sigma_points] = generate_sigma_points(s_dp, P, n_dp, lambda)
            raw_residuals = chol( (lambda + n_dp) * P );

            residual_0 = zeros(n_dp, 1);
            residuals_i = transpose(raw_residuals);
            residuals_i_plus_n = - transpose(raw_residuals);

            % s_dp_sigma_points = s_dp + horzcat(residual_0, residuals_i, residuals_i_plus_n); % repmat?
            s_dp_sigma_points = repmat(s_dp, 1, 2 * n_dp + 1) + horzcat(residual_0, residuals_i, residuals_i_plus_n);
        end
        
        function [next_s, next_P] = predict(s, P, f_cmd, tau_cmd_x, tau_cmd_y, sys)
            Validate.sys_ukf(sys);
            Validate.scalar(f_cmd);
            Validate.scalar(tau_cmd_x);
            Validate.scalar(tau_cmd_y);

            % Extract constants
            n_dp = size(s, 1) - 1;
            a = sys.constants.mrp_a;
            lambda = sys.constants.lambda;

            % Generate sigma point weights
            [w_m, w_c] = UKF.generate_sigma_point_weights(n_dp, lambda);

            % Generate sigma points
            [~, q, ~, ~, ~, ~] = UKF.unpack_s(s);
            s_dp = UKF.s_to_s_dp(s);
            s_dp_sigma_points = UKF.generate_sigma_points(s_dp, P, n_dp, lambda);

            % Propagate sigma points
            next_q_mean = [1;0;0;0]; % Placeholder value
            next_s_dp_sigma_points = zeros(n_dp, 2 * n_dp + 1);
            for i = 1 : (2 * n_dp + 1)
                s_dp_sigma_i = s_dp_sigma_points(:,i);

                % Unpack different state variables from s_dp
                [p_sigma_i, dp_sigma_i, p_dot_sigma_i, omega_sigma_i, F_ext_sigma_i, tau_ext_sigma_i] = UKF.unpack_s_dp(s_dp_sigma_i);
                q_sigma_i = UKF.dp_to_q(dp_sigma_i, q, a);

                % Propogate dynamics
                [
                    next_p_sigma_i, ...
                    next_p_dot_sigma_i, ...
                    next_q_sigma_i, ...
                    next_omega_sigma_i, ...
                    next_F_ext_sigma_i, ...
                    next_tau_ext_sigma_i ...
                ] = Dynamics.step( ...
                    p_sigma_i, ...
                    p_dot_sigma_i, ...
                    q_sigma_i, ...
                    omega_sigma_i, ...
                    f_cmd, ...
                    tau_cmd_x, ...
                    tau_cmd_y, ...
                    F_ext_sigma_i, ...
                    tau_ext_sigma_i, ...
                    sys.constants);
                
                % Get next_q_mean, if not yet gotten
                if i == 1
                    next_q_mean = next_q_sigma_i;
                end

                % Construct next_s_dp_sigma_i and aggregate
                next_dp_sigma_i = UKF.q_to_dp(next_q_sigma_i, next_q_mean, a);
                next_s_dp_sigma_i = vertcat(...
                    next_p_sigma_i, ...
                    next_dp_sigma_i, ...
                    next_p_dot_sigma_i, ...
                    next_omega_sigma_i, ...
                    next_F_ext_sigma_i, ...
                    next_tau_ext_sigma_i);
                next_s_dp_sigma_points(:, i) = next_s_dp_sigma_i;
            end

            % Compute next_s, next_P

            % Update s_dp
            next_s_dp = next_s_dp_sigma_points * w_m;

            % s_dp to s
            [~, next_dp, ~, ~, ~, ~] = UKF.unpack_s_dp(next_s_dp);
            next_q = UKF.dp_to_q(next_dp, next_q_mean, a);
            next_s = UKF.s_dp_to_s(next_s_dp, next_q);

            % Update P
            % P_diff = next_s_dp_sigma_points - next_s_dp; % repmat?
            P_diff = next_s_dp_sigma_points - repmat(next_s_dp, 1, 2 * n_dp + 1);
            next_P = P_diff * (P_diff' .* repmat(w_c, 1, 18)) + sys.Q;
        end

        function [next_s, next_P] = update(s, P, z, sys)
            Validate.sys_ukf(sys);
            Validate.z(z);
            
            % Extract constants
            n_dp = size(s, 1) - 1;
            a = sys.constants.mrp_a;

            % Calculate Kalman gain
            H = sys.H;
            R = sys.R;
            K = (P * H') / ( H * P * H' + R );

            % Convert from z to z_dp
            [~, q, ~, ~, ~, ~] = UKF.unpack_s(s);
            q_m = z(4:7, 1);
            dp_m = UKF.q_to_dp(q_m, q, a);
            z_dp = UKF.z_to_z_dp(z, dp_m);

            % Compute next_s, next_P

            % Update s_dp
            s_dp = UKF.s_to_s_dp(s);
            next_s_dp = s_dp + K * (z_dp - H * s_dp);

            % s_dp to s
            [~, next_dp, ~, ~, ~, ~] = UKF.unpack_s_dp(next_s_dp);
            next_q = UKF.dp_to_q(next_dp, q, a);
            next_s = UKF.s_dp_to_s(next_s_dp, next_q);

            % Update P
            I_minus_K_H = eye(n_dp, n_dp) - K * H;
            next_P = I_minus_K_H * P * I_minus_K_H' + K * R * K';
        end
        
        %% Additional helpers (for simulink, numerical stability, etc)
        
        % Translating units (bee to si)
        
        function [s_si] = s_bee_to_s_si(s_bee)
            % Assume s is [p, q, p_dot, omega, f_ext, tau_ext]

            s_si = s_bee;
            s_si(1:3) = s_bee(1:3) / 10; % dm -> m
            % s_si(4:7) stays the same, both in quaternions
            s_si(8:10) = s_bee(8:10) / 10; % dm / s -> m / s
            % s_si(11:13) stays the same, both in rad / s
            s_si(14:16) = s_bee(14:16) / (10^4); % g dm / s^2 -> kg m / s^2
            s_si(17:19) = s_bee(17:19) / (10^5); % g dm^2 / s^2 -> kg m^2 / s^2
        end

        function [var_si] = var_bee_to_var_si(var_bee)
            var_si = var_bee;
            var_si(1:3) = var_bee(1:3) / (10^2); % (dm)^2 -> (m)^2
            % var_si(4:6) stays the same, both in MRP
            var_si(7:9) = var_bee(7:9) / (10^2); % (dm/s)^2 -> (m / s)^2
            % var_si(10:12) stays the same, both in (rad / s)^2
            var_si(13:15) = var_bee(13:15) / (10^8); % (g dm / s^2) ^2 -> (kg m / s^2)^2
            var_si(16:18) = var_bee(16:18) / (10^10); % (g dm^2 / s^2)^2 -> (kg m^2 / s^2)^2
        end
        
        % Translating units (si to bee)

        function [s_bee] = s_si_to_s_bee(s_si)
            % Assume s is [p, q, p_dot, omega, f_ext, tau_ext]

            s_bee = s_si;
            s_bee(1:3) = s_si(1:3) * 10; % m -> dm
            % s_bee(4:7) stays the same, both in quaternions
            s_bee(8:10) = s_si(8:10) * 10; % m / s -> dm / s
            % s_bee(11:13) stays the same, both in rad / s
            s_bee(14:16) = s_si(14:16) * (10^4); % kg m / s^2 -> g dm / s^2
            s_bee(17:19) = s_si(17:19) * (10^5); % kg m^2 / s^2 -> g dm^2 / s^2
        end

        function [z_raw_bee] = z_raw_si_to_z_raw_bee(z_raw_si)
            % Assume z_raw_si is [p, q, p_dot, omega]

            fake_s_raw_si = vertcat(z_raw_si, zeros(6,1));
            fake_s_raw_bee = UKF.s_si_to_s_bee(fake_s_raw_si);
            z_raw_bee = fake_s_raw_bee(1:13);
        end
        
        function [var_bee] = var_si_to_var_bee(var_si)
            var_bee = var_si;
            var_bee(1:3) = var_si(1:3) * (10^2); % (m)^2 -> (dm)^2
            % var_bee(4:6) stays the same, both in MRP
            var_bee(7:9) = var_si(7:9) * (10^2); % (m / s)^2 -> (dm / s)^2
            % var_bee(10:12) stays the same, both in (rad / s)^2
            var_bee(13:15) = var_si(13:15) * (10^8); % (kg m / s^2)^2 -> (g dm / s^2)^2
            var_bee(16:18) = var_si(16:18) * (10^10); % (kg m^2 / s^2)^2 -> (g dm^2 / s^2)^2
        end

        function [R_diag_bee] = R_diag_si_to_R_diag_bee(R_diag_si)
            R_diag_bee = R_diag_si;
            R_diag_bee(1:3) = R_diag_si(1:3) * 10; % m -> dm
        end
        
        % System setup

        function [ukf_sys] = initialize_ukf_sys(rbt, mdl, ukf_params)
            % Assume use_ext is true, assume use_p_dot and use_omega are false.
            % If not, we can change them here, but they are usually false

            % Assume ukf_params is in SI units, and converts them to bee units (m, kg, s) -> (dm, g, s)

            % Initial struct
            ukf_sys = struct;
            % State options and size
            state_size_dp = 18;
            
            % Measurement options and size
            meas_size_dp = 6;

            % s0
            % Since starting at origin, no need to change units
            ukf_sys.s0 = vertcat(zeros(3,1), [1;0;0;0], zeros(12,1));

            % P0
            P0_diag_si = vertcat( ...
                ones(3,1) * ukf_params.P0_p, ...
                ones(3,1) * ukf_params.P0_dp, ...
                ones(3,1) * ukf_params.P0_p_dot, ...
                ones(3,1) * ukf_params.P0_omega, ...
                ones(3,1) * ukf_params.P0_F_ext, ...
                ones(3,1) * ukf_params.P0_tau_ext ...
            );
            P0_diag = UKF.var_si_to_var_bee(P0_diag_si);
            ukf_sys.P0 = diag(P0_diag);

            % Q
            Q_diag_si = vertcat( ...
                ukf_params.Q_p * ones(3,1), ...
                ukf_params.Q_dp * ones(3,1), ...
                ukf_params.Q_p_dot * ones(3,1), ...
                ukf_params.Q_omega * ones(3,1), ...
                ukf_params.Q_F_ext * ones(3,1), ...
                ukf_params.Q_tau_ext * ones(3,1) ...
            );
            % Translate to bee
            Q_diag = UKF.var_si_to_var_bee(Q_diag_si);
            % Translate from time invariant Q to true Q, based on mdl.T
            % Assume nominal mdl.T of 5e-4s (2kHz) and adjust Q for that
            % Actual Q depends on actual value of mdl.T
            Q_diag = Q_diag * (mdl.T / 5e-4) ^ 2;
            ukf_sys.Q = diag(Q_diag);

            % H
            ukf_sys.H = zeros(meas_size_dp, state_size_dp);
            ukf_sys.H(1:6,1:6) = eye(6,6);

            % R
            R_diag_si = vertcat( ...
                ukf_params.R_p * ones(3,1), ...
                ukf_params.R_dp * ones(3,1) ...
            );
            R_diag = UKF.R_diag_si_to_R_diag_bee(R_diag_si);
            ukf_sys.R = diag(R_diag);

            % Initialize constants, convert to bee units
            % Purely rotational units are unaffected (stay in quaternions and rad/s)
            constants = struct;
            constants.m = rbt.m * 1000; % kg -> g
            constants.g = mdl.g * 10; % m/s^2 -> dm/s^2
            constants.J = diag([rbt.ixx,rbt.iyy,rbt.izz]) * 10^5; % N m s / rad -> (g dm / s^2) dm s / rad
            constants.c_dv = ukf_params.c_dv * 10^3;  % kg / s -> g / s
            constants.c_domega = ukf_params.c_domega * 10^5; % kg m^2 / rad -> g dm^2 / rad

            constants.T_s = mdl.T;
            constants.mrp_a = ukf_params.mrp_a;
            constants.lambda = ukf_params.lambda;

            % Safety
            constants.max_P_val = ukf_params.max_P_val * 10^10; % torque covariance SI to torque covariance bee
            
            ukf_sys.constants = constants;
        end
        
        % Utilities

        function [m_flat] = flatten_matrix(m)
            % For flattening, all rows are converted to columns, then vstacked
            % Only works for square matrices
            m_flat = reshape(m', 1, [])';
        end

        function [m] = unflatten_matrix(m_flat)
            % Only works for square matrices
            n = sqrt(size(m_flat, 1));
            m = reshape(m_flat, n, n)';
        end
        
        % Main loop
        function [s_out, P_out_flat, is_init_out, s_out_pre, s_prediction, md] = inner_helper(z_raw, z_raw_prev, f_cmd, tau_cmd_x, tau_cmd_y, s_in, P_in_flat, is_init_in, s_prediction_time, sys)
            % Parameters
            % ----------
            % (Assume all vectors are column vectors)
            %
            % z_raw
            %     Current raw measurement, in SI units. Position (3x1),
            %     Attitude (3x1), XYZ euler angles
            % z_raw_prev
            %     Previous raw measurement, in SI units
            % f_cmd
            %     Commanded thrust, in SI units
            % tau_cmd_x
            %     Commanded torque about x axis in body frame, in SI units
            % tau_cmd_y
            %     Commanded torque about y axis in body frame, in SI units
            % s_in
            %     Estimated state output by filter after previous timestep, in BEE units
            % P_in_flat
            %     Estimated covariance output by filter after previous timestep, in BEE units
            % is_init_in
            %     Boolean value describing whether the filter has been initialized, takes values of 0 (false) or 1 (true)
            % s_prediction_time
            %     Time in the future to predict state, in seconds (functionally, this is rounded to the nearest integer multiple of the sampling time)
            % sys
            %     A UKF system struct
            % 
            % Returns
            % -------
            % s_out
            %     Output state after propogation of s_in through dynamics model and measurement update (if any), in BEE units
            % P_out_flat
            %     Output covariance after dynamics propogation and measurement update (if any), in BEE units
            % is_init_out
            %     Boolean value describing whether the filter has been initialized, takes values of 0 (false) or 1 (true)
            % s_out_pre
            %     Output state after propogation of s_in through dynamics model BUT BEFORE measurement update, in BEE units
            % s_prediction
            %     s_out after being propogated a further s_prediction_time seconds through the dynamics model, in BEE units
            % md
            %     mahalanobis distance of the measurements from the
            %     predicted measurements
            

            % Handle incoming measurement
            
            % Only allow incoming measurements that are nonzero
            is_valid_measurement = not(isequal(z_raw(1:7), [0;0;0;1;0;0;0]));
            % Check if measurement has changed 
            is_new_measurement = not(isequal(z_raw(1:7), z_raw_prev(1:7)));
            % Sanitize quaternion in incoming measurement
            z_raw(4:7) = Quaternion.clean(z_raw(4:7));
            % Convert incoming measurements into bee units
            z_raw_bee = UKF.z_raw_si_to_z_raw_bee(z_raw);
            
            % Handle uninitialized case 
            if is_init_in == 0
                if is_valid_measurement
                    % Initialize system
                    s_in(1:7) = z_raw_bee(1:7);
                    is_init_in = 1;
                else
                    % Don't do anything
                    s_out = s_in;
                    s_out_pre = s_in;
                    P_out_flat = P_in_flat;
                    is_init_out = is_init_in;
                    s_prediction = s_out;
                    md = -1;
                    return;
                end
            end
            
            % Unflatten P
            P_in = UKF.unflatten_matrix(P_in_flat);
            
            % Convert incoming force command into bee units
            f_cmd_bee = f_cmd * 10^4; % (kg m / s^2)^2 -> (g dm / s^2)^2
            tau_cmd_x_bee = tau_cmd_x * 10^5; % (kg m^2 / s^2)^2 -> (g dm^2 / s^2)^2
            tau_cmd_y_bee = tau_cmd_y * 10^5; % (kg m^2 / s^2)^2 -> (g dm^2 / s^2)^2
            
            % Propagate system through dynamics
            [s_out, P_out] = UKF.predict(s_in, P_in, f_cmd_bee, tau_cmd_x_bee, tau_cmd_y_bee, sys);
            s_out_pre = s_out;

            % Debugging raw dynamics
            % Why is the closed loop performance so bad in simulink?
            % [s_out, P_out] = UKF.raw_dynamics_predict(s_in, P_in, f_cmd, tau_cmd_x, tau_cmd_y, sys);
            % P_out_flat = UKF.flatten_matrix(P_out);
            % return;

            %%% --- Outlier rejection ---- %%%
            % Check if measuremnt is outlier:
            % sorry Tong for my hacky code.
            pred_pos_meas = s_out(1:3);
            pred_q_meas = s_out(4:7);

            raw_pos_meas = z_raw(1:3);
            raw_q_meas = z_raw(4:7);

            z_pos_error = pred_pos_meas(:) - raw_pos_meas(:);
            q_pos_error = UKF.q_to_dp(pred_q_meas(:), raw_q_meas(:), sys.constants.mrp_a);
            z_error = [z_pos_error(:); q_pos_error(:)]; 
            P_diag_inv = diag(1./diag(P_out(1:6, 1:6))); % approximately...
            % P_diag_inv = inv(P_out(1:6, 1:6)); % exact
            md = sqrt(z_error'*P_diag_inv*z_error);

            %if md > 100.0 % TODO
            %    is_valid_measurement = false;
            %end
                
            %%% --- Outlier rejection ---- %%%

            % Measurement update, if available
            if is_valid_measurement && is_new_measurement
                % Create measurement
                z = z_raw_bee(1:7);

                % Update
                [s_out, P_out] = UKF.update(s_out, P_out, z, sys);
            end

            % Clip covariance matrix if max entry is too large
            if and(sys.constants.max_P_val > 0, max(P_out, [], 'all') > sys.constants.max_P_val)
                disp("[UKF] WARNING: DETECTED COVARIANCE EXPLOSION. COVARIANCE HAS BEEN RESET");
                P_out = sys.P0;
            end

            % Compute most recent estimate of state, predicted into the future by s_prediction_time
            temp_factor = 1;
            number_of_iterations = floor(s_prediction_time / sys.constants.T_s / temp_factor);
            sys.constants.T_s = sys.constants.T_s * temp_factor;
            s_prediction = s_out;
            for i = 1 : number_of_iterations
                [p, q, p_dot, omega, F_ext, tau_ext] = UKF.unpack_s(s_prediction);
                
                [p, p_dot, q, omega, F_ext, tau_ext] = Dynamics.step( ...
                    p, ...
                    p_dot, ...
                    q, ...
                    omega, ...
                    f_cmd_bee, ...
                    tau_cmd_x_bee, ...
                    tau_cmd_y_bee, ...
                    F_ext, ...
                    tau_ext, ...
                    sys.constants ...
                );
            
                s_prediction = vertcat(p, q, p_dot, omega, F_ext, tau_ext);
            end

            % Return
            P_out_flat = UKF.flatten_matrix(P_out);
            is_init_out = is_init_in;
        end
    end
end

