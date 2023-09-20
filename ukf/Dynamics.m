
classdef Dynamics
    methods(Static)
        function [R] = compute_R(q)
            Validate.q(q);

            q_matlab = Quaternion.to_matlab(q);
            R = quat2rotm(q_matlab);
            
            % From McKinnon 2020 (https://www.dynsyslab.org/wp-content/papercite-data/pdf/mckinnon-robot20.pdf)
            % q0 = q(1);
            % qv = q(2:4);
            
            % qx = [...
            %     0, -qv(3), qv(2);...
            %     qv(3), 0, -qv(1);...
            %     -qv(2), qv(1), 0 ...
            % ];
            
            % R = (2 * q0 ^ 2 - 1) * ones(3,3) + 2 * (qv * qv') - 2 * (q0 * qx);
        end


        function [Omega] = Omega_operator(omega)
            % See https://ahrs.readthedocs.io/en/latest/filters/angular.html
            Validate.omega(omega);

            wx = omega(1);
            wy = omega(2);
            wz = omega(3);

            Omega = [
                0, -wx, -wy, -wz;
                wx, 0, wz, -wy;
                wy, -wz, 0, wx;
                wz, wy, -wx, 0;
            ];
        end

        function [next_q] = integrate_quaternion(q, omega, T_s)
            % See https://ahrs.readthedocs.io/en/latest/filters/angular.html
            Validate.q(q);
            Validate.omega(omega);
            Validate.scalar(T_s);

            Omega = Dynamics.Omega_operator(omega);
            integration_matrix = eye(4) + 1/2 * Omega * T_s;
            next_q = Quaternion.clean(integration_matrix * q);
        end


        function [Omega_omega] = compute_Omega(omega, T_s)
            % See McKinnon 2020. Omega matrix assumes scalar-first convention, unlike in Crassidis 2003.
            Validate.omega(omega);
            Validate.scalar(T_s);

            theta = 1 / 2 * norm(omega) * T_s;
            c = cos(theta);
            s = sin(theta);
            
            if norm(omega) > 0
                omega_normalized = omega / norm(omega);
            else
                omega_normalized = omega; % omega is zero
            end

            Psi = s * omega_normalized;
            
            Psi_x = [ ...
                0, -Psi(3), Psi(2); ...
                Psi(3), 0, -Psi(1); ...
                -Psi(2), Psi(1), 0; ...
            ];

            Omega_omega = zeros(4, 4);
            Omega_omega(1, 1) = c;
            Omega_omega(2:4, 1) = Psi;
            Omega_omega(1, 2:4) = - Psi'; 
            Omega_omega(2:4, 2:4) = c * eye(3,3) + Psi_x;
        end

        function [p_dot_dot] = f_transl(q, f_cmd, p_dot, F_ext, m, g, c_dv)
            Validate.q(q);
            Validate.scalar(f_cmd);
            Validate.p_dot(p_dot);
            Validate.F_ext(F_ext);
            Validate.scalar(m);
            Validate.scalar(g);
            Validate.scalar(c_dv);

            % Getting proper values in place
            R_IB = Dynamics.compute_R(q);
            F_cmd_body_frame = [0; 0; f_cmd];
            F_grav = [0; 0; - m * g];
            F_drag = (-c_dv) * p_dot;

            % Doing the calculation
            p_dot_dot = 1 / m * (R_IB * F_cmd_body_frame + F_grav + F_drag + F_ext);
        end

        function [omega_dot] = f_rot(q, omega, tau_cmd_x, tau_cmd_y, tau_ext, J, c_domega)
            % External torque expressed in body frame
            Validate.q(q);
            Validate.omega(omega);
            Validate.scalar(tau_cmd_x);
            Validate.scalar(tau_cmd_y);
            Validate.tau_ext(tau_ext);
            Validate.J(J);
            Validate.scalar(c_domega);

            % Getting proper values in place
            tau_cmd = [tau_cmd_x; tau_cmd_y; 0];
            tau_drag = (-c_domega) * omega;

            % Doing the calculation
            % body frame external torque (this is the case in simulink)
            omega_dot = J \ ( - cross(omega, J * omega) + tau_cmd + tau_drag + tau_ext );
        end

        function [p_k_plus_1, p_dot_k_plus_1, q_k_plus_1, omega_k_plus_1, F_ext_k_plus_1, tau_ext_k_plus_1] = step( ...
            p_k, ...
            p_dot_k, ...
            q_k, ...
            omega_k, ...
            f_cmd_k, ...
            tau_cmd_x_k, ...
            tau_cmd_y_k, ...
            F_ext_k, ...
            tau_ext_k, ...
            constants ...
        )
            Validate.p(p_k);
            Validate.p_dot(p_dot_k);
            Validate.q(q_k);
            Validate.omega(omega_k);
            Validate.scalar(f_cmd_k);
            Validate.scalar(tau_cmd_x_k);
            Validate.scalar(tau_cmd_y_k);
            Validate.F_ext(F_ext_k);
            Validate.tau_ext(tau_ext_k);
            Validate.constants(constants);
            
            % Propagate p
            p_dot_dot_k = Dynamics.f_transl(q_k, f_cmd_k, p_dot_k, F_ext_k, constants.m, constants.g, constants.c_dv);

            p_k_plus_1 = p_k + constants.T_s * p_dot_k + 0.5 * (constants.T_s ^ 2) * p_dot_dot_k;
            
            % Propagate p_dot
            p_dot_k_plus_1 = p_dot_k + constants.T_s * p_dot_dot_k;

            % Propagate q
            % Omega_omega_k = Dynamics.compute_Omega(omega_k, constants.T_s);
            % q_k_plus_1 = Quaternion.clean(Omega_omega_k * q_k);
            q_k_plus_1 = Dynamics.integrate_quaternion(q_k, omega_k, constants.T_s);

            % Propagate omega
            omega_dot_k = Dynamics.f_rot(q_k, omega_k, tau_cmd_x_k, tau_cmd_y_k, tau_ext_k, constants.J, constants.c_domega);
            omega_k_plus_1 = omega_k + constants.T_s * omega_dot_k;
            
            % Propagate F_ext and tau_ext
            F_ext_k_plus_1 = F_ext_k;
            tau_ext_k_plus_1 = tau_ext_k;
        end
    end
end

