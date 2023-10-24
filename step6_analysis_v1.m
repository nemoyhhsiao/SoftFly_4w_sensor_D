%% script to analyze_result

close all

%% switch for showing plot
ShowPlot.position       = 1;
ShowPlot.angle          = 1;
ShowPlot.driveSignal    = 1;
ShowPlot.voltage        = 1;
ShowPlot.torque         = 1;
ShowPlot.forceZ         = 0;
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
ShowPlot.Tor2Ang        = 1;
ShowPlot.volt_comp      = 1;
ShowPlot.extTorq        = 0;
ShowPlot.ThisScreen     = 1;
ShowPlot.NextScreen_4K  = 0;
ShowPlot.velocity       = 1;
ShowPlot.z_b            = 1;
ShowPlot.omega          = 1;

%%

clearvars rbt

if rsim.en == 1

    rst_voltages = out.rst_voltages;

end

rbt.time      = rst_voltages.time;

rbt.pos.t     = rst_p_raw.time;
rbt.pos.x     = rst_p_raw.signals.values(:,1);
rbt.pos.y     = rst_p_raw.signals.values(:,2);
rbt.pos.z     = rst_p_raw.signals.values(:,3);

% rbt.vel.t     = rst_p_dot.time;
% rbt.vel.x     = rst_p_dot.signals.values(:,1);
% rbt.vel.y     = rst_p_dot.signals.values(:,2);
% rbt.vel.z     = rst_p_dot.signals.values(:,3);

rbt.EulXYZ.t  = rst_Eul_XYZ.time;
rbt.EulXYZ.x  = rst_Eul_XYZ.signals.values(:,1);
rbt.EulXYZ.y  = rst_Eul_XYZ.signals.values(:,2);
rbt.EulXYZ.z  = rst_Eul_XYZ.signals.values(:,3);

rbt.rotm = eul2rotm([rbt.EulXYZ.x, rbt.EulXYZ.y , rbt.EulXYZ.z], 'XYZ');

rbt.EulZYX.zyx = rotm2eul(rbt.rotm, 'ZYX');
rbt.EulZYX.z = rbt.EulZYX.zyx(:,1);
rbt.EulZYX.y = rbt.EulZYX.zyx(:,2);
rbt.EulZYX.x = rbt.EulZYX.zyx(:,3);
% rbt.EulXYZ.x  = rst_Eul_XYZ.signals.values(1,1,:);
% rbt.EulXYZ.y  = rst_Eul_XYZ.signals.values(2,1,:);
% rbt.EulXYZ.z  = rst_Eul_XYZ.signals.values(3,1,:);

% rbt.ome.t     = rst_omega_b.time;
% rbt.ome.x     = rst_omega_b.signals.values(:,1);
% rbt.ome.y     = rst_omega_b.signals.values(:,2);
% rbt.ome.z     = rst_omega_b.signals.values(:,3);

% rbt.pred.p.t  = rst_predicted_p_landing.time;
% rbt.pred.p.x  = rst_predicted_p_landing.signals.values(:,1);
% rbt.pred.p.y  = rst_predicted_p_landing.signals.values(:,2);
% rbt.pred.p.z  = rst_predicted_p_landing.signals.values(:,3);
% 
% rbt.des.p.t   = rst_desired_xy.time;
% rbt.des.p.x   = rst_desired_xy.signals.values(:,1);
% rbt.des.p.y   = rst_desired_xy.signals.values(:,2);

rbt.tor.x     = rst_torque_b.signals.values(:,1).*9.8e-6;
rbt.tor.y     = rst_torque_b.signals.values(:,2).*9.8e-6;
rbt.tor.z     = rst_torque_b.signals.values(:,3).*9.8e-6;

rbt.thrust    = rst_thrust_control_mg.signals.values;

rbt.vot.v1    = rst_voltages.signals.values(:,1);
rbt.vot.v2    = rst_voltages.signals.values(:,2);
rbt.vot.v3    = rst_voltages.signals.values(:,3);
rbt.vot.v4    = rst_voltages.signals.values(:,4);

rbt.en.t      = rst_en.time;
rbt.en.en     = rst_en.signals.values;

