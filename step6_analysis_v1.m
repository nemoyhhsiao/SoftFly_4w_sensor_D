%% script to analyze_result

close all

%% switch for showing plot
ShowPlot.position       = 1;
ShowPlot.angle          = 1;
ShowPlot.driveSignal    = 1;
ShowPlot.voltage        = 1;
ShowPlot.torque         = 1;
ShowPlot.forceZ         = 1;
ShowPlot.iTorque        = 0;
ShowPlot.iForceZ        = 0;
ShowPlot.en             = 1;
ShowPlot.iCompareX      = 0;
ShowPlot.iCompareY      = 0;
ShowPlot.iCompareZ      = 0;
ShowPlot.iCompareF      = 0;
ShowPlot.yawControl     = 1;
ShowPlot.yawControlPD   = 1;
ShowPlot.TorqueControlX = 1;
ShowPlot.TorqueControlY = 1;
ShowPlot.x_offset       = 1;
ShowPlot.y_offset       = 1;
ShowPlot.Tor2Ang        = 0;
ShowPlot.volt_comp      = 1;
ShowPlot.extTorq        = 1;
ShowPlot.ThisScreen     = 1;
ShowPlot.NextScreen_4K  = 0;
ShowPlot.velocity       = 1;
ShowPlot.z_b            = 0;
ShowPlot.omega          = 1;
ShowPlot.acceleration   = 0;

%% get simulation result from out

if rsim.en

    fields = out.who;  % Get a list of all the variable names in the object
    for i = 1:length(fields)
        % Create a variable in the base workspace with the same name and value
        assignin('base', fields{i}, out.get(fields{i}));
    end

    rst.rsim.dist.tor.x = rst_rsim_dist_torque.signals.values(:,1);
    rst.rsim.dist.tor.y = rst_rsim_dist_torque.signals.values(:,2);
end

%%

rst.time      = rst_voltages.time;

rst.pos.t     = rst_p_raw.time;
rst.pos.x     = rst_p_raw.signals.values(:,1);
rst.pos.y     = rst_p_raw.signals.values(:,2);
rst.pos.z     = rst_p_raw.signals.values(:,3);

rst.vel.t     = rst_p_dot.time;
rst.vel.x     = rst_p_dot.signals.values(:,1);
rst.vel.y     = rst_p_dot.signals.values(:,2);
rst.vel.z     = rst_p_dot.signals.values(:,3);

rst.acc.t     = rst_p_dotdot.time;
rst.acc.x     = rst_p_dotdot.signals.values(:,1);
rst.acc.y     = rst_p_dotdot.signals.values(:,2);
rst.acc.z     = rst_p_dotdot.signals.values(:,3);

rst.EulXYZ.t  = rst_Eul_XYZ.time;
rst.EulXYZ.x  = rst_Eul_XYZ.signals.values(:,1);
rst.EulXYZ.y  = rst_Eul_XYZ.signals.values(:,2);
rst.EulXYZ.z  = rst_Eul_XYZ.signals.values(:,3);

rst.rotm = eul2rotm([rst.EulXYZ.x, rst.EulXYZ.y , rst.EulXYZ.z], 'XYZ');

rst.EulZYX.t  = rst_Eul_XYZ.time;
rst.EulZYX.zyx = rotm2eul(rst.rotm, 'ZYX');
rst.EulZYX.z = rst.EulZYX.zyx(:,1);
rst.EulZYX.y = rst.EulZYX.zyx(:,2);
rst.EulZYX.x = rst.EulZYX.zyx(:,3);

rst.EulZXY.t  = rst_Eul_XYZ.time;
rst.EulZXY.zxy = rotm2eul(rst.rotm, 'ZXY');
rst.EulZXY.z = rst.EulZXY.zxy(:,1);
rst.EulZXY.y = rst.EulZXY.zxy(:,2);
rst.EulZXY.x = rst.EulZXY.zxy(:,3);

rst.ome.t     = rst_omega_b.time;
rst.ome.x     = rst_omega_b.signals(2).values(:,1);
rst.ome.y     = rst_omega_b.signals(2).values(:,2);
rst.ome.z     = rst_omega_b.signals(2).values(:,3);

rst.ome.t     = rst_omega_b.time;
rst.ome.raw_x = rst_omega_b.signals(1).values(:,1);
rst.ome.raw_y = rst_omega_b.signals(1).values(:,2);
rst.ome.raw_z = rst_omega_b.signals(1).values(:,3);

