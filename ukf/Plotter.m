% TODO :REfactor

classdef Plotter
    methods(Static)

        % Design:
        % Need a plot options object/struct
        % Need a method that plots up to 3 lines on the same graph, with options specifying which, and proper axis names / titles
        % Need a method that plots 3 components (calls ^ three times)

        function plot_triple_and_error(xs, estimated_ys, measured_ys, actual_ys, a_title, a_ylabel, options)
            ax = nexttile;
            
            if options.plot_estimated
                plot(ax, xs, estimated_ys);
                hold on
            end
            
            if options.plot_measured
                plot(ax, xs, measured_ys);
                hold on
            end
            
            if options.plot_actual
                plot(ax, xs, actual_ys);
                hold on
            end

            hold off
            if and(and(options.plot_estimated, options.plot_measured), not(options.plot_actual))
                legend("ukf", "diff", 'Location', 'Best');
            elseif and(and(options.plot_estimated, options.plot_measured), options.plot_actual)
                legend("ukf", "diff", "act", 'Location', 'Best');
            end
            title(ax, a_title);
            ylabel(ax, a_ylabel);

            if options.plot_error && options.plot_actual
                ax1 = nexttile;
                error_ys = estimated_ys - actual_ys;
                plot(ax1, xs, error_ys);
                title(ax1, a_title + ", error");
                ylabel(ax1, a_ylabel + ", error");
            end
        end

        function [y_xs, y_ys, y_zs] = split_componentwise(xs, ys, valid)
            if valid
                y_xs = ys(1, xs);
                y_ys = ys(2, xs);
                y_zs = ys(3, xs);
            else
                y_xs = zeros(size(xs));
                y_ys = zeros(size(xs));
                y_zs = zeros(size(xs));
            end
        end
        
        function plot_componentwise(xs, estimated_ys, measured_ys, actual_ys, a_title, a_ylabel, options)
            assert(size(xs, 2) == size(estimated_ys, 2));
            assert(size(xs, 2) == size(measured_ys, 2));
            assert(size(xs, 2) == size(actual_ys, 2));

            [estimated_y_xs, estimated_y_ys, estimated_y_zs] = Plotter.split_componentwise(xs, estimated_ys, options.plot_estimated);
            [measured_y_xs, measured_y_ys, measured_y_zs] = Plotter.split_componentwise(xs, measured_ys, options.plot_measured);
            [actual_y_xs, actual_y_ys, actual_y_zs] = Plotter.split_componentwise(xs, actual_ys, options.plot_actual);
            
            Plotter.plot_triple_and_error(xs, estimated_y_xs, measured_y_xs, actual_y_xs, a_title + ", x", a_ylabel + ", x", options);
            Plotter.plot_triple_and_error(xs, estimated_y_ys, measured_y_ys, actual_y_ys, a_title + ", y", a_ylabel + ", y", options);
            Plotter.plot_triple_and_error(xs, estimated_y_zs, measured_y_zs, actual_y_zs, a_title + ", z", a_ylabel + ", z", options);
            
            % Also plot FFT of signal
            % Plotter.plot_fft(estimated_y_xs, T_s, "x");
            % Plotter.plot_fft(estimated_y_ys, T_s, "y");
            % Plotter.plot_fft(estimated_y_zs, T_s, "z");
        end
        
        function plot_fft(X, Fs, s)
            L = size(X, 2);
            Y = fft(X);
            P2 = abs(Y/L);
            P1 = P2(1:floor(L/2)+1);
            P1(2:end-1) = 2*P1(2:end-1);
            
            f = Fs*( 0:floor((L/2)) )/L;
            ax = nexttile;
            plot(ax, f, P1);
            title("Single-Sided Amplitude Spectrum, " + s);
            xlabel("f (Hz)");
            ylabel("|P1(f)|");
        end


        function plot_q_euler(qs, qs_measured, qs_actual, options)
            % Plot q = [q_w; q_x; q_y; q_z] in terms of euler angles, in order [rot_z; rot_y; rot_x]
            
            ts = 1 : size(qs, 2);
            
            if options.plot_estimated
                zyxs = transpose(quat2eul(transpose(qs)));
                estimated_rot_xs = zyxs(3, ts);
                estimated_rot_ys = zyxs(2, ts);
                estimated_rot_zs = zyxs(1, ts);
            else
                estimated_rot_xs = zeros(size(ts));
                estimated_rot_ys = zeros(size(ts));
                estimated_rot_zs = zeros(size(ts));
            end

            if options.plot_measured
                measured_zyxs = transpose(quat2eul(transpose(qs_measured)));
                measured_rot_xs = measured_zyxs(3, ts);
                measured_rot_ys = measured_zyxs(2, ts);
                measured_rot_zs = measured_zyxs(1, ts);
            else
                measured_rot_xs = zeros(size(ts));
                measured_rot_ys = zeros(size(ts));
                measured_rot_zs = zeros(size(ts));
            end

            if options.plot_actual
                actual_zyxs = transpose(quat2eul(transpose(qs_actual)));
                actual_rot_xs = actual_zyxs(3, ts);
                actual_rot_ys = actual_zyxs(2, ts);
                actual_rot_zs = actual_zyxs(1, ts);
            else
                actual_rot_xs = zeros(size(ts));
                actual_rot_ys = zeros(size(ts));
                actual_rot_zs = zeros(size(ts));
            end
            
            estimated_rots = vertcat(estimated_rot_xs, estimated_rot_ys, estimated_rot_zs);
            measured_rots = vertcat(measured_rot_xs, measured_rot_ys, measured_rot_zs);
            actual_rots = vertcat(actual_rot_xs, actual_rot_ys, actual_rot_zs);

            Plotter.plot_componentwise(ts, estimated_rots, measured_rots, actual_rots, "rot vs timestep", "rot (rad)", options)
        end

        % Old plotting code for q diff
        
        function [diff] = quaternion_diff(expected, observed)
            diff = Quaternion.multiply(observed, Quaternion.inverse(expected));
        end

        function plot_q_diff(predicted_qs, actual_qs)
            % Plot q = [q_w; q_x; q_y; q_z] as a difference in quaternions, between observed and actual
            
            ts = 1 : size(predicted_qs, 2);

            diff_from_actuals = zeros(4,size(predicted_qs, 2));
            for i = ts
                q = predicted_qs(:, i);

                actual_q = actual_qs(:, i);
                diff_from_actual = Plotter.quaternion_diff(actual_q, q);
                diff_from_actuals(:, i) = diff_from_actual;
            end
            

            diff_from_actual_zyxs = transpose(quat2eul(transpose(diff_from_actuals)));
            accumulated_diff_from_actual_zyxs = sum(abs(diff_from_actual_zyxs));
            
            % Evaluation: print max attitude error
            disp("Max total attitude error, starting after first 1000 timesteps (deg):");
            disp(rad2deg(max(accumulated_diff_from_actual_zyxs(1000:end))));
            disp("Avg total attitude error, starting after first 1000 timesteps (deg):");
            disp(rad2deg(mean(accumulated_diff_from_actual_zyxs(1000:end))));
            
            ax_act = nexttile;
            plot(ax_act, ts, accumulated_diff_from_actual_zyxs);
            title(ax_act, "angle error vs timestep");
            ylabel(ax_act, "angle error (rad)");
        end
        

        
        % Stuff to easily plot timeseries
        function plot_xyz_timeseries_comparison(t_a, t_b, legend_a, legend_b, title_, xlabel_, ylabel_, fignum)
            figure(fignum);
            axs_name = {'x', 'y', 'z'};
            for i = 1:3
                subplot(3,1,i)

                plot(t_a.Time, t_a.Data(:, i), "b");
                hold on;
                plot(t_b.Time, t_b.Data(:, i), "r");
                hold off;

                legend(axs_name{i} + " " + legend_a, axs_name{i} + " " + legend_b);
                title(title_)
                xlabel(xlabel_);
                ylabel(ylabel_);
            end
        end

        function plot_single_timeseries_comparison(t_a, t_b, legend_a, legend_b, title_, xlabel_, ylabel_, fignum)
            figure(fignum);
            plot(t_a.Time, t_a.Data, "b");
            hold on;
            plot(t_b.Time, t_b.Data, "r");
            hold off;
            legend(legend_a, legend_b);
            title(title_)
            xlabel(xlabel_);
            ylabel(ylabel_);
        end
        
        

        
    end
end