% rbt.z_b.x     = rst_z_b.signals.values(:,1);
% rbt.z_b.y     = rst_z_b.signals.values(:,2);
% rbt.z_b.z     = rst_z_b.signals.values(:,3);
% rbt.z_b_des.x = rst_z_b_desired.signals.values(:,1);
% rbt.z_b_des.y = rst_z_b_desired.signals.values(:,2);
% rbt.z_b_des.z = rst_z_b_desired.signals.values(:,3);

rbt.drs.t     = rst_driving_signals.time;
rbt.drs.s1    = rst_driving_signals.signals.values(:,1);
rbt.drs.s2    = rst_driving_signals.signals.values(:,2);
rbt.drs.s3    = rst_driving_signals.signals.values(:,3);
rbt.drs.s4    = rst_driving_signals.signals.values(:,4);

rbt.rbt       = rbt2;
rbt.ctr       = ctr2;
rbt.mdl       = mdl;

if exist('mdl.servo_drop_time','var')

else
    mdl.servo_drop_time = 5;
end

rbt.t.opt.id  = find(rbt.vot.v1>0);
rbt.t.start   = rbt.time(rbt.t.opt.id(1));
rbt.t.stop    = rbt.time(rbt.t.opt.id(end));

%% Position
if ShowPlot.position
    figure(1)

    plot(rbt.des.p.t, rbt.des.p.x.*100,'--','color',[0.6350, 0.0780, 0.1840],'linewidth',0.5); hold on
    plot(rbt.des.p.t, rbt.des.p.y.*100,'--','color',[0, 0.5, 0],'linewidth',0.5)

    plot(rbt.pred.p.t, rbt.pred.p.x.*100, 'r--','linewidth',0.5); hold on
    plot(rbt.pred.p.t, rbt.pred.p.y.*100, 'g--','linewidth',0.5)
    plot(rbt.pred.p.t, rbt.pred.p.z.*100, 'b--','linewidth',0.5); 

    plot(rbt.pos.t, rbt.pos.x.*100, 'r','linewidth',1); hold on
    plot(rbt.pos.t, rbt.pos.y.*100, 'g','linewidth',1)
    plot(rbt.pos.t, rbt.pos.z.*100, 'b','linewidth',1); 
    
%     if 0 %ctr.rtmpc.en
%         plot(rbt.pos.t, rd_rtmpc(:,5).*100,'r--');
%         plot(rbt.pos.t, rd_rtmpc(:,6).*100,'g--');
%         plot(rbt.pos.t, rd_rtmpc(:,7).*100,'b--');
%     else
%         plot(rbt.pos.t, rbt.ref.pos.x.*100,'r--');
%         plot(rbt.pos.t, rbt.ref.pos.y.*100,'g--');
%         plot(rbt.pos.t, rbt.ref.pos.z.*100,'b--');
%     end
    
    if 0
        plot(rbt.pos.t, robot2.UKF.r(:,1).*100,'r--'); 
        plot(rbt.pos.t, robot2.UKF.r(:,2).*100,'g--');
        plot(rbt.pos.t, robot2.UKF.r(:,3).*100,'b--');
    end
%     plot(rbt.pos.t,  ctr.envelope.xmax.*ones(length(rbt.pos.t),1),'r--'); 
%     plot(rbt.pos.t, -ctr.envelope.xmax.*ones(length(rbt.pos.t),1),'r--'); 
%     plot(rbt.pos.t,  ctr.envelope.ymax.*ones(length(rbt.pos.t),1),'g--'); 
%     plot(rbt.pos.t, -ctr.envelope.ymax.*ones(length(rbt.pos.t),1),'g--'); 
%     plot(rbt.pos.t,  ctr.envelope.zmax.*ones(length(rbt.pos.t),1),'b--'); hold off
    plot([rbt.t.start, rbt.t.start],[min(min(min(rbt.pos.x,rbt.pos.y),rbt.pos.z))*100, max(max(max(rbt.pos.x,rbt.pos.y),rbt.pos.z))*100],'k--','linewidth',1.2)
    plot([rbt.t.stop, rbt.t.stop],[min(min(min(rbt.pos.x,rbt.pos.y),rbt.pos.z))*100, max(max(max(rbt.pos.x,rbt.pos.y),rbt.pos.z))*100],'k--','linewidth',1.2)
    title('x y z position')
    ylabel('cm')
    legend('x ref','y ref','x pred','y pred','z pred','x','y','z','Location','northwest')
    xlim([rbt.t.start, rbt.t.stop])
    % ylim([min([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100])-5 max([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100; rbt.ref.pos.x.*100;rbt.ref.pos.y.*100;rbt.ref.pos.z.*100;])+5])
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
        plot(rbt.EulXYZ.t, rad2deg(rbt.EulXYZ.x), 'r'); hold on; grid on;
        plot(rbt.EulXYZ.t, rad2deg(rbt.EulXYZ.y), 'g')
        plot(rbt.EulXYZ.t, rad2deg(rbt.EulXYZ.z), 'b')
        ylabel('degree');
    else
        plot(rbt.EulXYZ.t, rbt.EulXYZ.x, 'r'); hold on
        plot(rbt.EulXYZ.t, rbt.EulXYZ.y, 'g')
        plot(rbt.EulXYZ.t, rbt.EulXYZ.z, 'b')
        ylabel('radian');
    end