% rst.des.p.t   = rst_desired_xy.time;
% rst.des.p.x   = rst_desired_xy.signals.values(:,1);
% rst.des.p.y   = rst_desired_xy.signals.values(:,2);

rst.tor.x     = rst_torque_b.signals(1).values(:,1); %.*9.8e-6;
rst.tor.y     = rst_torque_b.signals(2).values(:,1); %.*9.8e-6;
rst.tor.z     = rst_torque_b.signals(3).values(:,1); %.*9.8e-6;

rst.thrust    = rst_thrust_b.signals.values;

rst.vot.v1    = rst_voltages.signals.values(:,1);
rst.vot.v2    = rst_voltages.signals.values(:,2);
rst.vot.v3    = rst_voltages.signals.values(:,3);
rst.vot.v4    = rst_voltages.signals.values(:,4);

rst.en.t      = rst_en.time;
rst.en.en     = rst_en.signals.values;

rst.drs.t     = rst_driving_signals.time;
rst.drs.s1    = rst_driving_signals.signals.values(:,1);
rst.drs.s2    = rst_driving_signals.signals.values(:,2);
rst.drs.s3    = rst_driving_signals.signals.values(:,3);
rst.drs.s4    = rst_driving_signals.signals.values(:,4);

rst.ext.tor.x = rst_ext_torque_b.signals.values(:,1);
rst.ext.tor.y = rst_ext_torque_b.signals.values(:,2);

rst.rbt       = rbt2;
rst.ctr       = ctr2;
rst.mdl       = mdl;

rst.t.opt.id  = find(rst.vot.v1>0);
rst.t.start   = rst.time(rst.t.opt.id(1));
rst.t.stop    = rst.time(rst.t.opt.id(end));

c = get_color;

%% Position
if ShowPlot.position
    figure(1)

    % plot(rst.des.p.t, rst.des.p.x.*100,'--','color',[0.6350, 0.0780, 0.1840],'linewidth',0.5); hold on
    % plot(rst.des.p.t, rst.des.p.y.*100,'--','color',[0, 0.5, 0],'linewidth',0.5)

    % plot(rst.pred.p.t, rst.pred.p.x.*100, 'r--','linewidth',0.5); hold on
    % plot(rst.pred.p.t, rst.pred.p.y.*100, 'g--','linewidth',0.5)
    % plot(rst.pred.p.t, rst.pred.p.z.*100, 'b--','linewidth',0.5); 

    plot(rst.pos.t, rst.pos.x.*100, 'linewidth',1); hold on
    plot(rst.pos.t, rst.pos.y.*100, 'linewidth',1)
    plot(rst.pos.t, rst.pos.z.*100, 'linewidth',1); 
    
%     if 0 %ctr.rtmpc.en
%         plot(rst.pos.t, rd_rtmpc(:,5).*100,'r--');
%         plot(rst.pos.t, rd_rtmpc(:,6).*100,'g--');
%         plot(rst.pos.t, rd_rtmpc(:,7).*100,'b--');
%     else
%         plot(rst.pos.t, rst.ref.pos.x.*100,'r--');
%         plot(rst.pos.t, rst.ref.pos.y.*100,'g--');
%         plot(rst.pos.t, rst.ref.pos.z.*100,'b--');
%     end
    
    if 0
        plot(rst.pos.t, robot2.UKF.r(:,1).*100,'r--'); 
        plot(rst.pos.t, robot2.UKF.r(:,2).*100,'g--');
        plot(rst.pos.t, robot2.UKF.r(:,3).*100,'b--');
    end

    % get error
    error_x = rmse(ones(length(rst.pos.x(rst.t.start*mdl.f:rst.t.stop*mdl.f)),1)*ctr.setpoint.x, rst.pos.x(rst.t.start*mdl.f:rst.t.stop*mdl.f))
    error_y = rmse(ones(length(rst.pos.y(rst.t.start*mdl.f:rst.t.stop*mdl.f)),1)*ctr.setpoint.y, rst.pos.y(rst.t.start*mdl.f:rst.t.stop*mdl.f))
    
