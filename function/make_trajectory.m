function traj = make_trajectory(ctr, mdl)
%%

% decide to use predefined trajectory
if ctr.traj.en
    traj.en = 1;
else 
    traj.en = 0;
end

% initialize the variables
traj.rd      = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_d    = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_dd   = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_ddd  = zeros(3,(mdl.rt+1)*mdl.f);
traj.rd_dddd = zeros(3,(mdl.rt+1)*mdl.f);

% define trajectory

if traj.en

    % type of trajectory
    mode = 2;

    % time variables
    t      = mdl.T; % evolving variable for each time step
    t_plot = mdl.T:mdl.T:mdl.rt+1; % time vector for plot
    
    % generate trajectory
    if mode == 1

        % horizontal circle
        radius       = 0.05; % (m)
        angular_rate = 60; % (deg/s)
        center       = [0.05, 0];
    
        while t <= mdl.rt
            if t <= t_vec(1)      
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                traj.rd(:,round(t*mdl.f)) = [0; 0; (0.05-0)/(t_vec(2)-t_vec(1))*(t-t_vec(1));];       
            elseif t <= t_vec(3)               
                traj.rd(:,round(t*mdl.f)) = [center(1)-radius*cosd(angular_rate*(t-t_vec(2))); center(2)-radius*sind(angular_rate*(t-t_vec(2))); 0.05;];    
            elseif t <= t_vec(4)
                traj.rd(:,round(t*mdl.f)) = [0; 0;  0.05 + (0-0.05)/(t_vec(4)-t_vec(3))*(t-t_vec(3));];
            end      
            t = t + mdl.T;
        end
    
    
    elseif mode == 2

        % vertical two circles
        radius       = 0.05; % (m)
        angular_rate = 360; % (deg/s)
        center       = [0; 0; 0.095];
        center_r     = center + [radius; 0; 0];
        center_l     = center - [radius; 0; 0];
        t_vec        = [2.2, 3, 4, 5, 6, 7, 7.8]; % (s)
    
        while t <= mdl.rt
            if t <= t_vec(1)      
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                traj.rd(:,round(t*mdl.f)) = center ./(t_vec(2)-t_vec(1)).*(t-t_vec(1));   
            elseif t <= t_vec(3)        
                traj.rd(:,round(t*mdl.f)) = center; 
            elseif t <= t_vec(4)               
                traj.rd(:,round(t*mdl.f)) = center_r + [radius*cosd(-angular_rate*(t-t_vec(3))+180); 0; 1/0.865*radius*sind(-angular_rate*(t-t_vec(3))+180);];    
            elseif t <= t_vec(5)               
                traj.rd(:,round(t*mdl.f)) = center_l + [radius*cosd(angular_rate*(t-t_vec(4))); 0; 1/0.865*radius*sind(angular_rate*(t-t_vec(4)));]; 
            elseif t <= t_vec(6)               
                traj.rd(:,round(t*mdl.f)) = center;
            elseif t <= t_vec(7)
                traj.rd(:,round(t*mdl.f)) = center - center./(t_vec(7)-t_vec(6)).*(t-t_vec(6));
            end      
            t = t + mdl.T;
        end

    elseif mode == 3

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

    elseif mode == 4

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
        
    end

    % safety check
    if t_vec(end)>mdl.rt
        error('check time period in the pre-defined trajectory')
    end
    
    % saturation
    limit = 12;

    % design filter
    d1 = designfilt("lowpassiir",'FilterOrder', 1, ...
    'HalfPowerFrequency', 2.5, 'SampleRate',mdl.f, 'DesignMethod', "butter");

    d2 = designfilt("lowpassiir",'FilterOrder', 1, ...
    'HalfPowerFrequency', 10, 'SampleRate',mdl.f, 'DesignMethod', "butter");
    
    % filter position
    traj.rd_raw  = traj.rd;
    traj.rd(1,:) = filtfilt(d2,traj.rd_raw(1,:));
    % traj.rd(2,:) = filtfilt(d1,traj.rd_raw(2,:));
    traj.rd(3,:) = filtfilt(d1,traj.rd_raw(3,:));
    
    % get higher order derivative
    traj.rd_d    = max(-limit,min(limit,gradient(traj.rd)./mdl.T));
    traj.rd_dd   = max(-limit,min(limit,gradient(traj.rd_d)./mdl.T));
    traj.rd_ddd  = max(-limit,min(limit,gradient(traj.rd_dd)./mdl.T));
    traj.rd_dddd = max(-limit,min(limit,gradient(traj.rd_ddd)./mdl.T));
                

    lower_bound = -0.2;
    upper_bound = 0.2;

    
    
    if 1

        figure(421)
        plot(t_plot, traj.rd_raw'); hold on
        plot(t_plot, traj.rd')
        title("position"); 
        legend; grid on; hold off


        figure(102)
        
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
        plot(t_plot,traj.rd_ddd(1:2,:)'); grid on
        xlim([1.8 t_vec(end)+0.2])
        % ylim([lower_bound,upper_bound])
        title("jerk")
        
        subplot(3,2,5)
        plot(t_plot,traj.rd_dddd(1:2,:)'); grid on
        xlim([1.8 t_vec(end)+0.2])
        % ylim([lower_bound,upper_bound])
        title("snap")
        
        %
        figure(777)
        plot3(traj.rd(1,:),traj.rd(2,:),traj.rd(3,:))
        grid on; axis equal
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