%     if som.en
%         % flipping angle
%         R13 = sin(rbt.EulXYZ.z);
%         R23 = -sin(rbt.EulXYZ.y).*cos(rbt.EulXYZ.z);
%         R33 = cos(rbt.EulXYZ.y).*cos(rbt.EulXYZ.z);
%         flp = atan2((R13.^2+R23.^2).^0.5, R33);
%         plot(rbt.EulXYZ.t, flp, 'c')
%         plot([rbt.EulXYZ.t(1) rbt.EulXYZ.t(end)],[pi,pi], 'b--')
%     end
%     plot([rbt.mdl.rt, rbt.mdl.rt],[-10, 10],'k--','linewidth',2)
    plot([rbt.t.start, rbt.t.start],[rad2deg(min(min(min(rbt.EulXYZ.x,rbt.EulXYZ.y),rbt.EulXYZ.z))), rad2deg(max(max(max(rbt.EulXYZ.x,rbt.EulXYZ.y),rbt.EulXYZ.z)))],'k--','linewidth',1)
    plot([rbt.t.stop, rbt.t.stop],[rad2deg(min(min(min(rbt.EulXYZ.x,rbt.EulXYZ.y),rbt.EulXYZ.z))), rad2deg(max(max(max(rbt.EulXYZ.x,rbt.EulXYZ.y),rbt.EulXYZ.z)))],'k--','linewidth',1)
    xlim([rbt.t.start, rbt.t.stop])
    ylim([-60 60])
    hold off
    title('euler angles XYZ')
%     ylim([-pi,pi])
    legend('x','y','z','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [26, 1, 13, 10]); % [l b w h]
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
        plot(rbt.drs.t, 200*rbt.drs.s1, 'r');    hold on
        plot(rbt.drs.t, 200*rbt.drs.s2, 'Color','#EDB120')
        plot(rbt.drs.t, 200*rbt.drs.s3, 'b')
        plot(rbt.drs.t, 200*rbt.drs.s4, 'g')
%     else
%         plot(rbt.time, 200*rbt.drs.s1, 'r');    hold on
%         plot(rbt.time, 200*rbt.drs.s2, 'Color','#EDB120')
%         plot(rbt.time, 200*rbt.drs.s3, 'b')
%         plot(rbt.time, 200*rbt.drs.s4, 'g')
%     end
    plot([0 rbt.time(end)],[1600 1600],'k--')
    plot([0 rbt.time(end)],[1700 1700],'r--')
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
    plot(rbt.time, rbt.vot.v1, 'r')
    hold on
    plot(rbt.time, rbt.vot.v2, 'Color','#EDB120')
    plot(rbt.time, rbt.vot.v3, 'b')
    plot(rbt.time, rbt.vot.v4, 'g')
    plot([0 rbt.time(end)],[1600 1600],'k--')
    plot([0 rbt.time(end)],[1700 1700],'r--')
    hold off
%     ylim([1300 max(rbt.mdl.max_v_vec)])
    ylim([300 1900])
    xlim([rbt.t.start, rbt.t.stop])
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
    % t_stop  = rbt.mdl.rt;
    % if t_start > rbt.mdl.rt
    %     t_start = rbt.mdl.i_delay;
    % end
    % if t_stop > rbt.mdl.rt
    %     t_stop = rbt.mdl.rt;
    % end
    % xt_error = sum(rbt.tor.x(t_start*rbt.mdl.f:t_stop*rbt.mdl.f))/(t_stop*rbt.mdl.f-t_start*rbt.mdl.f+1);
    % yt_error = sum(rbt.tor.y(t_start*rbt.mdl.f:t_stop*rbt.mdl.f))/(t_stop*rbt.mdl.f-t_start*rbt.mdl.f+1);
    % zt_error = sum(rbt.tor.z(t_start*rbt.mdl.f:t_stop*rbt.mdl.f))/(t_stop*rbt.mdl.f-t_start*rbt.mdl.f+1);
    figure(5)
    plot(rbt.time, rbt.tor.x, 'r'); hold on; grid on;
    plot(rbt.time, rbt.tor.y, 'g')
    % plot(rbt.time, rbt.tor.z, 'b'); 
    % plot([t_start t_stop],[xt_error xt_error],'r--')
    % plot([t_start t_stop],[yt_error yt_error],'g--')
    % plot([t_start t_stop],[zt_error zt_error],'b--')
    plot([rbt.t.start, rbt.t.start],[-1e-4, 1e-4],'k--')
    plot([rbt.t.stop, rbt.t.stop],[-1e-4, 1e-4],'k--')
    title('torque')
    xlim([rbt.t.start, rbt.t.stop])
    %ylim([-1,1]*1e-5)
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
end

%% Z Force
if ShowPlot.forceZ
    figure(6)
    plot(rbt.time, rbt.thrust/rbt.rbt.m, 'm'); hold on; grid on; % in m/s^2
    plot(rbt.time, rbt.acc.z+rbt.mdl.g, 'linewidth',1); 
    plot([rbt.mdl.i_delay rbt.mdl.rt], [rbt.mdl.g, rbt.mdl.g],'--')
    title('force z')
    xlim([rbt.mdl.i_delay rbt.mdl.rt])
    legend('control', 'robot acc')
% %     set(gcf, 'Units', 'centimeters');
% %     set(gcf, 'Position', [26, 1, 13, 10]); % [l b w h]
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.25, 0.2, 0.25, 0.35]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.35, -0.05, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end



