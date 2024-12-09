classdef Quaternion
    methods(Static)
        function [q_scalar] = extract_scalar(q)
            Validate.q(q);
            q_scalar = q(1,1);
        end

        function [q_vector] = extract_vector(q)
            Validate.q(q);
            q_vector = q(2:4,1);
        end

        function [q] = reconstruct(q_scalar, q_vector)
            Validate.scalar(q_scalar);
            q = Quaternion.clean(vertcat(q_scalar, q_vector));
            Validate.q(q);
        end

        function [q_matlab] = to_matlab(q)
            Validate.q(q);
            q_matlab = quaternion(transpose(q));
        end

        function [q] = from_matlab(q_matlab)
            q = Quaternion.clean(transpose(compact(q_matlab)));
            Validate.q(q);
        end

        function [q] = multiply(q_left, q_right)
            Validate.q(q_left);
            Validate.q(q_right);

            q_left_matlab = Quaternion.to_matlab(q_left);
            q_right_matlab = Quaternion.to_matlab(q_right);
            q_matlab = q_left_matlab * q_right_matlab; % Matlab's * operator multiplies quaternions correctly
            q = Quaternion.clean(Quaternion.from_matlab(q_matlab));

            Validate.q(q);
        end

        function [q_inv] = inverse(q)
            Validate.q(q);

            conj = [1;-1;-1;-1];
            q_inv = conj .* q / (norm(q) ^ 2);

            Validate.q(q_inv);
        end

        function [q_scalar_last] = to_scalar_last(q_scalar_first)
            Validate.q(q_scalar_first);

            q_scalar = q_scalar_first(1);
            q_vector = q_scalar_first(2:4);

            q_scalar_last = vertcat(q_vector, q_scalar);
        end

        function [q_scalar_first] = from_scalar_last(q_scalar_last)
            q_vector = q_scalar_last(1:3);
            q_scalar = q_scalar_last(4);

            q_scalar_first = Quaternion.clean(vertcat(q_scalar, q_vector));
            Validate.q(q_scalar_first);
        end

        function [q_avg] = average(qs, ws)
            % Source: Markley, Chen, Crassidis, and Oshman, 2007
            % Their methodology is in scalar-last convention.
            % Assume that input qs is in scalar-first.
            % Must convert to scalar-last while iterating, and keep in scalar-last until end.

            assert(size(qs,1) == 4);

            M = zeros(4,4);
            for i = 1 : size(qs, 2)
                my_q = qs(:, i);
                
                Validate.q(my_q);

                my_q_scalar_last = ws(i) * Quaternion.to_scalar_last(my_q);
                M = M + my_q_scalar_last * transpose(my_q_scalar_last);
            end

            % eigs does not support codegen
            % [q_avg_scalar_last, ~] = eigs(M, 1);
            
            % Hack using eig
            [V, D] = eig(M);
            [~,ind] = sort(diag(D));
            Vs = V(:,ind);
            q_avg_scalar_last = real(Vs(:, end));
            
            q_avg = Quaternion.from_scalar_last(q_avg_scalar_last);
            q_avg = Quaternion.clean(q_avg);
            Validate.q(q_avg);
        end
        
        function [q_clean] = clean(q)
            % Renormalize
            q_clean = q / norm(q);

            % Flip if necessary
            if q(1) < 0
                q_clean = - q_clean;
            end
        end
        
        function [qs] = eul_xyzs_to_qs(xyzs)
            qs = eul2quat(xyzs', "XYZ")';
            for k = 1 : size(qs, 2)
                qs(:, k) = Quaternion.clean(qs(:, k));
            end
        end
    end
end

