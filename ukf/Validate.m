% Validation of various quantities

classdef Validate
    methods(Static)

        % Misc
        function matrix(input, dims)
            % ASSERTS TURNED OFF FOR DEPLOYMENT
            % assert(isa(input, "numeric"));
            % assert(all(size(input) == dims));
            % mustBeFinite(input);
            
            if not(isa(input, "numeric"))
                disp("[UKF]: WARNING: EXPECTED NUMERIC INPUT BUT RECEIVED OTHER");
            end
            if not(all(size(input) == dims))
                disp("[UKF]: WARNING: DIMENSION MISMATCH. EXPECTED SIZE OF:");
                % disp("[UKF]: " + mat2str(dims));
                % disp("[UKF]: " + dims);
                % disp("[UKF]: BUT GOT:");
                % disp("[UKF]: " + mat2str(size(input)));
                % disp("[UKF]: " + size(input));
            end
        end

        function scalar(input)
            % ASSERTS TURNED OFF FOR DEPLOYMENT
            % assert(isscalar(input));
            % mustBeFinite(input);

            if not(isscalar(input))
                disp("[UKF]: WARNING: EXPECTED SCALAR INPUT BUT RECEIVED OTHER");
            end
        end

        % Translation
        function p(input)
            Validate.matrix(input, [3,1]);
        end

        function p_dot(input)
            Validate.matrix(input, [3,1]);
        end

        function F_ext(input)
            Validate.matrix(input, [3,1]);
        end

        % Rotation
        function dp(input)
            % TODO: check to see that this is normalized properly
            Validate.matrix(input, [3,1]);
        end

        function q(q_in)
            Validate.matrix(q_in, [4,1]);

            % Check that it is unit quaternion
            tol = 10^(-9);
            
            % Check that q_in is a unit quaternion
            if abs(norm(q_in) - 1) >= tol
                disp("[UKF] WARNING: QUATERNION NOT NORMALIZED");
                % disp("[UKF]" + mat2str(q_in));
                % disp("[UKF]" + q_in);
            end

            % Check that scalar term is nonnegative
            if q_in(1,1) < 0
                disp("[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
                % disp("[UKF]" + mat2str(q_in));
                % disp("[UKF]" + q_in);
            end
        end

        function omega(input)
            Validate.matrix(input, [3,1]);
        end

        function tau_ext(input)
            Validate.matrix(input, [3,1]);
        end

        function J(input)
            Validate.matrix(input, [3,3]);
        end
        
        % Noise
        function eta(input)
            Validate.matrix(input, [3,1]);
        end

        % UKF
        function z(z)
            % Expect at least [p; q], where q has scalar on top
            %Validate.matrix(z, [7, 1]);
            Validate.matrix(z, [10, 1]); % virtual omega
            Validate.q(z(4:7));
        end

        function constants(input)
            if not(isstruct(input))
                disp("[UKF] WARNING: DETECTED NON-STRUCT WHERE STRUCT WAS EXPECTED, CRASH LIKELY");
            end

            Validate.scalar(input.m);
            Validate.scalar(input.g);
            Validate.matrix(input.J, [3,3]);
            Validate.scalar(input.c_dv);
            Validate.scalar(input.c_domega);
            Validate.scalar(input.T_s);
            Validate.scalar(input.mrp_a); % Note: Not used for McKinnon
            Validate.scalar(input.lambda);
            Validate.scalar(input.max_P_val);
        end

        function sys_ukf(sys)
            % ASSERTS TURNED OFF FOR DEPLOYMENT
            if not(isstruct(sys))
                disp("[UKF] WARNING: DETECTED NON-STRUCT WHERE STRUCT WAS EXPECTED, CRASH LIKELY");
            end

            % State (passed around with the struct)
            % s, represented as [p; q; p_dot; omega; F_ext; tau_ext], where q is scalar first
            % P

            % Constants
            % s0, P0 (default values for s0 and P0)
            % Q = diag(Q_p, Q_dp, Q_p_dot, Q_omega, Q_F_ext, Q_tau_ext)
            % H
            % R = diag(R_p, R_dp, R_p_dot, R_omega)
            % constants

            % Setting correct sizes
            state_size = 19;
            state_size_dp = state_size - 1; % (size of s_dp; i.e., s but with MRP of local error quaternions instead of absolute quaternions)
            %meas_size_dp = 6; % (use on s_dp, not s)
            meas_size_dp = 9; % with angular velocity

            % Validate s0
            Validate.matrix(sys.s0, [state_size, 1]);

            % Validate P0
            Validate.matrix(sys.P0, [state_size_dp, state_size_dp]);

            % Validate Q
            Validate.matrix(sys.Q, [state_size_dp, state_size_dp]);

            % Validate H
            Validate.matrix(sys.H, [meas_size_dp, state_size_dp]);

            % Validate R
            Validate.matrix(sys.R, [meas_size_dp, meas_size_dp]);
            
            % Validate constants
            Validate.constants(sys.constants);
        end

    end
end

