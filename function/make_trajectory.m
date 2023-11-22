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

    % different mode of trajectory
    mode = 3;

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
        angular_rate = 60; % (deg/s)
        center       = [0; 0; 0.08];
        center_r     = center + [radius; 0; 0];
        center_l     = center - [radius; 0; 0];
        t_vec        = [2, 3, 4, 10, 16, 17, 18]; % (s)
    
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

    elseif mode == 3

        % infinity
        radius       = 0.05; % (m)
        angular_rate = 60; % (deg/s)
        center       = [0; 0; 0.08];
        t_vec        = [2, 3, 4, 16, 17, 18, 18]; % (s)
    
        while t <= mdl.rt
            if t <= t_vec(1)      
                traj.rd(:,round(t*mdl.f)) = [0; 0; 0;];     
            elseif t <= t_vec(2)        
                traj.rd(:,round(t*mdl.f)) = center ./(t_vec(2)-t_vec(1)).*(t-t_vec(1));   
            elseif t <= t_vec(3)        
                traj.rd(:,round(t*mdl.f)) = center; 
            elseif t <= t_vec(4)               
                traj.rd(:,round(t*mdl.f)) = center + [0; 2*radius*sind(angular_rate/2*(t-t_vec(3))); radius*sind(angular_rate*(t-t_vec(3)));];    
            elseif t <= t_vec(5)               
                traj.rd(:,round(t*mdl.f)) = center;
            elseif t <= t_vec(6)               
                traj.rd(:,round(t*mdl.f)) = center - center./(t_vec(6)-t_vec(5)).*(t-t_vec(5));
                
            end      
            t = t + mdl.T;
        end
        
    end

    % safety check
    if t_vec(end)>mdl.rt
        error('check time period in the pre-defined trajectory')
    end
    
    % saturation
    limit = 1;
    
    % get higher order derivative
    traj.rd_d    = max(-limit,min(limit,gradient(traj.rd)./mdl.T));
    traj.rd_dd   = max(-limit,min(limit,gradient(traj.rd_d)./mdl.T));
    traj.rd_ddd  = max(-limit,min(limit,gradient(traj.rd_dd)./mdl.T));
    traj.rd_dddd = max(-limit,min(limit,gradient(traj.rd_ddd)./mdl.T));
                
                
    lower_bound = -0.2;
    upper_bound = 0.2;
    
    
    if 1
    figure(102)
    
    subplot(5,1,1)
    plot(t_plot,traj.rd')
    ylim([lower_bound,upper_bound])
    title("position")
    
    subplot(5,1,2)
    plot(t_plot,traj.rd_d')
    ylim([lower_bound,upper_bound])
    title("velocity")
    
    subplot(5,1,3)
    plot(t_plot,traj.rd_dd')
    ylim([lower_bound,upper_bound])
    title("acceleration")
    
    subplot(5,1,4)
    plot(t_plot,traj.rd_ddd')
    ylim([lower_bound,upper_bound])
    title("jerk")
    
    subplot(5,1,5)
    plot(t_plot,traj.rd_dddd')
    ylim([lower_bound,upper_bound])
    title("snap")
    
    %
    figure()
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

    end
end

end