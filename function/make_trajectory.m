function traj = make_trajectory(ctr, mdl, rsim)


% decide to use predefined trajectory
if ctr.traj.en
    traj.en = 1;
else 
    traj.en = 0;
end

% initialize the variables
traj.rd       = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_d     = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_dd    = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_ddd   = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_dddd  = zeros(3,(mdl.rt+1)*mdl.f);
traj.thrust_b = zeros(1,(mdl.rt+1)*mdl.f);

% define trajectory
if traj.en

    % type of trajectory
    traj.mode = 6;

    % time variables
    t      = mdl.T; % evolving variable for each time step
    t_plot = mdl.T:mdl.T:mdl.rt+1; % time vector for plot
    traj.t = t_plot;
    
    % generate trajectory
    if traj.mode == 1

        % horizontal circle
        radius       = 0.06*1/0.82; % (m)
        angular_rate = 360; % (deg/s)
        center       = [0; 0; 0.09];
        center_r     = center + [radius*0.5; 0; 0];
        center_l     = center - [radius*0.5; 0; 0];
        t_vec        = [2.1, 3, 4, 4.5, 5.5, 6, 7, 8] - 1.7*rsim.en; % (s)
    
        while t <= mdl.rt
            if t <= t_vec(1)      
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                traj.rd(:,round(t*mdl.f)) = center ./(t_vec(2)-t_vec(1)).*(t-t_vec(1));   
            elseif t <= t_vec(3)        
                traj.rd(:,round(t*mdl.f)) = center; 
            elseif t <= t_vec(4)               
                traj.rd(:,round(t*mdl.f)) = center_r + [0.5*radius*cosd(-angular_rate*(t-t_vec(3))+180); 0.5*radius*sind(-angular_rate*(t-t_vec(3))+180); 0;];    
            elseif t <= t_vec(5)               
                traj.rd(:,round(t*mdl.f)) = center + [radius*cosd(angular_rate*(t-t_vec(4))); radius*sind(-angular_rate*(t-t_vec(4))); 0;]; 
            elseif t <= t_vec(6)               
                traj.rd(:,round(t*mdl.f)) = center_r + [0.5*radius*cosd(-angular_rate*(t-t_vec(5))); 0.5*radius*sind(-angular_rate*(t-t_vec(5))); 0;];  
            elseif t <= t_vec(7)               
                traj.rd(:,round(t*mdl.f)) = center;
            elseif t <= t_vec(8)
                traj.rd(:,round(t*mdl.f)) = center - center./(t_vec(8)-t_vec(7)).*(t-t_vec(7));
            end      
            t = t + mdl.T;
        end
    
    
    elseif traj.mode == 2

        % vertical two circles
        radius       = 0.05*1/0.865; % (m)
        angular_rate = 360; % (deg/s)
        center       = [0; 0; 0.105];
        center_r     = center + [radius; 0; 0];
        center_l     = center - [radius; 0; 0];
        t_vec        = [2.1, 3, 4, 5, 6, 7, 7.9] - 1.7*rsim.en; % (s)
    
        while t <= mdl.rt
            if t <= t_vec(1)      
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                traj.rd(:,round(t*mdl.f)) = center ./(t_vec(2)-t_vec(1)).*(t-t_vec(1));   
            elseif t <= t_vec(3)        
                traj.rd(:,round(t*mdl.f)) = center; 
            elseif t <= t_vec(4)               
                traj.rd(:,round(t*mdl.f)) = center_r + [radius*cosd(-angular_rate*(t-t_vec(3))+180); 0; radius*sind(-angular_rate*(t-t_vec(3))+180);];    
            elseif t <= t_vec(5)               
                traj.rd(:,round(t*mdl.f)) = center_l + [radius*cosd(angular_rate*(t-t_vec(4))); 0; radius*sind(angular_rate*(t-t_vec(4)));]; 
            elseif t <= t_vec(6)               
                traj.rd(:,round(t*mdl.f)) = center;
            elseif t <= t_vec(7)
                traj.rd(:,round(t*mdl.f)) = center - center./(t_vec(7)-t_vec(6)).*(t-t_vec(6));
            end      
            t = t + mdl.T;
        end

    elseif traj.mode == 3

        % infinity
        radius       = 0.05; % (m)
        angular_rate = 360; % (deg/s)
        center       = [0; 0; 0.08];
        t_vec        = [2.2, 3, 4, 6, 7, 7.8]; % (s)
    
        while t <= mdl.rt
            if t <= t_vec(1)      
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                traj.rd(:,round(t*mdl.f)) = center ./(t_vec(2)-t_vec(1)).*(t-t_vec(1));   
            elseif t <= t_vec(3)        
                traj.rd(:,round(t*mdl.f)) = center; 
            elseif t <= t_vec(4)               
                traj.rd(:,round(t*mdl.f)) = center + [2*radius*sind(angular_rate/2*(t-t_vec(3))); 0; radius*sind(angular_rate*(t-t_vec(3)));];    
            elseif t <= t_vec(5)               
                traj.rd(:,round(t*mdl.f)) = center;
            elseif t <= t_vec(6)               
                traj.rd(:,round(t*mdl.f)) = center - center./(t_vec(6)-t_vec(5)).*(t-t_vec(5));
                
            end      
            t = t + mdl.T;
        end

    elseif traj.mode == 4

        % vertical two circles
        radius       = 0.05; % (m)
        angular_rate = 360; % (deg/s)
        center       = [0; 0; 0.09];
        center_r     = center + [radius; 0; 0];
        center_l     = center - [radius; 0; 0];
        t_vec        = [2.2, 3, 4, 6, 7, 7.8]; % (s)
    
        while t <= mdl.rt
            if t <= t_vec(1)      
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                traj.rd(:,round(t*mdl.f)) = center ./(t_vec(2)-t_vec(1)).*(t-t_vec(1));   
            elseif t <= t_vec(3)        
                traj.rd(:,round(t*mdl.f)) = center; 
            elseif t <= t_vec(4)               
                traj.rd(:,round(t*mdl.f)) = center + [radius*sind(angular_rate/2*(t-t_vec(3))); 0; 1/0.865*radius*sind(-angular_rate*(t-t_vec(3))+180);];    
            elseif t <= t_vec(5)               
                % traj.rd(:,round(t*mdl.f)) = center + [radius*cosd(angular_rate*(t-t_vec(4))); 0; 1/0.865*radius*sind(angular_rate*(t-t_vec(4)));]; 
                traj.rd(:,round(t*mdl.f)) = center;
            elseif t <= t_vec(6)               
                traj.rd(:,round(t*mdl.f)) = center;
            % elseif t <= t_vec(7)
            %     traj.rd(:,round(t*mdl.f)) = center - center./(t_vec(7)-t_vec(6)).*(t-t_vec(6));
            end      
            t = t + mdl.T;
        end

    elseif traj.mode == 5

        % vertical many circles
        radius       = 0.05*1/0.865; % (m)
        angular_rate = 360; % (deg/s)
        center       = [0; 0; 0.1];
        center_r     = center + [radius; 0; 0];
        center_l     = center - [radius; 0; 0];
        t_vec        = [2.1, 3, 4, 34, 0, 35, 36]; % (s)

        t1 = 5;
        t2 = 6;
        R = eul2rotm([0 0 pi/15], 'XYZ');
    
        while t <= mdl.rt
            if t <= t_vec(1)
                % stay on the ground
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                % going up linearly
                traj.rd(:,round(t*mdl.f)) = center ./(t_vec(2)-t_vec(1)).*(t-t_vec(1));   
            elseif t <= t_vec(3)   
                % hovering
                traj.rd(:,round(t*mdl.f)) = center; 
            elseif t <= t_vec(4)   
                % one set of trajectory
                if t <= t1 
                    traj.rd(:,round(t*mdl.f)) = center_r + [radius*cosd(-angular_rate*(t-t_vec(3))+180); 0; radius*sind(-angular_rate*(t-t_vec(3))+180);];  
                elseif t <= t2
                    traj.rd(:,round(t*mdl.f)) = center_l + [radius*cosd(angular_rate*(t-t_vec(4))); 0; radius*sind(angular_rate*(t-t_vec(4)));]; 
                end
           elseif t <= t_vec(6)               
                traj.rd(:,round(t*mdl.f)) = center;
           elseif t <= t_vec(7)
                traj.rd(:,round(t*mdl.f)) = center - center./(t_vec(7)-t_vec(6)).*(t-t_vec(6));
           end    
           t = t + mdl.T;
        end

        % get intermediate trajectory
        for i=1:14
            traj.rd(:,round((t_vec(3)+2*i)*mdl.f):round((t_vec(3)+2*i+2)*mdl.f))...
                = R*traj.rd(:,round((t_vec(3)+2*(i-1))*mdl.f):round((t_vec(3)+2*(i-1)+2)*mdl.f));
        end
            
   elseif traj.mode == 6

        % letters
        p_hover  = [0; 0; 0.04]; % (m)
        p_raw    = [p_hover(1), p_hover(2), -p_hover(3);
                        0,  0,    0;
                    -0.21,  0,    0;
                    -0.21,  0,  0.1;
                    -0.14,  0,    0;
                    -0.07,  0,  0.1;
                    -0.07,  0,    0;
                        0,  0,  0.1;
                        0,  0,    0;
                     0.07,  0,  0.1;
                     0.21,  0,  0.1;
                     0.14,  0,  0.1;
                     0.14,  0,    0;
                     0,     0,    0;
                     p_hover(1), p_hover(2), -p_hover(3);]';
        p_temp = repelem(p_raw,1,2);
        p_vec  = p_temp(:,1:end-1);
        t_vec = zeros(1,length(p_vec));
        t_vec(1:4) = [0 2.1 3 3.5];
        for i = 5:length(p_vec)
            if rem(i,2) == 1
                t_vec(i) = t_vec(i-1) + 1;
            else
                t_vec(i) = t_vec(i-1) + 0.5;
            end
        end


        while t <= mdl.rt

            if t <= t_vec(end)
                % linearly track letter waypoint
                for i = 1:size(p_vec,2)-1
                    while t < t_vec(i+1)
                        traj.rd(:,round(t*mdl.f)) = p_hover + p_vec(:,i) + (p_vec(:,i+1)-p_vec(:,i))./(t_vec(i+1)-t_vec(i)).*(t-t_vec(i));
                        t = t + mdl.T;
                    end
                end
            else
                t = t + mdl.T;
            end
        end

        traj.cf1  = 1.8;
        traj.cf2  = 1.8;
        traj.cf3  = 5;
        traj.cf11 = 2;
        traj.cf21 = 2;
        traj.cf31 = 4;

    end

    traj.t_vec = t_vec;

    % safety check
    if t_vec(end)>mdl.rt
        error('check time period in the pre-defined trajectory')
    end
    traj.t = t_plot;

    % choose filter parameter
    if traj.mode ~= 6
        traj.cf1  = 1.8;
        traj.cf2  = 1.8;
        traj.cf3  = 2;
        traj.cf11 = 2;
        traj.cf21 = 2;
        traj.cf31 = 4;
    end

    
    % design filter
    d1 = designfilt("lowpassiir",'FilterOrder', 1, ...
    'HalfPowerFrequency', traj.cf1, 'SampleRate',mdl.f, 'DesignMethod', "butter");

    d2 = designfilt("lowpassiir",'FilterOrder', 1, ...
    'HalfPowerFrequency', traj.cf2, 'SampleRate',mdl.f, 'DesignMethod', "butter");

    d3 = designfilt("lowpassiir",'FilterOrder', 1, ...
    'HalfPowerFrequency', traj.cf3, 'SampleRate',mdl.f, 'DesignMethod', "butter");

    d11 = designfilt("lowpassiir",'FilterOrder', 4, ...
    'HalfPowerFrequency', traj.cf11, 'SampleRate',mdl.f, 'DesignMethod', "butter");

    d21 = designfilt("lowpassiir",'FilterOrder', 4, ...
    'HalfPowerFrequency', traj.cf21, 'SampleRate',mdl.f, 'DesignMethod', "butter");

    d31 = designfilt("lowpassiir",'FilterOrder', 2, ...
    'HalfPowerFrequency', traj.cf31, 'SampleRate',mdl.f, 'DesignMethod', "butter");
    
    % 1st-order filter 
    traj.rd_raw  = traj.rd;
    traj.rd(1,:) = filtfilt(d1,traj.rd_raw(1,:));
    traj.rd(2,:) = filtfilt(d2,traj.rd_raw(2,:));
    traj.rd(3,:) = filtfilt(d3,traj.rd_raw(3,:));
    traj.rd_1f   = traj.rd;

    % 4th-order filter
    traj.rd(1,:) = filtfilt(d11,traj.rd_1f(1,:));
    traj.rd(2,:) = filtfilt(d21,traj.rd_1f(2,:));
    traj.rd(3,:) = filtfilt(d31,traj.rd_1f(3,:));

    % compensate tether force
    traj.force_factor = 0;
    if traj.mode == 1
        traj.force_factor = 80 % 5
    end
    traj.rd_dd_add = traj.rd.*abs(traj.rd);
    traj.rd_dd_add(1:2,:) = traj.rd_dd_add(1:2,:).*traj.force_factor;

    % saturation
    limit = [1 5 20 300];
    
    % get higher order derivative
    traj.rd_d    = max(-limit(1),min(limit(1),gradient(traj.rd)./mdl.T));
    traj.rd_dd   = max(-limit(2),min(limit(2),gradient(traj.rd_d)./mdl.T+traj.rd_dd_add));
    traj.rd_ddd  = max(-limit(3),min(limit(3),gradient(traj.rd_dd)./mdl.T));
    traj.rd_dddd = max(-limit(4),min(limit(4),gradient(traj.rd_ddd)./mdl.T));

    % get desired thrust in acc
    traj.thrust_b     = sqrt(sum(traj.rd_dd.^2));
    traj.thrust_b_dot = gradient(traj.thrust_b)./mdl.T;
    
    
    if 1

        figure(421)
        plot(t_plot, traj.rd_raw'); hold on;
        legend; grid on; 
        title("raw position"); hold off

        figure(422)
        subplot(3,1,1)
        plot(t_plot, traj.rd_raw(1,:)'); hold on;
        plot(t_plot, traj.rd_1f(1,:)'); 
        plot(t_plot, traj.rd(1,:)'); 
        legend('raw','1st filtered','higher filtered'); grid on; 
        title("filtered x position"); hold off

        subplot(3,1,2)
        plot(t_plot, traj.rd_raw(2,:)'); hold on;
        plot(t_plot, traj.rd_1f(2,:)'); 
        plot(t_plot, traj.rd(2,:)'); 
        legend('raw','1st filtered','higher filtered'); grid on; 
        title("filtered y position"); hold off

        subplot(3,1,3)
        plot(t_plot, traj.rd_raw(3,:)'); hold on;
        plot(t_plot, traj.rd_1f(3,:)'); 
        plot(t_plot, traj.rd(3,:)'); 
        legend('raw','1st filtered','higher filtered'); grid on; 
        title("filtered z position"); hold off


        figure(423)
        
        subplot(3,2,1)
        plot(t_plot,traj.rd'); grid on
        xlim([1.8 t_vec(end)+0.2])
        % ylim([lower_bound,upper_bound])
        title("position")
        
        subplot(3,2,2)
        plot(t_plot,traj.rd_d'); grid on
        xlim([1.8 t_vec(end)+0.2])
        % ylim([lower_bound,upper_bound])
        title("velocity")
        
        subplot(3,2,3)
        plot(t_plot,traj.rd_dd'); grid on
        xlim([1.8 t_vec(end)+0.2])
        % ylim([lower_bound,upper_bound])
        title("acceleration")
        
        subplot(3,2,4)
        plot(t_plot,traj.rd_ddd(1:3,:)'); grid on
        xlim([1.8 t_vec(end)+0.2])
        % ylim([lower_bound,upper_bound])
        title("jerk")
        
        subplot(3,2,5)
        plot(t_plot,traj.rd_dddd(1:2,:)'); grid on
        xlim([1.8 t_vec(end)+0.2])
        % ylim([lower_bound,upper_bound])
        title("snap")
        
        %
        figure(424)
        plot3(traj.rd(1,:),traj.rd(2,:),traj.rd(3,:))
        grid on; axis equal; view([30 30])
        cla
        patch([traj.rd(1,:) nan],[traj.rd(2,:) nan],[traj.rd(3,:) nan],...
            [t_plot nan],'EdgeColor','interp','FaceColor','none','linewidth',1.5)
        colorbar; 
        cb = colorbar; 
        cb.Title.String = "time (s)"; 
        colormap bone; % sky copper autumn bone
        
        xlabel("x (m)")
        ylabel("y (m)")
        zlabel("z (m)")
    
        xlim([min(traj.rd(1,:))-0.03,max(traj.rd(1,:))+0.03])
        ylim([min(traj.rd(2,:))-0.03,max(traj.rd(2,:))+0.03])
        zlim([min(traj.rd(3,:))-0.03,max(traj.rd(3,:))+0.03])
        hold off

    end
end

end