%     plot(rst.pos.t,  ctr.envelope.xmax.*ones(length(rst.pos.t),1),'r--'); 
%     plot(rst.pos.t, -ctr.envelope.xmax.*ones(length(rst.pos.t),1),'r--'); 
%     plot(rst.pos.t,  ctr.envelope.ymax.*ones(length(rst.pos.t),1),'g--'); 
%     plot(rst.pos.t, -ctr.envelope.ymax.*ones(length(rst.pos.t),1),'g--'); 
%     plot(rst.pos.t,  ctr.envelope.zmax.*ones(length(rst.pos.t),1),'b--'); hold off
    plot([rst.t.start, rst.t.start],[min(min(min(rst.pos.x,rst.pos.y),rst.pos.z))*100, max(max(max(rst.pos.x,rst.pos.y),rst.pos.z))*100],'k--','linewidth',1.2)
    plot([rst.t.stop, rst.t.stop],[min(min(min(rst.pos.x,rst.pos.y),rst.pos.z))*100, max(max(max(rst.pos.x,rst.pos.y),rst.pos.z))*100],'k--','linewidth',1.2)
    title('x y z position')
    ylabel('cm')
    legend('x','y','z','Location','northwest')
    xlim([rst.t.start, rst.t.stop])
    grid on
    % ylim([min([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100])-5 max([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100; rst.ref.pos.x.*100;rst.ref.pos.y.*100;rst.ref.pos.z.*100;])+5])
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.95, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 1.05, 0.25, 0.35]); % [l b w h]
    end
    hold off
end

%% Euler angles
if ShowPlot.angle
    figure(2)
    if 1
        plot(rst.EulXYZ.t, rad2deg(rst.EulXYZ.x)); hold on; grid on;
        plot(rst.EulXYZ.t, rad2deg(rst.EulXYZ.y))
        plot(rst.EulXYZ.t, rad2deg(rst.EulXYZ.z))
        ylabel('degree');
    else
        plot(rst.EulXYZ.t, rst.EulXYZ.x, 'r'); hold on
        plot(rst.EulXYZ.t, rst.EulXYZ.y, 'g')
        plot(rst.EulXYZ.t, rst.EulXYZ.z, 'b')
        ylabel('radian');
    end
