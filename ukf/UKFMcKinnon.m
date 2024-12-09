% Implementation of McKinnon 2020


% TODO: need to clean this

classdef UKFMcKinnon
    methods(Static)
        
         % TODO: reorder

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
        
        function [s_dp, eta] = unpack_s_dp_ext(s_dp_ext)
            s_dp = s_dp_ext(1:18);
            eta = s_dp_ext(19:end);
        end

        function [s_dp, eta_meas] = unpack_s_dp_meas(s_dp_meas)
            s_dp = s_dp_meas(1:18);
            eta_meas = s_dp_meas(19:end);
        end
        
        function [eta_f_cmd, eta_tau_cmd, eta_F_ext, eta_tau_ext] = unpack_eta(eta)
            eta_f_cmd = eta(1:3);
            eta_tau_cmd = eta(4:6);
            eta_F_ext = eta(7:9);
            eta_tau_ext = eta(10:12);
        end

        function [dp] = mrp_dq_to_dp(dq)
            Validate.q(dq);

            q_scalar = Quaternion.extract_scalar(dq);
            q_vector = Quaternion.extract_vector(dq);
            dp = q_vector / (1 + q_scalar);

            Validate.dp(dp);
        end

        function [dq] = mrp_dp_to_dq(dp)
            Validate.dp(dp);
            
            q_scalar = (1 - dp' * dp) / (1 + dp' * dp);
            q_vector = dp * (1 + q_scalar);
            dq = Quaternion.reconstruct(q_scalar, q_vector);
            dq = Quaternion.clean(dq);
            
            Validate.q(dq);
        end

        function [w] = generate_sigma_point_weights(n, lambda)
            % Notation: kappa from McKinnon paper is the similar to lambda from Andrea paper
            % I will use lambda for consistency
            % McKinnon recommends lambda = 2

            % Note: McKinnon does NOT have all weights add up to 1. I believe this is an error.

            w_0 = lambda / (lambda + n);
            w_rest_value = 1 / (2 * (lambda + n)); % Paper specifies lambda / (2 * (lambda + n)), which makes no sense
            w_rest = ones(2 * n, 1) * w_rest_value;
            w = vertcat(w_0, w_rest);
        end

        function [x_sigma_points] = generate_sigma_points(x, Sigma, n, lambda)
            % Essentially same algorithm as regular UKF, but with different symbols for more generality 

            S = chol(Sigma)';

            residual_0 = zeros(n, 1);
            residuals_i = sqrt(lambda + n) * S;
            residuals_i_plus_n = - sqrt(lambda + n) * S;

            x_sigma_points = x + horzcat(residual_0, residuals_i, residuals_i_plus_n);
        end
        
        function [dp] = q_to_dp(q, q_ref)
            q_ref_inv = Quaternion.inverse(q_ref);
            dq = Quaternion.multiply(q, q_ref_inv);
            dp = UKFMcKinnon.mrp_dq_to_dp(dq);
        end

        function [q] = dp_to_q(dp, q_ref)
            dq = UKFMcKinnon.mrp_dp_to_dq(dp);
            q = Quaternion.multiply(dq, q_ref);
        end

        function [s_dp] = s_to_s_dp(s)
            s_dp = vertcat(s(1:3), zeros(3,1), s(8:end));
        end

        function [s] = s_dp_to_s(s_dp, q)
            Validate.q(q);
            s = vertcat(s_dp(1:3), q, s_dp(7:end));
        end

        function [z_dp] = z_to_z_dp(z, dp, measure_p_dot, measure_omega)
            Validate.z(z, measure_p_dot, measure_omega);
            Validate.dp(dp);

            if measure_p_dot || measure_omega
                z_dp = vertcat(z(1:3,1), dp, z(8:end,1));
            else
                z_dp = vertcat(z(1:3,1), dp);
            end
        end
        
        function [next_sys] = predict(sys, f_cmd, tau_cmd_x, tau_cmd_y)
            Validate.sys_ukf_mckinnon(sys);
            Validate.scalar(f_cmd);
            Validate.scalar(tau_cmd_x);
            Validate.scalar(tau_cmd_y);

            % Extract constants
            n_s_dp = 18;
            n_eta = 12;
            n_s_dp_ext = n_s_dp + n_eta;
            lambda = sys.constants.lambda;

            % Unpack s and P
            s = sys.s;
            P = sys.P;
            
            % Construct s_dp and s_dp_ext
            s_dp = UKFMcKinnon.s_to_s_dp(s);
            s_dp_ext = vertcat(s_dp, zeros(n_eta,1));
            
            % Construct Sigma_zz (z in this case refers to s_dp_ext)
            Sigma_zz = zeros(n_s_dp_ext, n_s_dp_ext);
            Sigma_zz(1:n_s_dp, 1:n_s_dp) = P;
            Sigma_zz(n_s_dp+1:n_s_dp_ext, n_s_dp+1:n_s_dp_ext) = sys.Q;
            
            % Generate sigma point weights
            w = UKFMcKinnon.generate_sigma_point_weights(n_s_dp_ext, lambda);

            % Generate sigma points
            s_dp_ext_sigma_points = UKFMcKinnon.generate_sigma_points(s_dp_ext, Sigma_zz, n_s_dp_ext, lambda);
            
            % Propagate sigma points
            [~, q, ~, ~, ~, ~] = UKFMcKinnon.unpack_s(s);
            next_q_mean = 0;
            next_s_dp_sigma_points = zeros(n_s_dp, 2 * n_s_dp_ext + 1);
            for i = 1 : (2 * n_s_dp_ext + 1)
                s_dp_ext_sigma_i = s_dp_ext_sigma_points(:,i);
                
                % Unpack s_dp_ext
                [s_dp_sigma_i, eta_sigma_i] = UKFMcKinnon.unpack_s_dp_ext(s_dp_ext_sigma_i);
                [p_sigma_i, dp_sigma_i, p_dot_sigma_i, omega_sigma_i, F_ext_sigma_i, tau_ext_sigma_i] = UKFMcKinnon.unpack_s_dp(s_dp_sigma_i);
                q_sigma_i = UKFMcKinnon.dp_to_q(dp_sigma_i, q);
                [eta_f_cmd_sigma_i, eta_tau_cmd_sigma_i, eta_F_ext_sigma_i, eta_tau_ext_sigma_i] = UKFMcKinnon.unpack_eta(eta_sigma_i);
                
                % Propagate dynamics
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
                    eta_f_cmd_sigma_i, ...
                    tau_cmd_x, ...
                    tau_cmd_y, ...
                    eta_tau_cmd_sigma_i, ...
                    F_ext_sigma_i, ...
                    eta_F_ext_sigma_i, ...
                    tau_ext_sigma_i, ...
                    eta_tau_ext_sigma_i, ...
                    sys.constants);
                
                % Get next_q_mean, if not yet gotten
                if i == 1
                    next_q_mean = next_q_sigma_i;
                end
                
                % Generate next_s_dp_sigma_i and populate next_s_dp_sigma_points
                next_dp_sigma_i = UKFMcKinnon.q_to_dp(next_q_sigma_i, next_q_mean);
                next_s_dp_sigma_i = vertcat(next_p_sigma_i, next_dp_sigma_i, next_p_dot_sigma_i, next_omega_sigma_i, ...
                                            next_F_ext_sigma_i, next_tau_ext_sigma_i);
                next_s_dp_sigma_points(:,i) = next_s_dp_sigma_i;
            end
            
            % Compute next_s, next_P

            % Update s_dp
            next_s_dp = next_s_dp_sigma_points * w;

            % s_dp to s
            [~, next_dp, ~, ~, ~, ~] = UKFMcKinnon.unpack_s_dp(next_s_dp);
            next_q = UKFMcKinnon.dp_to_q(next_dp, next_q_mean);
            next_s = UKFMcKinnon.s_dp_to_s(next_s_dp, next_q);

            % Update P
            P_diff = next_s_dp_sigma_points - next_s_dp;
            next_P = P_diff * (P_diff' .* w);

            % Return
            next_sys = sys;
            next_sys.s = next_s;
            next_sys.P = next_P;

        end

        function [next_sys] = raw_dynamics_predict(sys, f_cmd, tau_cmd_x, tau_cmd_y)
            Validate.sys_ukf_mckinnon(sys);
            Validate.scalar(f_cmd);
            Validate.scalar(tau_cmd_x);
            Validate.scalar(tau_cmd_y);

            % Unpack s
            [p, q, p_dot, omega, F_ext, tau_ext] = UKFMcKinnon.unpack_s(sys.s);

            % Step dynamics
            [
                next_p, ...
                next_p_dot, ...
                next_q, ...
                next_omega, ...
                next_F_ext, ...
                next_tau_ext ...
            ] = Dynamics.step( ...
                p, ...
                p_dot, ...
                q, ...
                omega, ...
                f_cmd, ...
                zeros(3,1), ... % eta_f_cmd
                tau_cmd_x, ...
                tau_cmd_y, ...
                zeros(3,1), ... % eta_tau_cmd
                F_ext, ...
                zeros(3,1), ... % eta_F_ext
                tau_ext, ...
                zeros(3,1), ... % eta_tau_ext
                sys.constants);

            % Create next xi
            next_s = vertcat(next_p, next_q, next_p_dot, next_omega, next_F_ext, next_tau_ext);

            % Return
            next_sys = sys;
            next_sys.s = next_s;
        end

        function [next_sys] = update(sys, z)
            Validate.sys_ukf_mckinnon(sys);
            Validate.z(z, sys.measure_p_dot, sys.measure_omega);

            % Extract constants
            n_s_dp = 18;
            n_z_dp = size(sys.H, 1);
            n_eta_meas = size(sys.H, 1);
            n_s_dp_meas = n_s_dp + n_eta_meas;
            lambda = sys.constants.lambda;

            % Unpack s and P
            s = sys.s;
            P = sys.P;
            
            % Construct s_dp and s_dp_ext
            s_dp = UKFMcKinnon.s_to_s_dp(s);
            s_dp_meas = vertcat(s_dp, zeros(n_eta_meas,1));

            % Construct Sigma_zz (z in this case refers to s_dp_meas)
            Sigma_zz = zeros(n_s_dp_meas, n_s_dp_meas);
            Sigma_zz(1:n_s_dp, 1:n_s_dp) = P;
            Sigma_zz(n_s_dp+1:n_s_dp_meas, n_s_dp+1:n_s_dp_meas) = sys.G;

            % Generate sigma point weights
            % TODO: check that these weights are correct
            w = UKFMcKinnon.generate_sigma_point_weights(n_s_dp_meas, lambda);

            % Generate sigma points
            s_dp_meas_sigma_points = UKFMcKinnon.generate_sigma_points(s_dp_meas, Sigma_zz, n_s_dp_meas, lambda);
            
            % Generate measured sigma points            
            s_dp_sigma_points = zeros(n_s_dp, 2 * n_s_dp_meas + 1);
            expected_z_dp_sigma_points = zeros(n_z_dp, 2 * n_s_dp_meas + 1);
            for i = 1 : (2 * n_s_dp_meas + 1)
                s_dp_meas_sigma_i = s_dp_meas_sigma_points(:,i);
                [s_dp_sigma_i, eta_meas_sigma_i] = UKFMcKinnon.unpack_s_dp_meas(s_dp_meas_sigma_i);
                
                % Aggregate
                s_dp_sigma_points(:, i) = s_dp_sigma_i;
                
                expected_z_dp_sigma_i = sys.H * s_dp_sigma_i + eta_meas_sigma_i;
                expected_z_dp_sigma_points(:, i) = expected_z_dp_sigma_i;
            end
            
            % Recombine measured sigma points
            
            % expected_z_dp
            expected_z_dp = expected_z_dp_sigma_points * w;
            
            % Sigma_yy (y in this case refers to expected_z_dp)
            Sigma_y_diff = expected_z_dp_sigma_points - expected_z_dp;
            Sigma_yy = Sigma_y_diff * (Sigma_y_diff' .* w);
            
            % Sigma_xy (x in this case refers to s_dp)
            Sigma_x_diff = s_dp_sigma_points - s_dp;
            Sigma_xy = Sigma_x_diff * (Sigma_y_diff' .* w);
            
            % Correction % TODO: lay this out and comment it out more nicely
            q_m = z(4:7, 1);
            [~, q, ~, ~, ~, ~] = UKFMcKinnon.unpack_s(s);
            dp_m = UKFMcKinnon.q_to_dp(q_m, q);
            z_dp = UKFMcKinnon.z_to_z_dp(z, dp_m, sys.measure_p_dot, sys.measure_omega);

            K = Sigma_xy / Sigma_yy;
            next_P = P - K * Sigma_xy';
            next_s_dp = s_dp + K * (z_dp - expected_z_dp);

            [~, next_dp, ~, ~, ~, ~] = UKFMcKinnon.unpack_s_dp(next_s_dp);
            next_q = UKFMcKinnon.dp_to_q(next_dp, q);
            next_s = UKFMcKinnon.s_dp_to_s(next_s_dp, next_q);
            
            % Return
            next_sys = sys;
            next_sys.s = next_s;
            next_sys.P = next_P;
        end
    end
end

