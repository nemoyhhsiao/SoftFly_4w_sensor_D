% script to analyze_result

close all

%% switch for showing plot
ShowPlot.position       = 1;
ShowPlot.angle          = 1;
if rsim.en
    ShowPlot.driveSignal    = 0;
else
    ShowPlot.driveSignal    = 1;
end
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
ShowPlot.yawControl     = 0;
ShowPlot.yawControlPD   = 0;
ShowPlot.TorqueControlX = 0;
ShowPlot.TorqueControlY = 0;
ShowPlot.x_offset       = 0;
ShowPlot.y_offset       = 0;
ShowPlot.Tor2Ang        = 1;
ShowPlot.volt_comp      = 1;
ShowPlot.ThisScreen     = 0;
ShowPlot.NextScreen_4K  = 1;

%%
x        = Measurement(:,1);
y        = Measurement(:,2);
z        = Measurement(:,3);
r        = Measurement(:,1:3);
rot_x    = Measurement(:,4);
rot_y    = Measurement(:,5);
rot_z    = Measurement(:,6);
Tx       = Torque(:,1);
Ty       = Torque(:,2);
Tz       = Torque(:,3);
Force    = Torque(:,4);
int_Tx   = Torque(:,5);
int_Ty   = Torque(:,6);
int_Tz   = Torque(:,7);
int_F    = Torque(:,8);
r_dot    = Observer(:,1:3);
r_dotdot = Observer(:,4:6);
R1       = Observer(:,7:3:13);
R2       = Observer(:,8:3:14);
R3       = Observer(:,9:3:15);
wx       = Observer(:,19);
wy       = Observer(:,20);
wz       = Observer(:,21);
if size(Observer,2)>18
    x_af = Observer(:,19);
    y_af = Observer(:,20);
    z_af = Observer(:,21);
end
% Dr       = r-rd;
% Dr_dot   = r_dot-rd_d;
rd_dd    = zeros(length(z),3);
rd_ddd   = zeros(length(z),3);

DS_Time  = 0:mdl.T_high:Time(end);

if length(DS_Time) ~= length(DrivingSignals)
    DS_Time = 0:mdl.T_high:Time(end);
end

if 0
    DS_Time = 0:mdl.T_high:Time(end)+mdl.T_high;
end
%% Position
if ShowPlot.position
    figure(1)
    plot(Time, x.*100, 'r','linewidth',1.5); hold on
    plot(Time, y.*100, 'g','linewidth',1.5)
    plot(Time, z.*100, 'b','linewidth',1.5); 
    
    % UKF
    if 0
        plot(Time, x_af.*100, 'r--','linewidth',1.5); hold on
        plot(Time, y_af.*100, 'g--','linewidth',1.5)
        plot(Time, z_af.*100, 'b--','linewidth',1.5); 
    end
    
%     if 0 %ctr.rtmpc.en
%         plot(Time, rd_rtmpc(:,5).*100,'r--');
%         plot(Time, rd_rtmpc(:,6).*100,'g--');
%         plot(Time, rd_rtmpc(:,7).*100,'b--');
%     else
%         plot(Time, rd(:,1).*100,'r--');
%         plot(Time, rd(:,2).*100,'g--');
%         plot(Time, rd(:,3).*100,'b--');
%     end
%     plot(Time,  ctr.envelope.xmax.*ones(length(Time),1),'r--'); 
%     plot(Time, -ctr.envelope.xmax.*ones(length(Time),1),'r--'); 
%     plot(Time,  ctr.envelope.ymax.*ones(length(Time),1),'g--'); 
%     plot(Time, -ctr.envelope.ymax.*ones(length(Time),1),'g--'); 
%     plot(Time,  ctr.envelope.zmax.*ones(length(Time),1),'b--'); hold off
    plot([mdl.rt, mdl.rt],[min(min(min(x,y),z))*100, max(max(max(x,y),z))*100],'k--','linewidth',1.2)
    title('x y z position')
    ylabel('cm')
    legend('x','y','z','Location','northwest')
%     ylim([min([x.*100; y.*100; z.*100])-5 max([x.*100; y.*100; z.*100; rd(:,1).*100;rd(:,2).*100;rd(:,3).*100;])+5])
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