%     if som.en
%         % flipping angle
%         R13 = sin(rst.EulXYZ.z);
%         R23 = -sin(rst.EulXYZ.y).*cos(rst.EulXYZ.z);
%         R33 = cos(rst.EulXYZ.y).*cos(rst.EulXYZ.z);
%         flp = atan2((R13.^2+R23.^2).^0.5, R33);
%         plot(rst.EulXYZ.t, flp, 'c')
%         plot([rst.EulXYZ.t(1) rst.EulXYZ.t(end)],[pi,pi], 'b--')
%     end
%     plot([rst.mdl.rt, rst.mdl.rt],[-10, 10],'k--','linewidth',2)
    plot([rst.t.start, rst.t.start],[rad2deg(min(min(min(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z))), rad2deg(max(max(max(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z)))],'k--','linewidth',1)
    plot([rst.t.stop, rst.t.stop],[rad2deg(min(min(min(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z))), rad2deg(max(max(max(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z)))],'k--','linewidth',1)
    xlim([rst.t.start, rst.t.stop])
    ylim([-20 20])
    hold off
    title('euler angles XYZ')
%     ylim([-pi,pi])
    legend('x','y','z','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [26, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.625, 0.25, 0.35]); % [l b w h]        
    end
end

%% Driving signals
if ShowPlot.driveSignal
    figure(3)
%     if exist('DS_Time')
        plot(rst.drs.t, 200*rst.drs.s1, 'Color',c.yellow);    hold on
        plot(rst.drs.t, 200*rst.drs.s2, 'Color',c.blue)
        plot(rst.drs.t, 200*rst.drs.s3, 'Color',c.red)
        plot(rst.drs.t, 200*rst.drs.s4, 'Color',c.green)
%     else
%         plot(rst.time, 200*rst.drs.s1, 'r');    hold on
%         plot(rst.time, 200*rst.drs.s2, 'Color','#EDB120')
%         plot(rst.time, 200*rst.drs.s3, 'b')
%         plot(rst.time, 200*rst.drs.s4, 'g')
%     end
    plot([0 rst.time(end)],[1600 1600],'k--')
    plot([0 rst.time(end)],[1700 1700],'r--')
    %plot(yout(:,1), yout(:,8), 'm')
    hold off
    title('driving signals + en')
    legend('1','2','3','4','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [13, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, -0.05, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.2, 0.25, 0.35]); % [l b w h]
    end
end

%% Voltages
if ShowPlot.voltage
    figure(4)
    plot(rst.time, rst.vot.v1, 'Color',c.yellow)
    hold on
    plot(rst.time, rst.vot.v2, 'Color',c.blue)
    plot(rst.time, rst.vot.v3, 'Color', c.red)
    plot(rst.time, rst.vot.v4, 'Color',c.green)
    plot([0 rst.time(end)],[1600 1600],'k--')
    plot([0 rst.time(end)],[1700 1700],'r--')
    hold off
%     ylim([1300 max(rst.mdl.max_v_vec)])
    ylim([1300 2000])
    xlim([rst.t.start, rst.t.stop])
    title('voltage amplitudes')
    legend('1','2','3','4','Location','northwest')
    grid on
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [13, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.35, 0.95, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 1.05, 0.25, 0.35]); % [l b w h]
    end
end

%% Torque from control
if ShowPlot.torque
    % t_start = 2.2;
    % t_stop  = rst.mdl.rt;
    % if t_start > rst.mdl.rt
    %     t_start = rst.mdl.i_delay;
    % end
    % if t_stop > rst.mdl.rt
    %     t_stop = rst.mdl.rt;
    % end
    % xt_error = sum(rst.tor.x(t_start*rst.mdl.f:t_stop*rst.mdl.f))/(t_stop*rst.mdl.f-t_start*rst.mdl.f+1);
    % yt_error = sum(rst.tor.y(t_start*rst.mdl.f:t_stop*rst.mdl.f))/(t_stop*rst.mdl.f-t_start*rst.mdl.f+1);
    % zt_error = sum(rst.tor.z(t_start*rst.mdl.f:t_stop*rst.mdl.f))/(t_stop*rst.mdl.f-t_start*rst.mdl.f+1);
    figure(5)
    plot(rst.time, rst.tor.x); hold on; grid on;
    plot(rst.time, rst.tor.y)
    % plot(rst.time, rst.tor.z, 'b'); 
    % plot([t_start t_stop],[xt_error xt_error],'r--')
    % plot([t_start t_stop],[yt_error yt_error],'g--')
    % plot([t_start t_stop],[zt_error zt_error],'b--')
    plot([rst.t.start, rst.t.start],[-1e-4, 1e-4],'k--')
    plot([rst.t.stop, rst.t.stop],[-1e-4, 1e-4],'k--')
    title('torque')
    xlim([rst.t.start, rst.t.stop])
    ylim([-3,3]*1e-5)
    legend('x','y','z','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [39, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.35, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
    hold off
end

%% Z Force
if ShowPlot.forceZ

    % design filter
    d1 = designfilt("lowpassiir",'FilterOrder', 2, ...
    'HalfPowerFrequency', 0.005, 'DesignMethod', "butter");
 
    % get post-omega from real-time Euler
    rst.acc.fil.z = filtfilt(d1,rst.acc.z);

    figure(6)
    plot(rst.time, rst.thrust, 'm'); hold on; grid on; % in m/s^2
    plot(rst.acc.t, rst.acc.fil.z+rst.mdl.g, 'linewidth',1); 
    plot([rst.mdl.i_delay rst.mdl.rt], [rst.mdl.g, rst.mdl.g],'--')
    title('force z')
    xlim([rst.mdl.i_delay rst.mdl.rt])
    ylim([6 13])
    legend('control', 'robot acc')
% %     set(gcf, 'Units', 'centimeters');
% %     set(gcf, 'Position', [26, 1, 13, 10]); % [l b w h]
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.25, 0.2, 0.25, 0.35]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [52, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.35, -0.05, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
    hold off
end



%% Enable
if ShowPlot.en
    figure(7)
    plot(rst.en.t,rst.en.en(:,1:4),'linewidth',2); hold on
    plot([rst.t.start, rst.t.start],[-0.2, 1.2],'k--','linewidth',1)
    plot([rst.t.stop, rst.t.stop],[-0.2, 1.2],'k--','linewidth',1)
    title('Safety Enable')
    ylim([-0.2,1.2])
    legend('envolop','lost','flip','voltage','Location','northwest')
%     set(gcf, 'Units', 'centimeters');
%     set(gcf, 'Position', [39, 1, 12, 10]); % [l b w h]
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.5, 0.2, 0.25, 0.35]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [52, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.7, -0.05, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
    hold off
end




%% torque to angular accelaration 
if ShowPlot.Tor2Ang

    % design filter
    d1 = designfilt("lowpassiir",'FilterOrder', 2, ...
    'HalfPowerFrequency', 0.02, 'DesignMethod', "butter");
 
    % get post-omega from real-time Euler
    rst.EulXYZ.fil_x = filtfilt(d1,rst.EulXYZ.x);
    rst.EulXYZ.fil_y = filtfilt(d1,rst.EulXYZ.y);
    rst.EulXYZ.fil_z = filtfilt(d1,rst.EulXYZ.z);
    
    % rst.rotm_fil = eul2rotm([rst.EulXYZ.fil_x, rst.EulXYZ.fil_y, rst.EulXYZ.fil_z],'XYZ');
    % for i = 1:length(rst.rotm_fil)-1
    %     rst.rotm_dot(:,:,i) = (rst.rotm_fil(:,:,i+1)-rst.rotm_fil(:,:,i))./mdl.T_high;
    %     omega1_1(i) = rst.rotm_fil(:,3,i)'*rst.rotm_dot(:,2,i);
    %     omega1_2(i) = -rst.rotm_fil(:,2,i)'*rst.rotm_dot(:,3,i);
    %     omega2_1(i) = rst.rotm_fil(:,1,i)'*rst.rotm_dot(:,3,i);
    %     omega2_2(i) = -rst.rotm_fil(:,3,i)'*rst.rotm_dot(:,1,i);
    %     omega3_1(i) = rst.rotm_fil(:,2,i)'*rst.rotm_dot(:,1,i);
    %     omega3_2(i) = -rst.rotm_fil(:,1,i)'*rst.rotm_dot(:,2,i);
    % end

    q_from_Eul_fil = quaternion([rst.EulXYZ.fil_x, rst.EulXYZ.fil_y, rst.EulXYZ.fil_z], 'euler','XYZ','frame');
    rst.ome.from_Eul = angvel(q_from_Eul_fil,mdl.T_high,'point');

    % get post-pqr from post-omega
    rst.ome.fil.x = filtfilt(d1,rst.ome.from_Eul(:,1));
    rst.ome.fil.y = filtfilt(d1,rst.ome.from_Eul(:,2));
    rst.ome.fil.z = filtfilt(d1,rst.ome.from_Eul(:,3));

    % %%
    % figure()
    % plot(omega1_1); hold on
    % plot(rst.ome.raw_x)
    % plot(rst.ome.x)
    % plot(rst.ome.from_Eul(:,1))
    % ylim([-10 10])
    % 
    % %%
    % figure()
    % plot(omega2_1); hold on
    % plot(rst.ome.raw_y)
    % plot(rst.ome.y)
    % plot(rst.ome.from_Eul(:,2))
    % ylim([-10 10])
    % 
    % %%
    % figure()
    % plot(omega3_1); hold on
    % plot(rst.ome.raw_z)
    % plot(rst.ome.z)
    % plot(rst.ome.from_Eul(:,3))
    % ylim([-10 10])

    %
    % % get pqr from real-time omega
    % rst.ome.fil.x = filtfilt(d1,rst.ome.x);
    % rst.ome.fil.y = filtfilt(d1,rst.ome.y);
    % 
    % figure(71)
    % plot(rst.ome.x); hold on
    % plot(rst.ome.fil.x)

    figure(8)

    
    t_start = rst.t.start + 0.2;
    t_stop  = rst.t.stop - 0.2;

    subplot(2,1,1)
    rst.pqr_dot.x = diff(rst.ome.fil.x)/rst.mdl.T;
    Tx_offset = mean(rst.tor.x(t_start*rst.mdl.f+0.1*rst.mdl.f:t_stop*rst.mdl.f)./rst.rbt.ixx);
    plot(rst.EulXYZ.t(1:end-1), rst.pqr_dot.x,'Color','#EDB120'); hold on
    % plot(rst.time, rst.tor.x./rst.rbt.ixx,'Color','#7E2F8E')
    plot(rst.time, rst.tor.x./rst.rbt.ixx - Tx_offset,'Color',[0.3 0.3 0.3])

    legend('angular acce', 'torque','Location','northwest')
    ylim([min(min(rst.pqr_dot.x(t_start*rst.mdl.f:t_stop*rst.mdl.f)),min(rst.tor.x(t_start*rst.mdl.f:t_stop*rst.mdl.f)./rst.rbt.ixx)) max(max(rst.pqr_dot.x(t_start*rst.mdl.f:t_stop*rst.mdl.f)),max(rst.tor.x(t_start*rst.mdl.f:t_stop*rst.mdl.f)./rst.rbt.ixx))])
    xlim([rst.t.start rst.t.stop])
    grid on
    hold off
    title("angular acc vs torque")

    subplot(2,1,2)
    rst.pqr_dot.y = diff(rst.ome.fil.y)/rst.mdl.T;
    Ty_offset = mean(rst.tor.y(t_start*rst.mdl.f+0.1*rst.mdl.f:t_stop*rst.mdl.f)./rst.rbt.iyy);
    plot(rst.EulXYZ.t(1:end-1), rst.pqr_dot.y,'Color','#EDB120'); hold on
    % plot(rst.time, rst.tor.y./rst.rbt.iyy,'Color','#7E2F8E')
    plot(rst.time, rst.tor.y./rst.rbt.iyy - Ty_offset,'Color',[0.3 0.3 0.3])
    legend('angular acce', 'torque','Location','northwest')
    ylim([min(min(rst.pqr_dot.y(t_start*rst.mdl.f:t_stop*rst.mdl.f)),min(rst.tor.y(t_start*rst.mdl.f:t_stop*rst.mdl.f)./rst.rbt.iyy)) max(max(rst.pqr_dot.y(t_start*rst.mdl.f:t_stop*rst.mdl.f)),max(rst.tor.y(t_start*rst.mdl.f:t_stop*rst.mdl.f)./rst.rbt.iyy))])
    xlim([rst.t.start rst.t.stop])
    grid on
    hold off

    % subplot(3,1,3)
    % az      = diff(rst.ome.z)/rst.mdl.T;
    % plot(rst.time(1:end-1), az,'Color','#EDB120'); hold on
    % plot(rst.time, rst.tor.z./rst.rst.izz,'Color','#7E2F8E')
    % legend('angular acce', 'torque','Location','northwest')
    % ylim([min(min(az(t_start*rst.mdl.f:t_stop*rst.mdl.f)),min(rst.tor.z(t_start*rst.mdl.f:t_stop*rst.mdl.f)./rst.rst.izz)) max(max(az(t_start*rst.mdl.f:t_stop*rst.mdl.f)),max(rst.tor.z(t_start*rst.mdl.f:t_stop*rst.mdl.f)./rst.rst.izz))])
    % xlim([rst.mdl.i_delay rst.mdl.rt])
    % hold off
    
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [2.05, 0.83, 0.29, 0.57]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [39, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [2.55, -0.45, 0.45, 0.9]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end

%% external torque
if ShowPlot.extTorq
   
    figure(9)
    plot(rst.time,rst.ext.tor.x); hold on
    plot(rst.time,rst.ext.tor.y);
    legend('x','y','Location','northwest')

    if rsim.en
        plot(rst.time,rst.rsim.dist.tor.x)
        plot(rst.time,rst.rsim.dist.tor.y)
        legend('estimated x','estimated y','true x','true y','Location','northwest')
    end
    
    title('external torque')
    xlim([rst.mdl.i_delay rst.mdl.rt])
    ylim([-3e-5, 3e-5])
    grid on
    
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [39, 1, 13, 10]); % [l b w h]  
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, -0.45, 0.35, 0.45]); % [l b w h]
    end
    hold off
end


%% velocity
if ShowPlot.velocity
    figure(10)
    plot(rst.vel.t, rst.vel.x.*100, 'linewidth',1); hold on
    plot(rst.vel.t, rst.vel.y.*100, 'linewidth',1)
    plot(rst.vel.t, rst.vel.z.*100, 'linewidth',1); 

    % plot([mdl.servo_drop_time, mdl.servo_drop_time],[min(min(min(rst.vel.x,rst.vel.y),rst.vel.z))*100, max(max(max(rst.vel.x,rst.vel.y),rst.vel.z))*100],'k--','linewidth',1.2)
    plot([rst.t.start, rst.t.start],[-200,200],'k--','linewidth',1)
    plot([rst.t.stop, rst.t.stop],[-200,200],'k--','linewidth',1)
    title('x y z velocity')
    ylabel('cm/s')
    legend('x','y','z','Location','northwest')
    xlim([rst.t.start, rst.t.stop])
    ylim([-100, 100])
    grid on
    % ylim([min([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100])-5 max([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100; rst.ref.pos.x.*100;rst.ref.pos.y.*100;rst.ref.pos.z.*100;])+5])
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.95, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 1.05, 0.25, 0.35]); % [l b w h]
    end
    hold off
end

%% accelaration
if ShowPlot.acceleration
    figure(11)
    plot(rst.acc.t, rst.acc.x.*100,'linewidth',1); hold on
    plot(rst.acc.t, rst.acc.y.*100,'linewidth',1)
    plot(rst.acc.t, rst.acc.z.*100,'linewidth',1); 

    title('x y z acceleration')
    ylabel('cm/s2')
    legend('x','y','z','Location','northwest')
    xlim([rst.t.start, rst.t.stop])
    ylim([-300, 300])
    grid on
    % ylim([min([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100])-5 max([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100; rst.ref.pos.x.*100;rst.ref.pos.y.*100;rst.ref.pos.z.*100;])+5])
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [52, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.95, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 1.05, 0.25, 0.35]); % [l b w h]
    end
    hold off
end

%% omega

if ShowPlot.omega

    figure(12)
    plot(rst.ome.t, rst.ome.x); hold on; grid on;
    plot(rst.ome.t, rst.ome.y)
    % plot(rst.ome.t, rst.tor.z, 'b'); 
    % plot([t_start t_stop],[xt_error xt_error],'r--')
    % plot([t_start t_stop],[yt_error yt_error],'g--')
    % plot([t_start t_stop],[zt_error zt_error],'b--')
    plot([rst.t.start, rst.t.start],[-10, 10],'k--')
    plot([rst.t.stop, rst.t.stop],[-10, 10],'k--')
    title('omega')
    xlim([rst.t.start, rst.t.stop])
    %ylim([-1,1]*1e-5)
    legend('x','y','z','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [26, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.35, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end


%% Euler angles
if ShowPlot.angle
    figure(13)
    if 1
        plot(rst.EulXYZ.t, rad2deg(rst.EulZYX.x)); hold on; grid on;
        plot(rst.EulXYZ.t, rad2deg(rst.EulZYX.y))
        plot(rst.EulXYZ.t, rad2deg(rst.EulZYX.z))
        ylabel('degree');
        ylim([-20 20])
    else
        plot(rst.EulXYZ.t, rst.EulZYX.x, 'r'); hold on
        plot(rst.EulXYZ.t, rst.EulZYX.y, 'g')
        plot(rst.EulXYZ.t, rst.EulZYX.z, 'b')
        ylabel('radian');
        ylim([-0.3 0.3])
    end
%     if som.en
%         % flipping angle
%         R13 = sin(rst.EulXYZ.z);
%         R23 = -sin(rst.EulXYZ.y).*cos(rst.EulXYZ.z);
%         R33 = cos(rst.EulXYZ.y).*cos(rst.EulXYZ.z);
%         flp = atan2((R13.^2+R23.^2).^0.5, R33);
%         plot(rst.EulXYZ.t, flp, 'c')
%         plot([rst.EulXYZ.t(1) rst.EulXYZ.t(end)],[pi,pi], 'b--')
%     end
%     plot([rst.mdl.rt, rst.mdl.rt],[-10, 10],'k--','linewidth',2)
    plot([rst.t.start, rst.t.start],[rad2deg(min(min(min(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z))), rad2deg(max(max(max(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z)))],'k--','linewidth',1)
    plot([rst.t.stop, rst.t.stop],[rad2deg(min(min(min(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z))), rad2deg(max(max(max(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z)))],'k--','linewidth',1)
    xlim([rst.t.start, rst.t.stop])
    
    hold off
    title('euler angles ZYX')
%     ylim([-pi,pi])
    legend('x','y','z','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [52, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.625, 0.25, 0.35]); % [l b w h]        
    end
end


%% body frame error

% rotm_z = eul2rotm([ rst.EulZYX.z zeros(length(rst.EulZYX.z),2)], 'ZYX');
% 
% rst.err.pos.x = [rst.pos.x; rst.pos.x(end)*ones(4,1)] - repelem(rst.des.p.x,5);
% rst.err.pos.y = [rst.pos.y; rst.pos.y(end)*ones(4,1)] - repelem(rst.des.p.y,5);
% rst.err.pos.z = zeros(length(repelem(rst.des.p.y,5)),1);
% 
% rst.err.pos.p = [rst.err.pos.x rst.err.pos.y rst.err.pos.z];
% 
% for i = 1:length(rst.err.pos.x)-5
%     rst.err.pos_b.p(i,:) = (rotm_z(:,:,i)'*rst.err.pos.p(i,:)')';
% end
% 
% figure
% plot(rst.err.pos_b.p)

%%
% %% velocity filter debugging
% if 1
% 
%     rst.vel2.x     = rst_p_dot2.signals.values(:,1);
%     rst.vel2.y     = rst_p_dot2.signals.values(:,2);
%     rst.vel2.z     = rst_p_dot2.signals.values(:,3);
% 
%     rst.vel3.x     = rst_p_dot3.signals.values(:,1);
%     rst.vel3.y     = rst_p_dot3.signals.values(:,2);
%     rst.vel3.z     = rst_p_dot3.signals.values(:,3);
% 
%     rst.data_ready = rst_vicon_data_ready.signals.values;
% 
%     figure(37)
%     % plot(rst.ome.t, rst.vel.x.*100, 'r','linewidth',1); 
%     % plot(rst.time, rst.vel.y.*100, 'g','linewidth',1)
%     plot(rst.time, rst.vel.z.*100, 'r','linewidth',0.8); hold on
%     plot(rst.time, rst.vel2.z.*100, 'g','linewidth',0.5); hold on
%     plot(rst.time, rst.vel3.z.*100, 'b','linewidth',0.5); hold on
%     plot(rst.time, rst.data_ready.*100, 'k','linewidth',0.5); hold on
% 
%     % plot([mdl.servo_drop_time, mdl.servo_drop_time],[min(min(min(rst.vel.x,rst.vel.y),rst.vel.z))*100, max(max(max(rst.vel.x,rst.vel.y),rst.vel.z))*100],'k--','linewidth',1.2)
%     plot([rst.t.start, rst.t.start],[-200,200],'k--','linewidth',1)
%     plot([rst.t.stop, rst.t.stop],[-200,200],'k--','linewidth',1)
%     title('velocity debug')
%     ylabel('cm/s')
%     legend('z1','z2','Location','northwest')
%     xlim([rst.t.start, rst.t.stop])
%     ylim([-300, 300])
%     % ylim([min([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100])-5 max([rst.pos.x.*100; rst.pos.y.*100; rst.pos.z.*100; rst.ref.pos.x.*100;rst.ref.pos.y.*100;rst.ref.pos.z.*100;])+5])
%     % if ShowPlot.ThisScreen
%     %     set(gcf, 'Units', 'centimeters');
%     %     set(gcf, 'Position', [0, 1, 13, 10]); % [l b w h]
%     % elseif ShowPlot.NextScreen_4K
%     %     set(gcf, 'Units', 'normalized');
%     %     set(gcf, 'Position', [1, 0.95, 0.35, 0.45]); % [l b w h]
%     % else
%     %     set(gcf, 'Units', 'normalized');
%     %     set(gcf, 'Position', [1, 1.05, 0.25, 0.35]); % [l b w h]
%     % end
%     hold off
% end
% 
% %% omega debugging
% 
% if 1
% 
%     rst.time      = rst_omega_b.time;
% 
% 
% 
%     rst.ome.x     = rst_omega_b.signals.values(:,1);
%     rst.ome.y     = rst_omega_b.signals.values(:,2);
%     rst.ome.z     = rst_omega_b.signals.values(:,3);
% 
%     rst.time1      = rst_omega_b1.time;
% 
%     rst.ome1.x     = rst_omega_b1.signals(1).values(:,1);
%     rst.ome1.y     = rst_omega_b1.signals(1).values(:,2);
%     rst.ome1.z     = rst_omega_b1.signals(1).values(:,3);
% 
%     rst.ome2.x     = rst_omega_b1.signals(2).values(:,1);
%     rst.ome2.y     = rst_omega_b1.signals(2).values(:,2);
%     rst.ome2.z     = rst_omega_b1.signals(2).values(:,3);
% 
%     figure(45)
%     plot(rst.time, rst.ome.x, 'r'); hold on; grid on;
%     % plot(rst.time, rst.ome.y, 'g--')
% 
%     % plot(rst.time1, rst.ome1.x, 'k'); 
%     plot(rst.time1, rst.ome2.x, 'b'); 
%     % plot(rst.time1, rst.ome1.y, 'g')
%     % plot(rst.time, rst.tor.z, 'b'); 
%     % plot([t_start t_stop],[xt_error xt_error],'r--')
%     % plot([t_start t_stop],[yt_error yt_error],'g--')
%     % plot([t_start t_stop],[zt_error zt_error],'b--')
%     % plot([rst.t.start, rst.t.start],[-10, 10],'k--')
%     % plot([rst.t.stop, rst.t.stop],[-10, 10],'k--')
%     title('omega')
%     % xlim([rst.t.start, rst.t.stop])
%     %ylim([-1,1]*1e-5)
%     % legend('x','y','z','Location','northwest')
%     % if ShowPlot.ThisScreen
%     %     set(gcf, 'Units', 'centimeters');
%     %     set(gcf, 'Position', [39, 13, 13, 10]); % [l b w h]
%     % elseif ShowPlot.NextScreen_4K
%     %     set(gcf, 'Units', 'normalized');
%     %     set(gcf, 'Position', [1.35, 0.45, 0.35, 0.45]); % [l b w h]
%     % else
%     %     set(gcf, 'Units', 'normalized');
%     %     set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
%     % end
%     hold off
% end