%% Enable
if ShowPlot.en
    figure(9)
    plot(rbt.en.t,rbt.en.en(:,1:6),'linewidth',2); hold on
    plot([rbt.t.start, rbt.t.start],[-0.2, 1.2],'k--','linewidth',1)
    plot([rbt.t.stop, rbt.t.stop],[-0.2, 1.2],'k--','linewidth',1)
    title('Safety Enable')
    ylim([-0.2,1.2])
    legend('envolop','landing','z','lost','flip','voltage','Location','northwest')
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

    d1 = designfilt("lowpassiir",'FilterOrder', 2, ...
    'HalfPowerFrequency', 0.02, 'DesignMethod', "butter");

    

    rbt.ome.fil.x = filtfilt(d1,rbt.ome.x);
    rbt.ome.fil.y = filtfilt(d1,rbt.ome.y);

    figure(71)
    plot(rbt.ome.x); hold on
    plot(rbt.ome.fil.x)

    figure(21)

    
    t_start = rbt.t.start + 0.2;
    t_stop  = rbt.t.stop - 0.2;

    subplot(2,1,1)
    rbt.pqr_dot.x = diff(rbt.ome.fil.x)/rbt.mdl.T;
    Tx_offset = mean(rbt.tor.x(t_start*rbt.mdl.f+0.1*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.ixx);
    plot(rbt.ome.t(1:end-1), rbt.pqr_dot.x,'Color','#EDB120'); hold on
    % plot(rbt.time, rbt.tor.x./rbt.rbt.ixx,'Color','#7E2F8E')
    plot(rbt.time, rbt.tor.x./rbt.rbt.ixx - Tx_offset,'Color',[0.3 0.3 0.3])
    legend('angular acce', 'torque','Location','northwest')
    ylim([min(min(rbt.pqr_dot.x(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)),min(rbt.tor.x(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.ixx)) max(max(rbt.pqr_dot.x(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)),max(rbt.tor.x(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.ixx))])
    xlim([rbt.t.start rbt.t.stop])
    hold off
    title("angular acc vs torque")

    subplot(2,1,2)
    rbt.pqr_dot.y = diff(rbt.ome.fil.y)/rbt.mdl.T;
    Ty_offset = mean(rbt.tor.y(t_start*rbt.mdl.f+0.1*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.iyy);
    plot(rbt.ome.t(1:end-1), rbt.pqr_dot.y,'Color','#EDB120'); hold on
    % plot(rbt.time, rbt.tor.y./rbt.rbt.iyy,'Color','#7E2F8E')
    plot(rbt.time, rbt.tor.y./rbt.rbt.iyy - Ty_offset,'Color',[0.3 0.3 0.3])
    legend('angular acce', 'torque','Location','northwest')
    ylim([min(min(rbt.pqr_dot.y(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)),min(rbt.tor.y(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.iyy)) max(max(rbt.pqr_dot.y(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)),max(rbt.tor.y(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.iyy))])
    xlim([rbt.t.start rbt.t.stop])
    hold off

    % subplot(3,1,3)
    % az      = diff(rbt.ome.z)/rbt.mdl.T;
    % plot(rbt.time(1:end-1), az,'Color','#EDB120'); hold on
    % plot(rbt.time, rbt.tor.z./rbt.rbt.izz,'Color','#7E2F8E')
    % legend('angular acce', 'torque','Location','northwest')
    % ylim([min(min(az(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)),min(rbt.tor.z(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.izz)) max(max(az(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)),max(rbt.tor.z(t_start*rbt.mdl.f:t_stop*rbt.mdl.f)./rbt.rbt.izz))])
    % xlim([rbt.mdl.i_delay rbt.mdl.rt])
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
   
    figure(31)
    plot(rbt.time,rbt.ext.tor.x); hold on
    plot(rbt.time,rbt.ext.tor.y);
    
    title('external torque')
    xlim([rbt.mdl.i_delay rbt.mdl.rt])

    legend('x','y','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [29, 3, 12, 10]); % [l b w h]  
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, -0.45, 0.35, 0.45]); % [l b w h]
    end
    hold off
end


%%
if 0
    figure(24)

    subplot(4,1,1)
    plot(DS_Time, VC(:,1:2)); 

    subplot(4,1,2)
    plot(DS_Time, VC(:,3)); hold on
    plot(DS_Time, VC(:,4).*2.4); hold off

    subplot(4,1,3)
    plot(DS_Time, VC(:,5:6));

    subplot(4,1,4)
    plot(DS_Time, VC(:,7:8));
end


%% velocity
if ShowPlot.velocity
    figure(31)
    plot(rbt.vel.t, rbt.vel.x.*100, 'r','linewidth',1); hold on
    plot(rbt.vel.t, rbt.vel.y.*100, 'g','linewidth',1)
    plot(rbt.vel.t, rbt.vel.z.*100, 'b','linewidth',1); 

    % plot([mdl.servo_drop_time, mdl.servo_drop_time],[min(min(min(rbt.vel.x,rbt.vel.y),rbt.vel.z))*100, max(max(max(rbt.vel.x,rbt.vel.y),rbt.vel.z))*100],'k--','linewidth',1.2)
    plot([rbt.t.start, rbt.t.start],[-200,200],'k--','linewidth',1)
    plot([rbt.t.stop, rbt.t.stop],[-200,200],'k--','linewidth',1)
    title('x y z velocity')
    ylabel('cm/s')
    legend('x','y','z','Location','northwest')
    xlim([rbt.t.start, rbt.t.stop])
    ylim([-300, 300])
    % ylim([min([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100])-5 max([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100; rbt.ref.pos.x.*100;rbt.ref.pos.y.*100;rbt.ref.pos.z.*100;])+5])
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

%% z_b
if ShowPlot.z_b

    figure(32)
    plot(rbt.time, rbt.z_b_des.x, 'r--','linewidth',0.5); hold on
    plot(rbt.time, rbt.z_b_des.y, 'g--','linewidth',0.5)
    plot(rbt.time, rbt.z_b_des.z, 'b--','linewidth',0.5); 

    plot(rbt.time, rbt.z_b.x, 'r','linewidth',1); hold on
    plot(rbt.time, rbt.z_b.y, 'g','linewidth',1)
    plot(rbt.time, rbt.z_b.z, 'b','linewidth',1); 

    plot([rbt.t.start, rbt.t.start],[-0.3,1],'k--','linewidth',1)
    plot([rbt.t.stop, rbt.t.stop],[-0.3,1],'k--','linewidth',1)

    % plot([mdl.servo_drop_time, mdl.servo_drop_time],[min(min(min(rbt.vel.x,rbt.vel.y),rbt.vel.z))*100, max(max(max(rbt.vel.x,rbt.vel.y),rbt.vel.z))*100],'k--','linewidth',1.2)
    % plot([mdl.servo_drop_time, mdl.servo_drop_time],[-200,200],'k--','linewidth',1.2)
    title('z_b')
    % ylabel('cm/s')
    legend('x','y','z','Location','northwest')
    xlim([rbt.t.start, rbt.t.stop])
    % ylim([-0.7, 1.2])
    % ylim([min([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100])-5 max([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100; rbt.ref.pos.x.*100;rbt.ref.pos.y.*100;rbt.ref.pos.z.*100;])+5])
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [26, 13, 13, 10]); % [l b w h]
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

    figure(45)
    plot(rbt.ome.t, rbt.ome.x, 'r'); hold on; grid on;
    plot(rbt.ome.t, rbt.ome.y, 'g')
    % plot(rbt.ome.t, rbt.tor.z, 'b'); 
    % plot([t_start t_stop],[xt_error xt_error],'r--')
    % plot([t_start t_stop],[yt_error yt_error],'g--')
    % plot([t_start t_stop],[zt_error zt_error],'b--')
    plot([rbt.t.start, rbt.t.start],[-10, 10],'k--')
    plot([rbt.t.stop, rbt.t.stop],[-10, 10],'k--')
    title('omega')
    xlim([rbt.t.start, rbt.t.stop])
    %ylim([-1,1]*1e-5)
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
end


%% Euler angles
if ShowPlot.angle
    figure(41)
    if 0
        plot(rbt.EulXYZ.t, rad2deg(rbt.EulZYX.x), 'r'); hold on; grid on;
        plot(rbt.EulXYZ.t, rad2deg(rbt.EulZYX.y), 'g')
        plot(rbt.EulXYZ.t, rad2deg(rbt.EulZYX.z), 'b')
        ylabel('degree');
    else
        plot(rbt.EulXYZ.t, rbt.EulZYX.x, 'r'); hold on
        plot(rbt.EulXYZ.t, rbt.EulZYX.y, 'g')
        plot(rbt.EulXYZ.t, rbt.EulZYX.z, 'b')
        ylabel('radian');
    end
%     if som.en
%         % flipping angle
%         R13 = sin(rbt.EulXYZ.z);
%         R23 = -sin(rbt.EulXYZ.y).*cos(rbt.EulXYZ.z);
%         R33 = cos(rbt.EulXYZ.y).*cos(rbt.EulXYZ.z);
%         flp = atan2((R13.^2+R23.^2).^0.5, R33);
%         plot(rbt.EulXYZ.t, flp, 'c')
%         plot([rbt.EulXYZ.t(1) rbt.EulXYZ.t(end)],[pi,pi], 'b--')
%     end
%     plot([rbt.mdl.rt, rbt.mdl.rt],[-10, 10],'k--','linewidth',2)
    plot([rbt.t.start, rbt.t.start],[rad2deg(min(min(min(rbt.EulZYX.x,rbt.EulZYX.y),rbt.EulZYX.z))), rad2deg(max(max(max(rbt.EulZYX.x,rbt.EulZYX.y),rbt.EulZYX.z)))],'k--','linewidth',1)
    plot([rbt.t.stop, rbt.t.stop],[rad2deg(min(min(min(rbt.EulZYX.x,rbt.EulZYX.y),rbt.EulZYX.z))), rad2deg(max(max(max(rbt.EulZYX.x,rbt.EulZYX.y),rbt.EulZYX.z)))],'k--','linewidth',1)
    xlim([rbt.t.start, rbt.t.stop])
    ylim([-0.3 0.3])
    hold off
    title('euler angles ZYX')
%     ylim([-pi,pi])
    legend('x','y','z','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [26, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.625, 0.25, 0.35]); % [l b w h]        
    end
end


%% body frame error

% rotm_z = eul2rotm([ rbt.EulZYX.z zeros(length(rbt.EulZYX.z),2)], 'ZYX');
% 
% rbt.err.pos.x = [rbt.pos.x; rbt.pos.x(end)*ones(4,1)] - repelem(rbt.des.p.x,5);
% rbt.err.pos.y = [rbt.pos.y; rbt.pos.y(end)*ones(4,1)] - repelem(rbt.des.p.y,5);
% rbt.err.pos.z = zeros(length(repelem(rbt.des.p.y,5)),1);
% 
% rbt.err.pos.p = [rbt.err.pos.x rbt.err.pos.y rbt.err.pos.z];
% 
% for i = 1:length(rbt.err.pos.x)-5
%     rbt.err.pos_b.p(i,:) = (rotm_z(:,:,i)'*rbt.err.pos.p(i,:)')';
% end
% 
% figure
% plot(rbt.err.pos_b.p)

%%
% %% velocity filter debugging
% if 1
% 
%     rbt.vel2.x     = rst_p_dot2.signals.values(:,1);
%     rbt.vel2.y     = rst_p_dot2.signals.values(:,2);
%     rbt.vel2.z     = rst_p_dot2.signals.values(:,3);
% 
%     rbt.vel3.x     = rst_p_dot3.signals.values(:,1);
%     rbt.vel3.y     = rst_p_dot3.signals.values(:,2);
%     rbt.vel3.z     = rst_p_dot3.signals.values(:,3);
% 
%     rbt.data_ready = rst_vicon_data_ready.signals.values;
% 
%     figure(37)
%     % plot(rbt.ome.t, rbt.vel.x.*100, 'r','linewidth',1); 
%     % plot(rbt.time, rbt.vel.y.*100, 'g','linewidth',1)
%     plot(rbt.time, rbt.vel.z.*100, 'r','linewidth',0.8); hold on
%     plot(rbt.time, rbt.vel2.z.*100, 'g','linewidth',0.5); hold on
%     plot(rbt.time, rbt.vel3.z.*100, 'b','linewidth',0.5); hold on
%     plot(rbt.time, rbt.data_ready.*100, 'k','linewidth',0.5); hold on
% 
%     % plot([mdl.servo_drop_time, mdl.servo_drop_time],[min(min(min(rbt.vel.x,rbt.vel.y),rbt.vel.z))*100, max(max(max(rbt.vel.x,rbt.vel.y),rbt.vel.z))*100],'k--','linewidth',1.2)
%     plot([rbt.t.start, rbt.t.start],[-200,200],'k--','linewidth',1)
%     plot([rbt.t.stop, rbt.t.stop],[-200,200],'k--','linewidth',1)
%     title('velocity debug')
%     ylabel('cm/s')
%     legend('z1','z2','Location','northwest')
%     xlim([rbt.t.start, rbt.t.stop])
%     ylim([-300, 300])
%     % ylim([min([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100])-5 max([rbt.pos.x.*100; rbt.pos.y.*100; rbt.pos.z.*100; rbt.ref.pos.x.*100;rbt.ref.pos.y.*100;rbt.ref.pos.z.*100;])+5])
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
%     rbt.time      = rst_omega_b.time;
% 
% 
% 
%     rbt.ome.x     = rst_omega_b.signals.values(:,1);
%     rbt.ome.y     = rst_omega_b.signals.values(:,2);
%     rbt.ome.z     = rst_omega_b.signals.values(:,3);
% 
%     rbt.time1      = rst_omega_b1.time;
% 
%     rbt.ome1.x     = rst_omega_b1.signals(1).values(:,1);
%     rbt.ome1.y     = rst_omega_b1.signals(1).values(:,2);
%     rbt.ome1.z     = rst_omega_b1.signals(1).values(:,3);
% 
%     rbt.ome2.x     = rst_omega_b1.signals(2).values(:,1);
%     rbt.ome2.y     = rst_omega_b1.signals(2).values(:,2);
%     rbt.ome2.z     = rst_omega_b1.signals(2).values(:,3);
% 
%     figure(45)
%     plot(rbt.time, rbt.ome.x, 'r'); hold on; grid on;
%     % plot(rbt.time, rbt.ome.y, 'g--')
% 
%     % plot(rbt.time1, rbt.ome1.x, 'k'); 
%     plot(rbt.time1, rbt.ome2.x, 'b'); 
%     % plot(rbt.time1, rbt.ome1.y, 'g')
%     % plot(rbt.time, rbt.tor.z, 'b'); 
%     % plot([t_start t_stop],[xt_error xt_error],'r--')
%     % plot([t_start t_stop],[yt_error yt_error],'g--')
%     % plot([t_start t_stop],[zt_error zt_error],'b--')
%     % plot([rbt.t.start, rbt.t.start],[-10, 10],'k--')
%     % plot([rbt.t.stop, rbt.t.stop],[-10, 10],'k--')
%     title('omega')
%     % xlim([rbt.t.start, rbt.t.stop])
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