%% Plot torque in I frame
I_torque = zeros(length(Tx),3);
I_torque_inert = zeros(length(Tx),3);
I_thrust = zeros(length(Tx),3);
for i = 1:length(Tx)
    I_torque(i,:) = ([R1(i, :)', R2(i, :)', R3(i, :)']*[Tx(i); Ty(i); 0])';
    I_torque_inert(i,:) = ([R1(i, :)', R2(i, :)', R3(i, :)']*[Tx(i)/rbt.ixx; Ty(i)/rbt.iyy; 0])';
    I_thrust(i,:) = ([R1(i, :)', R2(i, :)', R3(i, :)']*[0.0; 0.0; Force(i)/rbt.m])';
end

figure()
plot(Time, I_torque)

figure()
plot(Time, I_torque_inert)

figure()
plot(Time, I_thrust)

%% Euler angles
if ShowPlot.angle
    figure(2)
    if 1
        plot(Time, rad2deg(rot_x), 'r'); hold on; grid on;
        plot(Time, rad2deg(rot_y), 'g')
        plot(Time, rad2deg(rot_z), 'b')
        ylabel('degree');
    else
        plot(Time, rot_x, 'r'); hold on
        plot(Time, rot_y, 'g')
        plot(Time, rot_z, 'b')
        ylabel('radian');
    end
    if som.en
        % flipping angle
        R13 = sin(rot_z);
        R23 = -sin(rot_y).*cos(rot_z);
        R33 = cos(rot_y).*cos(rot_z);
        flp = atan2((R13.^2+R23.^2).^0.5, R33);
        plot(Time, flp, 'c')
        plot([Time(1) Time(end)],[pi,pi], 'b--')
    end
    plot([mdl.rt, mdl.rt],[rad2deg(min(min(min(rot_x,rot_y),rot_z))), rad2deg(max(max(max(rot_x,rot_y),rot_z)))],'k--','linewidth',2)
    hold off
    title('euler angles')
%     ylim([-pi,pi])
    legend('pitch','roll', 'yaw','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 1, 13, 10]); % [l b w h]
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
    if exist('DS_Time')
        plot(DS_Time, 200*DrivingSignals(1:length(DS_Time),1), 'r');    hold on
        plot(DS_Time, 200*DrivingSignals(1:length(DS_Time),2), 'Color','#EDB120')
        plot(DS_Time, 200*DrivingSignals(1:length(DS_Time),3), 'b')
        plot(DS_Time, 200*DrivingSignals(1:length(DS_Time),4), 'g')
    else
        plot(Time, 200*DrivingSignals(:,1), 'r');    hold on
        plot(Time, 200*DrivingSignals(:,2), 'Color','#EDB120')
        plot(Time, 200*DrivingSignals(:,3), 'b')
        plot(Time, 200*DrivingSignals(:,4), 'g')
    end
    plot([0 Time(end)],[1600 1600],'k--')
    plot([0 Time(end)],[1700 1700],'r--')
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
    plot(Time, Voltage(:,1), 'r')
    hold on
    plot(Time, Voltage(:,2), 'Color','#EDB120')
    plot(Time, Voltage(:,3), 'b')
    plot(Time, Voltage(:,4), 'g')
    plot([0 Time(end)],[1600 1600],'k--')
    plot([0 Time(end)],[1700 1700],'r--')
    hold off
%     ylim([1300 max(mdl.max_v_vec)])
    ylim([1400 1800])
    xlim([mdl.i_delay-0.1 mdl.rt])
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
    t_start = 2.2;
    t_stop  = mdl.rt;
    if t_start > mdl.rt
        t_start = mdl.i_delay;
    end
    if t_stop > mdl.rt
        t_stop = mdl.rt;
    end
    xt_error = sum(Tx(t_start*mdl.f:t_stop*mdl.f))/(t_stop*mdl.f-t_start*mdl.f+1);
    yt_error = sum(Ty(t_start*mdl.f:t_stop*mdl.f))/(t_stop*mdl.f-t_start*mdl.f+1);
    zt_error = sum(Tz(t_start*mdl.f:t_stop*mdl.f))/(t_stop*mdl.f-t_start*mdl.f+1);
    figure(5)
    plot(Time, Tx, 'r'); hold on; grid on;
    plot(Time, Ty, 'g')
    plot(Time, Tz, 'b'); 
    plot([t_start t_stop],[xt_error xt_error],'r--')
    plot([t_start t_stop],[yt_error yt_error],'g--')
    plot([t_start t_stop],[zt_error zt_error],'b--')
    title('torque')
    xlim([mdl.i_delay mdl.rt])
    %ylim([-1,1]*1e-5)
    legend('x','y','z','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
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
    plot(Time, Force/rbt.m, 'm'); grid on; % in m/s^2
    title('force z')
    xlim([mdl.i_delay mdl.rt])
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

%% integral terms (torque)
if ShowPlot.iTorque
figure(7)
    plot(Time, int_Tx, 'r'); hold on
    plot(Time, int_Ty, 'g')
    plot(Time, int_Tz, 'b'); hold off
    title('torque, integral terms')
    ylim([-1,1]*1e-5)
    legend('x','y','z','Location','northwest')
end

%% intergral terms Z
if ShowPlot.iForceZ
    figure(8)
    plot(Time,int_F, 'b')
    title('thrust, integral terms')
end

%% Enable
if ShowPlot.en
    figure(9)
    plot(Time,En(:,1:6),'linewidth',2); hold on
    plot([mdl.rt, mdl.rt],[-0.2, 1.2],'k--','linewidth',2)
    title('Safety Enable')
    ylim([-0.2,1.2])
    legend('envolop','landing','z','lost','flip','voltage','Location','northwest')
%     set(gcf, 'Units', 'centimeters');
%     set(gcf, 'Position', [39, 1, 12, 10]); % [l b w h]
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.5, 0.2, 0.25, 0.35]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.7, -0.05, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end

%% integral comparison x
if ShowPlot.iCompareX
    figure(10)
    plot(Time,Tx,'linewidth',1); hold on
    plot(Time,int_Tx,'linewidth',1.5); hold off
    title('torque x comparison')
%     ylim([-0.2,1.2])
    legend('others','integral','Location','northwest')
    set(gcf, 'Units', 'centimeters');
    set(gcf, 'Position', [26, 13, 13, 10]); % [l b w h]  
end

%% integral comparison y
if ShowPlot.iCompareY
    figure(11)
    plot(Time,Ty,'linewidth',1); hold on
    plot(Time,int_Ty,'linewidth',1.5); hold off
    title('torque y comparison')
%     ylim([-0.2,1.2])
    legend('others','integral','Location','northwest')
    set(gcf, 'Units', 'centimeters');
    set(gcf, 'Position', [26, 1, 13, 10]); % [l b w h]  
end

%% integral comparison z
if ShowPlot.iCompareZ
    figure(12)
    plot(Time,Tz,'linewidth',1); hold on
    plot(Time,int_Tz,'linewidth',1.5); hold off
    title('torque z comparison')
%     ylim([-0.2,1.2])
    legend('others','integral','Location','northwest')
    set(gcf, 'Units', 'centimeters');
    set(gcf, 'Position', [39, 3, 12, 10]); % [l b w h]  
end

%% integral comparison Thrust
if ShowPlot.iCompareF
    figure(13)
    plot(Time,Force,'linewidth',1); hold on
    plot(Time,int_F,'linewidth',1.5); hold off
    title('thrust comparison')
%     ylim([-0.2,1.2])
    legend('others','integral','Location','northwest')
    set(gcf, 'Units', 'centimeters');
    set(gcf, 'Position', [39, 13, 12, 10]); % [l b w h]  
end

%% yaw angle
if ShowPlot.yawControl
    yaw_ratio = max(abs(rad2deg(rot_z)))/max(abs(Tz));
    figure(14)
    plot(Time,Tz*yaw_ratio,'linewidth',1); 
    hold on; grid on;
    plot(Time,rad2deg(rot_z),'linewidth',1.5); 
    plot(Time, rad2deg(YawPD(:,3)),'--');
%     plot([0 Time(end)],[0 0],'--'); 
    hold off
    title('yaw command')
%     ylim([-0.2,1.2])
%     legend('yaw angle','setpoint','Location','northwest')
    legend('torque norm','yaw angle','setpoint','Location','northwest')
    set(gcf, 'Units', 'centimeters');
    set(gcf, 'Position', [29, 3, 12, 10]); % [l b w h]  
    xlim([mdl.i_delay mdl.rt])
end

%% yaw PD
if ShowPlot.yawControlPD
    szYaw = size(YawPD);
    figure(15)
    plot(Time,Tz.*yaw_ratio,'linewidth',1); hold on; grid on;
    plot(Time,YawPD(:,1).*yaw_ratio);
    plot(Time,YawPD(:,2).*yaw_ratio);
    if szYaw(2) >= 5
        plot(Time,YawPD(:,5).*yaw_ratio);
    end
    if szYaw(2) >= 6
        plot(Time,YawPD(:,6).*yaw_ratio);
    end
    plot(Time,rad2deg(rot_z),'linewidth',1.5); 
    plot(Time, rad2deg(YawPD(:,3)),'--');
%     plot([0 Time(end)],[0 0],'--'); 
    hold off
    title('yaw PD command')
%     ylim([-100,100])
    if szYaw(2) == 5
        legend('torque norm','P','D','I','yaw angle','setpoint','Location','northwest')
    elseif szYaw(2) == 6
        legend('torque norm','P','D','I','forward','yaw angle','setpoint','Location','northwest')
    else
        legend('torque norm','P','D','yaw angle','setpoint','Location','northwest')
    end
    set(gcf, 'Units', 'centimeters');
    set(gcf, 'Position', [35, 3, 12, 10]); % [l b w h]  
    xlim([mdl.i_delay mdl.rt])
end

%% yaw PD actual magnitude
if ShowPlot.yawControlPD
    szYaw = size(YawPD);
    figure(22)
    plot(Time,Tz,'linewidth',1); hold on; grid on;
    plot(Time,YawPD(:,1));
    plot(Time,YawPD(:,2));
    if szYaw(2) >= 5
        plot(Time,YawPD(:,5));
    end
    if szYaw(2) >= 6
        plot(Time,YawPD(:,6));
    end

    hold off
    title('yaw PD command')
    if szYaw(2) == 5
        legend('torque','P','D','I','Location','northwest')
    elseif szYaw(2) == 6
        legend('torque','P','D','I','forward','Location','northwest')
    else
        legend('torque','P','D','Location','northwest')
    end
    set(gcf, 'Units', 'centimeters');
    set(gcf, 'Position', [35, 3, 12, 10]); % [l b w h]  
    xlim([mdl.i_delay mdl.rt])
end

%% torque x control gain comparison
if ShowPlot.TorqueControlX
    catx3 = -ctr.gain.at3*( (mdl.g*wx)'+dot(R2',rd_ddd') );
    catx2 = -ctr.gain.at2*( dot(R2',(mdl.g*[zeros(length(x),2),ones(length(x),1)]+rd_dd)') );
    catx1 = ctr.gain.at1*( dot(R2',Dr_dot') );
    catx0 = ctr.gain.at0*dot(R2',Dr');
    figure(16)
    plot(Time,catx0,'linewidth',1); hold on; grid on;
    plot(Time,catx1,'linewidth',1);
    plot(Time,catx2,'linewidth',1);
    plot(Time,catx3,'linewidth',1); 
    plot(Time,catx3+catx2+catx1+catx0,'linewidth',1); hold off
    title('torque x control gains')
    % ylim([-100,100])
    legend('at0','at1','at2','at3','Total','Location','northwest')
%     set(gcf, 'Units', 'centimeters');
%     set(gcf, 'Position', [26, 13, 13, 10]); % [l b w h]  
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.5, 1.05, 0.25, 0.35]); % [l b w h]
    xlim([mdl.i_delay mdl.rt])
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.7, 0.95, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end

%% torque y control gain comparison
if ShowPlot.TorqueControlY
    caty3 = ctr.gain.at3*( (mdl.g*wy)'-dot(R1',rd_ddd') );
    caty2 = -ctr.gain.at2*( dot(R1',-(mdl.g*[zeros(length(x),2),ones(length(x),1)]+rd_dd)') );
    caty1 = -ctr.gain.at1*( dot(R1',Dr_dot') );
    caty0 = -ctr.gain.at0*dot(R1',Dr');
    figure(17)
    plot(Time,caty0,'linewidth',1); hold on; grid on;
    plot(Time,caty1,'linewidth',1);
    plot(Time,caty2,'linewidth',1);
    plot(Time,caty3,'linewidth',1); 
    plot(Time,caty3+caty2+caty1+caty0,'linewidth',1); hold off
    title('torque y control gains')
    % ylim([-100,100])
    legend('at0','at1','at2','at3','Total','Location','northwest')
%     set(gcf, 'Units', 'centimeters');
%     set(gcf, 'Position', [39, 13, 13, 10]); % [l b w h]  
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.5, 0.625, 0.25, 0.35]); % [l b w h]
    xlim([mdl.i_delay mdl.rt])
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.7, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end

%% 
if ShowPlot.x_offset
    figure(18)
    subplot(4,1,1)
    plot(Time, x.*100, 'linewidth',1); grid on; hold on
    plot(Time, rd(:,1).*100, '--')
    xlim([mdl.i_delay mdl.rt])
    title('x position')
    subplot(4,1,2)
    plot(Time, r_dotdot(:,1), 'linewidth',1); hold on; grid on
    plot([0 Time(end)],[0 0],'--'); 
    xlim([mdl.i_delay mdl.rt])
    title('x acceleration')
    subplot(4,1,3)
    plot(Time, rad2deg(rot_y), 'linewidth',1); grid on; hold on
    plot([0 Time(end)],[0 0],'--'); 
    xlim([mdl.i_delay mdl.rt])
    title('roll angle')
    subplot(4,1,4)
    plot(Time, Ty, 'linewidth',1); grid on
    xlim([mdl.i_delay mdl.rt])
    title('torque y')
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.75, 0.83, 0.3, 0.57]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [2.05, 0.5, 0.5, 0.9]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end

%%
if ShowPlot.y_offset
    figure(19)
    subplot(4,1,1)
    plot(Time, y.*100, 'linewidth',1); grid on; hold on
    plot(Time, rd(:,2).*100, '--')
    xlim([mdl.i_delay mdl.rt])
    title('y position')
    subplot(4,1,2)
    plot(Time, r_dotdot(:,2), 'linewidth',1); hold on; grid on
    plot([0 Time(end)],[0 0],'--'); 
    xlim([mdl.i_delay mdl.rt])
    title('y acceleration')
    subplot(4,1,3)
    plot(Time, rad2deg(rot_x), 'linewidth',1); grid on; hold on
    plot([0 Time(end)],[0 0],'--'); 
    xlim([mdl.i_delay mdl.rt])
    title('pitch angle')
    subplot(4,1,4)
    plot(Time, Tx, 'linewidth',1); grid on
    xlim([mdl.i_delay mdl.rt])
    title('torque x')
    hold off
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [1.75, 0.2, 0.3, 0.57]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [2.05, -0.45, 0.5, 0.9]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end

%% voltage composition
if ShowPlot.volt_comp
    figure(20)
    for i=1:4
        subplot(4,1,i)
        if rbt.til == 0
            plot(Time, rbt.Apinv(i,1)*(Force-rbt.m*mdl.g)*rbt.VM_input1(1),'k'); hold on
            plot(Time, rbt.Apinv(i,2)*Torque(:,1)*rbt.VM_input1(1),'r'); 
            plot(Time, rbt.Apinv(i,3)*Torque(:,2)*rbt.VM_input1(1),'g');
            
        else
            plot(Time, rbt.Apinv(i,1)*(Force-rbt.m*mdl.g)*rbt.VM_input1(1)); hold on
            plot(Time, rbt.A2inv(i,2)*Torque(:,1)*rbt.VM_input1(1));
            plot(Time, rbt.A2inv(i,3)*Torque(:,2)*rbt.VM_input1(1));
            plot(Time, rbt.A2inv(i,4)*Torque(:,3)*rbt.VM_input1(1));
        end
        hold off
        xlim([mdl.i_delay mdl.rt])
        ylabel("Voltage (V)'")
        title(['voltage ' num2str(i) ' composition'])
        grid on
    end
    legend('Thrust','T_x','T_y','T_z','Location','northwest')
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [2.05, 0.2, 0.29, 0.57]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [2.55, 0.5, 0.45, 0.9]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
end

%% torque to angular accelaration 
if ShowPlot.Tor2Ang
figure(21)
    t_start = mdl.i_delay;
    t_stop  = mdl.rt;
    subplot(3,1,1)
    ax        = diff(wx)/mdl.T;
    Tx_offset = mean(Tx(t_start*mdl.f+0.1*mdl.f:t_stop*mdl.f)./rbt.ixx);
    plot(Time(1:end-1), ax,'Color','#EDB120'); hold on
    plot(Time, Tx./rbt.ixx,'Color','#7E2F8E')
    plot(Time, Tx./rbt.ixx - Tx_offset,'Color',[0.3 0.3 0.3])
    legend('angular acce', 'torque','Location','northwest')
    ylim([min(min(ax(t_start*mdl.f:t_stop*mdl.f)),min(Tx(t_start*mdl.f:t_stop*mdl.f)./rbt.ixx)) max(max(ax(t_start*mdl.f:t_stop*mdl.f)),max(Tx(t_start*mdl.f:t_stop*mdl.f)./rbt.ixx))])
    xlim([mdl.i_delay mdl.rt])
    hold off

    subplot(3,1,2)
    ay      = diff(wy)/mdl.T;
    Ty_offset = mean(Ty(t_start*mdl.f+0.1*mdl.f:t_stop*mdl.f)./rbt.iyy);
    plot(Time(1:end-1), ay,'Color','#EDB120'); hold on
    plot(Time, Ty./rbt.iyy,'Color','#7E2F8E')
    plot(Time, Ty./rbt.iyy - Ty_offset,'Color',[0.3 0.3 0.3])
    legend('angular acce', 'torque','Location','northwest')
    ylim([min(min(ay(t_start*mdl.f:t_stop*mdl.f)),min(Ty(t_start*mdl.f:t_stop*mdl.f)./rbt.iyy)) max(max(ay(t_start*mdl.f:t_stop*mdl.f)),max(Ty(t_start*mdl.f:t_stop*mdl.f)./rbt.iyy))])
    xlim([mdl.i_delay mdl.rt])
    hold off

    subplot(3,1,3)
    az      = diff(wz)/mdl.T;
    plot(Time(1:end-1), az,'Color','#EDB120'); hold on
    plot(Time, Tz./rbt.izz,'Color','#7E2F8E')
    legend('angular acce', 'torque','Location','northwest')
    ylim([min(min(az(t_start*mdl.f:t_stop*mdl.f)),min(Tz(t_start*mdl.f:t_stop*mdl.f)./rbt.izz)) max(max(az(t_start*mdl.f:t_stop*mdl.f)),max(Tz(t_start*mdl.f:t_stop*mdl.f)./rbt.izz))])
    xlim([mdl.i_delay mdl.rt])
    hold off
    
%     set(gcf, 'Units', 'normalized');
%     set(gcf, 'Position', [2.05, 0.83, 0.29, 0.57]); % [l b w h]
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [0, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [2.55, -0.45, 0.45, 0.9]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1.25, 0.625, 0.25, 0.35]); % [l b w h]
    end
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

%%
if 1

R = zeros(3,3,length(R1));

for i = 1:length(R1)
    R(:,1,i) = R1(i,:)';
    R(:,2,i) = R2(i,:)';
    R(:,3,i) = R3(i,:)';
end

eul = rotm2eul(R);
rot1_z = eul(:,1);
rot1_y = eul(:,2);
rot1_x = eul(:,3);

figure(46)
plot(rad2deg(rot1_x),'r'); hold on
plot(rad2deg(rot1_y),'g')
plot(rad2deg(rot1_z),'b'); hold off

end


if 0 

figure(31)


subplot(3,1,1)
plot(Time, rad2deg(rd_rtmpc(:,1))); hold on
plot(Time, rad2deg(rot1_x));
plot(Time, zeros(length(Time),1),'k--'); hold off
xlim([2 mdl.rt])
legend('command', 'rot_x')

subplot(3,1,2)
plot(Time, rad2deg(rd_rtmpc(:,2))); hold on
plot(Time, rad2deg(rot1_y));
plot(Time, zeros(length(Time),1),'k--'); hold off
xlim([2 mdl.rt])
legend('command', 'rot_y')

subplot(3,1,3)
plot(Time, rd_rtmpc(:,4)); hold on
plot(Time, ones(length(Time),1)*9.81,'k--');
xlim([2 mdl.rt])
end

%%

% figure(32)
% subplot(2,1,1)
% yyaxis left
% plot(Time, rd_rtmpc(:,14)); hold on
% plot(Time, zeros(length(Time),1),'k--');
% ylabel('torque x')
% 
% yyaxis right
% plot(Time, rad2deg(rot_x));
% xlim([2 mdl.rt])
% ylabel('pitch angle')
% 
% subplot(2,1,2)
% yyaxis left
% plot(Time, rd_rtmpc(:,15)); hold on
% % plot(Time, rad2deg(rot_y));
% ylabel('torque y')
% 
% plot(Time, zeros(length(Time),1),'k--');
% yyaxis right
% plot(Time, rad2deg(rot_y));
% ylabel('roll angle')
% xlim([2 mdl.rt])

%%
if 0
figure(34)
plot(Time, rd_rtmpc(:,20)); hold on
plot(Time, rd_rtmpc(:,21)); 
plot(Time, rd_rtmpc(:,22)); 
plot(Time, rd_rtmpc(:,23)); 
title('Estimated external torque')
legend('x','y','x','y')

%%
figure(35)
plot(Time, rd_rtmpc(:,14)); hold on
plot(Time, rd_rtmpc(:,15)); 
plot(Time, rd_rtmpc(:,16)); 
title('commanded torque')

%%
figure(36)
plot(Time, rd_rtmpc(:,17)); hold on
plot(Time, rd_rtmpc(:,18)); 
plot(Time, rd_rtmpc(:,19)); 
title('commanded omega')

%%
figure(37)
subplot(2,1,1)
% yyaxis left
plot(Time, rd_rtmpc(:,17)); hold on

% yyaxis right
plot(Time, wx)
xlim([mdl.i_delay mdl.rt])

legend('commanded \omega_x','\omega_x')

subplot(2,1,2)
% yyaxis left
plot(Time, rd_rtmpc(:,18)); hold on

% yyaxis right
plot(Time, wy)
xlim([mdl.i_delay mdl.rt])

legend('commanded \omega_y','\omega_y')
end
%%
% figure(38)
% subplot(3,1,1)
% plot(Time(1:end-1), diff(x)./1e-3); hold on
% plot(Time, r_dot(:,1), 'r'); hold off
% 
% title('translational velocity')
% 
% subplot(3,1,2)
% plot(Time(1:end-1), diff(y)./1e-3); hold on
% plot(Time, r_dot(:,2), 'g'); hold off
% 
% subplot(3,1,3)
% plot(Time(1:end-1), diff(z)./1e-3); hold on
% plot(Time, r_dot(:,3), 'b'); hold off

%%

% q = quaternion(rad2deg([rot_x, rot_y, rot_z]),'eulerd','XYZ','frame');
% dt = 1/1000;
% av = angvel(q,dt,'frame'); % units in rad/s
% %%
% figure(45)
% subplot(3,1,1)
% plot(Time, av(:,1)); hold on
% plot(Time, wx,'r'); hold off
% 
% title('angular velocity')
% 
% subplot(3,1,2)
% plot(Time, av(:,2)); hold on
% plot(Time, wy,'g'); hold off
% 
% subplot(3,1,3)
% plot(Time, av(:,3)); hold on
% plot(Time, wz,'b'); hold off

%%
figure(48)

plot(Time, UKF_log.UKF_state(:,14:16)./(rbt.m))
title('UKF estimated external forces')
ylabel('m/s^2')
%%
figure(49)
plot(Time, UKF_log.UKF_state(:,17:19))
title('UKF estimated external torques')
ylabel('N m')

%%
figure(50)
plot(Time, UKF_log.UKF_state(:,1:3).*100); hold on
plot(Time, UKF_log.UKF_state_pred(:,1:3).*100)
title('UKF estimated/predicted position')
legend('estimated x', 'estimated y','estimated z','predicted x','predicted y','predicted z')
ylabel('cm')
hold off

%%
figure(51)
plot(Time, UKF_log.UKF_state(:,8:10).*100); hold on
plot(Time, UKF_log.UKF_state_pred(:,8:10).*100)
title('UKF estimated/predicted velocity')
legend('estimated Vx', 'estimated Vy','estimated Vz','predicted Vx','predicted Vy','predicted Vz')
ylabel('cm/s')
hold off
% 
% 
% %%
% % figure(52)
% % plot(Time, log_x_in_nn(:,1:3)); hold on
% % 
% % figure(53)
% % plot(Time, log_x_in_nn(:,4:6)); hold on
% % figure(54)
% % plot(Time, log_x_in_nn(:,7:10)); hold on
% % figure(55)
% % plot(Time, log_x_in_nn(:,11:13)); hold on
% % 
% % figure(56)
% % plot(Time, log_x_in_nn(:,14:17)); hold on
% %%
% % figure(46)
% % 
% % R = zeros(3,3,length(R1));
% % 
% % for i = 1:length(R1)
% %     R(:,1,i) = R1(i,:)';
% %     R(:,2,i) = R2(i,:)';
% %     R(:,3,i) = R3(i,:)';
% % end
% % 
% % 
% % Euler = rotm2eul(R);
% 
% %%
% % UKF_state(:,4:7)UKF_state_pred
% UKF_Euler      = quat2eul(UKF_log.UKF_state(:,4:7),'XYZ');
% UKF_Euler_pred = quat2eul(UKF_log.UKF_state_pred(:,4:7),'XYZ');
% 
% figure(53)
% plot(Time, rad2deg(UKF_Euler)); hold on
% plot(Time, rad2deg(UKF_Euler_pred))
% title('UKF estimated/predicted Euler angles')
% legend('estimated x', 'estimated y','estimated z','predicted x','predicted y','predicted z')
% ylabel('degree')
% hold off

%% Attitude commands
figure(36)
plot(Time, NMPC_log.cmd_vel); hold on
plot(Time, Observer(:,19:21)); 
legend
hold off

%%
figure(55)
plot(Time, NMPC_log.F_ext); 
title("estimated external force")

%%
figure(56)
plot(Time, NMPC_log.tau_ext); 
title("estimated external torque")

%% 
figure(57)
temp = logsout.LiveStreamSignals.getElement('mahalnobis_distance').Values.Data;
plot(temp)
%% torque offset calculation

% t_start = 2.1;
% t_stop  = 2.3;
% 
% xt_error = sum(Tx(t_start*mdl.f:t_stop*mdl.f))/(t_stop*mdl.f-t_start*mdl.f+1)
% yt_error = sum(Ty(t_start*mdl.f:t_stop*mdl.f))/(t_stop*mdl.f-t_start*mdl.f+1)
% zt_error = sum(Tz(t_start*mdl.f:t_stop*mdl.f))/(t_stop*mdl.f-t_start*mdl.f+1)
% 
% Softfly
%% position error calculation

% id_start = 40001;
% id_stop  = 100000;
% 
% x_error_sum = sum(abs(x(id_start:id_stop)))
% y_error_sum = sum(abs(y(id_start:id_stop)))
% z_error_sum = sum(abs(z(id_start:id_stop)))
% xy_error_sum = x_error_sum + y_error_sum % 237
% 
% yaw_error_sum = sum(abs(rot_z(id_start:id_stop)))

t0 = 2001;
tf = 2800;
figure(100) % position on x and attitude
plot(y(t0:tf).*100, z(t0:tf).*100, 'r','linewidth',1.5); hold on; 
axis equal
xlim([-7, 2]);
ylim([12,15]);
h_axis = 2;
xlabel("pos. y (cm)");
ylabel("pos. z (cm)");
for i = [t0:100:tf]
    p0 = Measurement(i,1:3)*100;
    R = pakpongs_euler_to_rotm(Measurement(i,4:6));
    arrow_scale = 1.0;
    pf = R*[0; 0; 1]*arrow_scale;
    quiver(p0(h_axis), p0(3), pf(h_axis), pf(3), 'LineWidth',1.5, 'Color', 'b'); hold on;
   
    t = Time(i) - 2.0;
    txt = append('t = ', string(t), 's');
    if t < 0.6
        text(p0(h_axis),p0(3)-0.2,txt,'HorizontalAlignment','right')
    end
end

figure(101)
subplot(3,1,1)
plot(Time(t0:tf), NMPC_log.cmd_vel(t0:tf, 1)); hold on
plot(Time(t0:tf), Observer(t0:tf, 19)); 
legend('commanded', 'actual');
title('Angular Velocity - Roll Axis');
xlabel('Time (s)');
ylabel('Ang. Vel (rad/s)')

% figure(102)
subplot(3,1,2)
plot(Time(t0:tf), rad2deg(rot1_x(t0:tf)) - 90,'r'); hold on
title('Attitude - Roll Axis');
xlabel("Time (s)")
ylabel("Roll Angle (deg)")

% figure(103)
subplot(3,1,3)
plot(Time(t0:tf), UKF_log.UKF_state(t0:tf,9).*100); hold on
% plot(Time, UKF_log.UKF_state_pred(:,9).*100)
title('Velocity - y axis');
xlabel("Time (s)")
ylabel("Velocity (cm/s)")

% acceleration
% figure(103)
% d = designfilt("lowpassfir", ...
%     PassbandFrequency=0.15,StopbandFrequency=0.2, ...
%     PassbandRipple=1,StopbandAttenuation=60, ...
%     DesignMethod="equiripple");
% acc = diff(UKF_log.UKF_state(t0:tf,9));
% acc_lp = filtfilt(d,acc);
% plot(Time(t0:tf-1), acc_lp*1000); hold on
% % plot(Time, UKF_log.UKF_state_pred(:,9).*100)
% title('Acceleration - y axis');
% xlabel("Time (s)")
% ylabel("Acceleration (m/s^2)");