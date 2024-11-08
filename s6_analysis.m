%% script to analyze_result

close all

%% switch for showing plot
ShowPlot.position       = 1;
ShowPlot.angle          = 1;
ShowPlot.driveSignal    = 1;
ShowPlot.voltage        = 1;
ShowPlot.torque         = 1;
ShowPlot.forceZ         = 1;
ShowPlot.iTorque        = 1;
ShowPlot.iForceZ        = 1;
ShowPlot.en             = 1;
ShowPlot.iCompareX      = 0;
ShowPlot.iCompareY      = 0;
ShowPlot.iCompareZ      = 0;
ShowPlot.iCompareF      = 0;
ShowPlot.yawControl     = 1;
ShowPlot.yawControlPD   = 1;
ShowPlot.TorqueControlX = 1;
ShowPlot.TorqueControlY = 0;
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
ShowPlot.realtime3D     = 0;
ShowPlot.angle_comp     = 1;

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

rst.pdesp.t    = rst_p_vs_p_des.time;
rst.pdesp.x    = rst_p_vs_p_des.signals(1).values(:,1);
rst.pdesp.y    = rst_p_vs_p_des.signals(1).values(:,2);
rst.pdesp.z    = rst_p_vs_p_des.signals(1).values(:,3);
rst.pdesp.desx = rst_p_vs_p_des.signals(2).values(:,1);
rst.pdesp.desy = rst_p_vs_p_des.signals(2).values(:,2);
rst.pdesp.desz = rst_p_vs_p_des.signals(2).values(:,3);

rst.EulXYZ.t  = rst_Eul_XYZ.time;
rst.EulXYZ.x  = rst_Eul_XYZ.signals.values(:,1);
rst.EulXYZ.y  = rst_Eul_XYZ.signals.values(:,2);
rst.EulXYZ.z  = rst_Eul_XYZ.signals.values(:,3);

% Sensor Euler angle XYZ
% rst.SenEulXYZ.x  = rst_sensor_EulXYZ.signals.values(:,1);
% rst.SenEulXYZ.y  = rst_sensor_EulXYZ.signals.values(:,2);
% rst.SenEulXYZ.z  = rst_sensor_EulXYZ.signals.values(:,3);

rst.rotm = eul2rotm([rst.EulXYZ.x, rst.EulXYZ.y , rst.EulXYZ.z], 'XYZ');
rst.rot.R = rst.rotm;
rst.rot.R1 = rst.rot.R(:,1,:);
rst.rot.R2 = rst.rot.R(:,2,:);
rst.rot.R3 = rst.rot.R(:,3,:);

rst.EulZYX.t  = rst_Eul_XYZ.time;
rst.EulZYX.zyx = rotm2eul(rst.rotm, 'ZYX');
rst.EulZYX.z = rst.EulZYX.zyx(:,1);
rst.EulZYX.y = rst.EulZYX.zyx(:,2);
rst.EulZYX.x = rst.EulZYX.zyx(:,3);

rst.EulZXY.t  = rst_Eul_XYZ.time;
rst.EulZXY.zxy = rotm2eul(rst.rotm, 'ZXY');
rst.EulZXY.z = rst.EulZXY.zxy(:,1);
rst.EulZXY.y = rst.EulZXY.zxy(:,3);
rst.EulZXY.x = rst.EulZXY.zxy(:,2);

rst.ome.t     = rst_omega_b.time;
rst.ome.x     = rst_omega_b.signals(2).values(:,1);
rst.ome.y     = rst_omega_b.signals(2).values(:,2);
rst.ome.z     = rst_omega_b.signals(2).values(:,3);

rst.ome.t     = rst_omega_b.time;
rst.ome.raw_x = rst_omega_b.signals(1).values(:,1);
rst.ome.raw_y = rst_omega_b.signals(1).values(:,2);
rst.ome.raw_z = rst_omega_b.signals(1).values(:,3);

rst.tor.x     = rst_torque_b.signals(1).values(:,1); %.*9.8e-6;
rst.tor.y     = rst_torque_b.signals(2).values(:,1); %.*9.8e-6;
rst.tor.z     = rst_torque_b.signals(3).values(:,1); %.*9.8e-6;

rst.thrust    = rst_thrust_b.signals.values;

rst.vot.v1    = rst_voltages.signals.values(:,1);
rst.vot.v2    = rst_voltages.signals.values(:,2);
rst.vot.v3    = rst_voltages.signals.values(:,3);
rst.vot.v4    = rst_voltages.signals.values(:,4);

rst.itorq.t   = rst_int_torque.time;
rst.itorq.x   = rst_int_torque.signals.values(:,1);
rst.itorq.y   = rst_int_torque.signals.values(:,2);
rst.itorq.z   = rst_int_torque.signals.values(:,3);

rst.ithr.t    = rst_int_thrust.time;
rst.ithr.thr  = rst_int_thrust.signals.values(:,1);

rst.en.t      = rst_en.time;
rst.en.en     = rst_en.signals.values;

rst.drs.t     = rst_driving_signals.time;
rst.drs.s1    = rst_driving_signals.signals.values(:,1);
rst.drs.s2    = rst_driving_signals.signals.values(:,2);
rst.drs.s3    = rst_driving_signals.signals.values(:,3);
rst.drs.s4    = rst_driving_signals.signals.values(:,4);

rst.ext.tor.x = rst_ext_torque_b.signals.values(:,1);
rst.ext.tor.y = rst_ext_torque_b.signals.values(:,2);

rst.ast.t      = rst_all_states.time;
rst.ast.pos    = rst_all_states.signals(1).values;
rst.ast.vel    = rst_all_states.signals(2).values;
rst.ast.ome    = rst_all_states.signals(4).values;
rst.ast.posx  = rst_all_states.signals(1).values(:,1);
rst.ast.posy  = rst_all_states.signals(1).values(:,2);
rst.ast.posz  = rst_all_states.signals(1).values(:,3);
rst.ast.velx  = rst_all_states.signals(2).values(:,1);
rst.ast.vely  = rst_all_states.signals(2).values(:,2);
rst.ast.velz  = rst_all_states.signals(2).values(:,3);
rst.ast.rot.R  = rst_all_states.signals(3).values;
rst.ast.rot.R1 = reshape(rst.ast.rot.R(:,1,:),[3,size(rst.ast.rot.R,3)]);
rst.ast.rot.R2 = reshape(rst.ast.rot.R(:,2,:),[3,size(rst.ast.rot.R,3)]);
rst.ast.rot.R3 = reshape(rst.ast.rot.R(:,3,:),[3,size(rst.ast.rot.R,3)]);
rst.ast.omex  = rst_all_states.signals(4).values(:,1);
rst.ast.omey  = rst_all_states.signals(4).values(:,2);
rst.ast.omez  = rst_all_states.signals(4).values(:,3);

if som.en
    rst.som.state.t = rst_som_state.time;
    rst.som.state.s = rst_som_state.signals(1).values;
end

rst.rbt       = rbt2;
rst.ctr       = ctr2;
rst.mdl       = mdl;

rst.t.id      = find(rst.vot.v3>0);
rst.t.start   = rst.time(rst.t.id(1));
rst.t.stop    = rst.time(rst.t.id(end));

rst.t_h.log1  = rst.pos.t >= (rst.t.start); 
rst.t_h.log2  = rst.pos.t < (rst.t.stop); 
rst.t_h.log3  = rst.pos.t > 45;
rst.t_h.log4  = rst.pos.t < 43;
rst.t_h.logic = (rst.t_h.log1 == rst.t_h.log2) == ~(rst.t_h.log3 == rst.t_h.log4);
rst.t_h.id    = find(rst.t_h.logic);

addpath("function");
c = get_color;

%% Position
if ShowPlot.position
    f = figure(1); 
    f.Name = 'Positions';

    plot(rst.pdesp.t, rst.pdesp.desx.*100,'--','linewidth',1, 'Color', c.blue); hold on
    plot(rst.pdesp.t, rst.pdesp.desy.*100,'--','linewidth',1,'Color', c.red)
    plot(rst.pdesp.t, rst.pdesp.desz.*100,'--','linewidth',1, 'Color', c.yellow); 

    plot(rst.pdesp.t, rst.pdesp.x.*100, 'linewidth',1, 'Color', c.blue);
    plot(rst.pdesp.t, rst.pdesp.y.*100, 'linewidth',1,'Color', c.red)
    plot(rst.pdesp.t, rst.pdesp.z.*100, 'linewidth',1, 'Color', c.yellow); 
    
    % plot(rst.pos.t, rst.pos.x.*100, 'linewidth',1); hold on
    % plot(rst.pos.t, rst.pos.y.*100, 'linewidth',1)
    % plot(rst.pos.t, rst.pos.z.*100, 'linewidth',1); 

    % get error
    % rst.pos.flight.x   = rst.pos.x(rst.t_h.id);
    % rst.pos.flight.y   = rst.pos.y(rst.t_h.id);
    % rst.pos.flight.z   = rst.pos.z(rst.t_h.id);
    % rst.pos.flight.lat = [rst.pos.flight.x, rst.pos.flight.y];
    % 
    % rst.pos.flight.setpoint.x = ones(length(rst.pos.flight.x),1)*ctr.setpoint.x;
    % rst.pos.flight.setpoint.y = ones(length(rst.pos.flight.y),1)*ctr.setpoint.y;
    % rst.pos.flight.setpoint.z = ones(length(rst.pos.flight.z),1)*ctr.setpoint.z;
    % rst.pos.flight.setpoint.lat = [rst.pos.flight.setpoint.x, ...
    %                                rst.pos.flight.setpoint.y];

    rst.pos.flight.x   = rst.pdesp.x(rst.t.id);
    rst.pos.flight.y   = rst.pdesp.y(rst.t.id);
    rst.pos.flight.z   = rst.pdesp.z(rst.t.id);
    rst.pos.flight.lat = [rst.pos.flight.x, rst.pos.flight.y];

    rst.pos.flight.setpoint.x = rst.pdesp.desx(rst.t.id); 
    rst.pos.flight.setpoint.y = rst.pdesp.desy(rst.t.id); 
    rst.pos.flight.setpoint.z = rst.pdesp.desz(rst.t.id); 
    rst.pos.flight.setpoint.lat = [rst.pos.flight.setpoint.x, ...
                                   rst.pos.flight.setpoint.y];

    error_x   = rmse(rst.pos.flight.x,rst.pos.flight.setpoint.x)
    error_y   = rmse(rst.pos.flight.y,rst.pos.flight.setpoint.y)
    error_z   = rmse(rst.pos.flight.z,rst.pos.flight.setpoint.z)
    error_lat = rmse(rst.pos.flight.lat,rst.pos.flight.setpoint.lat,2);
    error_lat2 = sqrt(mean((sqrt((rst.pos.flight.x-rst.pos.flight.setpoint.x).^2 + (rst.pos.flight.y-rst.pos.flight.setpoint.y).^2)).^2))

%     plot(rst.pos.t,  ctr.envelope.xmax.*ones(length(rst.pos.t),1),'r--'); 
%     plot(rst.pos.t, -ctr.envelope.xmax.*ones(length(rst.pos.t),1),'r--'); 
%     plot(rst.pos.t,  ctr.envelope.ymax.*ones(length(rst.pos.t),1),'g--'); 
%     plot(rst.pos.t, -ctr.envelope.ymax.*ones(length(rst.pos.t),1),'g--'); 
%     plot(rst.pos.t,  ctr.envelope.zmax.*ones(length(rst.pos.t),1),'b--'); hold off
    plot([rst.t.start, rst.t.start],[min(min([rst.pos.x,rst.pos.y,rst.pos.z]))*100, max(max([rst.pos.x,rst.pos.y,rst.pos.z]))*100],'k--','linewidth',1.2)
    plot([rst.t.stop, rst.t.stop],[min(min([rst.pos.x,rst.pos.y,rst.pos.z]))*100, max(max([rst.pos.x,rst.pos.y,rst.pos.z]))*100],'k--','linewidth',1.2)
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
    f = figure(2); 
    f.Name = 'Euler angles XYZ';

    % Vicon data
    plot(rst.EulXYZ.t, rad2deg(rst.EulXYZ.x),'-','linewidth',1.5, 'Color', c.blue); hold on; grid on;
    plot(rst.EulXYZ.t, rad2deg(rst.EulXYZ.y),'-','linewidth',1.5, 'Color', c.red)
    plot(rst.EulXYZ.t, rad2deg(rst.EulXYZ.z),'-','linewidth',1.5, 'Color', c.yellow)
    ylabel('degree');

    % Sensor data
    % plot(rst.EulXYZ.t, rad2deg(rst.SenEulXYZ.x),'linewidth',1, 'Color', c.blue); hold on; grid on;
    % plot(rst.EulXYZ.t, rad2deg(rst.SenEulXYZ.y),'linewidth',1, 'Color', c.red)
    % plot(rst.EulXYZ.t, rad2deg(rst.SenEulXYZ.z),'linewidth',1, 'Color', c.yellow)
    % ylabel('degree');

    plot([rst.t.start, rst.t.start],[rad2deg(min(min(min(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z))), rad2deg(max(max(max(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z)))],'k--','linewidth',1)
    plot([rst.t.stop, rst.t.stop],[rad2deg(min(min(min(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z))), rad2deg(max(max(max(rst.EulXYZ.x,rst.EulXYZ.y),rst.EulXYZ.z)))],'k--','linewidth',1)
    % xlim([rst.t.start, rst.t.stop])
    % ylim([-20 20])
    hold off
    title('euler angles XYZ')
%     ylim([-pi,pi])
    legend('Vicon x','Vicon y','Vicon z','Sensor x','Sensor y','Sensor z','Location','northwest')
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

%% Euler angles error
if 0 % ShowPlot.angle
    f = figure(102); 
    f.Name = 'Euler angles error';
    

    x_error=rad2deg(rst.EulXYZ.x)-rad2deg(rst.SenEulXYZ.x);
    y_error=rad2deg(rst.EulXYZ.y)-rad2deg(rst.SenEulXYZ.y);
    z_error=rad2deg(rst.EulXYZ.z)-rad2deg(rst.SenEulXYZ.z);

    x_rmse=rmse(rad2deg(rst.EulXYZ.x),rad2deg(rst.SenEulXYZ.x));
    y_rmse=rmse(rad2deg(rst.EulXYZ.y),rad2deg(rst.SenEulXYZ.y));
    z_rmse=rmse(rad2deg(rst.EulXYZ.z),rad2deg(rst.SenEulXYZ.z));

    plot(rst.EulXYZ.t, x_error,'linewidth',1,'Color',c.blue); hold on; grid on;
    plot(rst.EulXYZ.t, y_error,'linewidth',1,'Color',c.red)
    plot(rst.EulXYZ.t, z_error,'linewidth',1,'Color',c.yellow)
    ylabel('degree');

    disp('roll_rmse');
    disp(x_rmse);
    disp('pitch_rmse');
    disp(y_rmse);
    disp('yaw_rmse');
    disp(z_rmse);
    disp('roll_max');
    disp(max(x_error));
    disp('picth_max');
    disp(max(y_error));
    disp('yaw_max');
    disp(max(z_error));
end


%% Z_b (comparison Vicon vs. sensor)
if 0 % ShowPlot.angle_comp
    f = figure(78); 
    f.Name = 'Z_b comparison';
    z_o=[0;0;1];
    
    rst.SenRotm = eul2rotm([rst.SenEulXYZ.x, rst.SenEulXYZ.y , rst.SenEulXYZ.z], 'XYZ');
    rst.SenRot.R3  = squeeze(rst.SenRotm(:,3,:));
    
    z_o=repmat(z_o,1,size(rst.SenRot.R3,2));

    theta_zb_sensor=acos(dot(z_o,rst.SenRot.R3))/pi*180;
    theta_zb_vicon=acos(dot(z_o,squeeze(rst.rot.R3)))/pi*180;

    % plot(rst.EulXYZ.t, theta_zb_vicon); hold on
    % plot(rst.EulXYZ.t, theta_zb_sensor)

    % index=find(abs(rst.EulXYZ.t-rst.t.start)<1e-4, 1 );
    % Vicon_offset=squeeze(rst.rot.R3);
    % Vicon_offset=Vicon_offset-Vicon_offset(:,index);
    % Sensor_offset=rst.SenRot.R3-rst.SenRot.R3(:,index);

    % plot(rst.EulXYZ.t, Vicon_offset); hold on
    % plot(rst.EulXYZ.t, Sensor_offset)

    plot(rst.EulXYZ.t, squeeze(rst.rot.R3)); hold on
    plot(rst.EulXYZ.t, rst.SenRot.R3)

    % SenR3 = squeeze(rst.SenRot.R3)';
    % R3 = squeeze(rst.rot.R3)';
    % 
    % for i=1:length(SenR3)
    %     SenR3_norm(i) = sqrt(SenR3(i,1).^2 + SenR3(i,2).^2 +SenR3(i,3).^2 );
    %     R3_norm(i) = sqrt(R3(i,1).^2 + R3(i,2).^2 +R3(i,3).^2 );
    % end
    % plot(SenR3_norm); hold on
    % plot(R3_norm)

    % xlim([rst.t.start, rst.t.stop])
    % ylim([-0.5 1.1])
    % hold off
    % title('theta_{zb}')
    % legend('Vicon','Sensor')
    title('Z_b comparison')

    % legend('x','y','z','Location','northwest')
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

%% theta_zb (comparison Vicon vs. sensor)
if 0 % ShowPlot.angle_comp
    f = figure(79); 
    f.Name = 'Z_b comparison';
    z_o=[0;0;1];
    
    rst.SenRotm = eul2rotm([rst.SenEulXYZ.x, rst.SenEulXYZ.y , rst.SenEulXYZ.z], 'XYZ');
    rst.SenRot.R3  = squeeze(rst.SenRotm(:,3,:));
    
    z_o=repmat(z_o,1,size(rst.SenRot.R3,2));

    theta_zb_sensor=acos(dot(z_o,rst.SenRot.R3))/pi*180;
    theta_zb_vicon=acos(dot(z_o,squeeze(rst.rot.R3)))/pi*180;

    plot(rst.EulXYZ.t, theta_zb_vicon); hold on
    plot(rst.EulXYZ.t, theta_zb_sensor)

    % index=find(abs(rst.EulXYZ.t-rst.t.start)<1e-4, 1 );
    % Vicon_offset=squeeze(rst.rot.R3);
    % Vicon_offset=Vicon_offset-Vicon_offset(:,index);
    % Sensor_offset=rst.SenRot.R3-rst.SenRot.R3(:,index);

    % plot(rst.EulXYZ.t, Vicon_offset); hold on
    % plot(rst.EulXYZ.t, Sensor_offset)

    % plot(rst.EulXYZ.t, squeeze(rst.rot.R3)); hold on
    % plot(rst.EulXYZ.t, rst.SenRot.R3)

    % SenR3 = squeeze(rst.SenRot.R3)';
    % R3 = squeeze(rst.rot.R3)';
    % 
    % for i=1:length(SenR3)
    %     SenR3_norm(i) = sqrt(SenR3(i,1).^2 + SenR3(i,2).^2 +SenR3(i,3).^2 );
    %     R3_norm(i) = sqrt(R3(i,1).^2 + R3(i,2).^2 +R3(i,3).^2 );
    % end
    % plot(SenR3_norm); hold on
    % plot(R3_norm)

    % xlim([rst.t.start, rst.t.stop])
    % ylim([-0.5 1.1])
    hold off
    title('theta_{zb}')
    legend('Vicon','Sensor')
    % title('Z_b comparison')
    grid on; 
    % legend('x','y','z','Location','northwest')
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
    f = figure(3); 
    f.Name = 'Driving signals (sine wave)';
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

    % design filter
    d1 = designfilt("lowpassiir",'FilterOrder', 2, ...
    'HalfPowerFrequency', 0.005, 'DesignMethod', "butter");
 
    % get post-omega from real-time Euler
    rst.vot.filt.v1 = filtfilt(d1,rst.vot.v1);
    rst.vot.filt.v2 = filtfilt(d1,rst.vot.v2);
    rst.vot.filt.v3 = filtfilt(d1,rst.vot.v3);
    rst.vot.filt.v4 = filtfilt(d1,rst.vot.v4);

    f = figure(4); 
    f.Name = 'Voltages';
    if 1
        plot(rst.time, rst.vot.v1, 'Color',c.yellow); hold on
        plot(rst.time, rst.vot.v2, 'Color',c.blue)
        plot(rst.time, rst.vot.v3, 'Color', c.red)
        plot(rst.time, rst.vot.v4, 'Color',c.green)
    else
        plot(rst.time, rst.vot.filt.v1, 'Color',c.yellow); hold on
        plot(rst.time, rst.vot.filt.v2, 'Color',c.blue)
        plot(rst.time, rst.vot.filt.v3, 'Color', c.red)
        plot(rst.time, rst.vot.filt.v4, 'Color',c.green)
    end

    plot([0 rst.time(end)],[1600 1600],'k--')
    plot([0 rst.time(end)],[1700 1700],'r--')
    hold off
%     ylim([1300 max(rst.mdl.max_v_vec)])
    ylim([1300 1800])
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
    f = figure(5); 
    f.Name = 'Torque';
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

    f = figure(6); 
    f.Name = 'Thrust in Z';
    plot(rst.time, rst.thrust./mdl.g./rbt.m + mdl.g, 'm'); hold on; grid on; % in m/s^2
    plot(rst.acc.t, rst.acc.fil.z + rst.mdl.g, 'linewidth',1); 
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
    f = figure(7); 
    f.Name = 'Safety enable';
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

    f = figure(8); 
    f.Name = 'Torque to angular acc';
    
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
   
    f = figure(9); 
    f.Name = 'External torque';
    plot(rst.time,rst.ext.tor.x); hold on
    plot(rst.time,rst.ext.tor.y);
    legend('x','y','Location','northwest')

    if rsim.en
        plot(rst.time,rst.rsim.dist.tor.x)
        plot(rst.time,rst.rsim.dist.tor.y)
        legend('estimated x','estimated y','true x','true y','Location','northwest')
    end
    
    title('external torque')
    xlim([rst.t.start, rst.t.stop])
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
    f = figure(10); 
    f.Name = 'Velocity';
    plot(rst.vel.t, rst.vel.x.*100, 'linewidth',1); hold on
    plot(rst.vel.t, rst.vel.y.*100, 'linewidth',1)
    plot(rst.vel.t, rst.vel.z.*100, 'linewidth',1); 
    plot(rst.vel.t, sqrt(rst.vel.x.^2 + rst.vel.y.^2 + rst.vel.z.^2).*100)

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
    f = figure(11); 
    f.Name = 'Acceleration';

    % filter acceleration
    rst.acc.fil.x = filtfilt(d1,rst.acc.x);
    rst.acc.fil.y = filtfilt(d1,rst.acc.y);
    rst.acc.fil.z = filtfilt(d1,rst.acc.z);
    
    subplot(3,1,1)
    plot(rst.acc.t, rst.acc.x.*100,'linewidth',1); hold on
    plot(rst.acc.t, rst.acc.fil.x.*100,'linewidth',1); 

    subplot(3,1,2)
    plot(rst.acc.t, rst.acc.y.*100,'linewidth',1);hold on
    plot(rst.acc.t, rst.acc.fil.z.*100,'linewidth',1); 

    subplot(3,1,3)
    plot(rst.acc.t, rst.acc.z.*100,'linewidth',1); hold on
    plot(rst.acc.t, rst.acc.fil.z.*100,'linewidth',1); 

    title('x y z acceleration')
    ylabel('cm/s2')
    % legend('x','y','z','Location','northwest')
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

    f = figure(12); 
    f.Name = 'Omega (angular velocity)';
    plot(rst.ome.t, rst.ome.x); hold on; grid on;
    plot(rst.ome.t, rst.ome.y)
    plot(rst.ome.t, rst.ome.z); 
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
    hold off
end

%% plot 3D real-time
if ShowPlot.realtime3D
    f = figure(13);
    f.Name = '3D plot';

    e           = eye(3);
    arrow_scale = 0.5;
    plot_T      = 0.05; % (s)
    plot_n      = round(plot_T/mdl.T_high);
    colors      = {c.yellow, c.green, c.blue};

    plot3(rst.pdesp.desx(rst.t.id).*100,...
          rst.pdesp.desy(rst.t.id).*100, ...
          rst.pdesp.desz(rst.t.id).*100,...
          '--','linewidth',1, 'Color', c.blue)
    hold on; grid on; axis equal; xlabel("x (cm)"); ylabel("y (cm)"); zlabel("z (cm)");
    view([30 30])

    for i = rst.t_h.id(1):plot_n:rst.t_h.id(end)

        % position
        plot3(rst.pos.x(max(i-plot_n,rst.t_h.id(1)):i,1)*100, ...
              rst.pos.y(max(i-plot_n,rst.t_h.id(1)):i,1)*100, ...
              rst.pos.z(max(i-plot_n,rst.t_h.id(1)):i,1)*100, ...
        'LineWidth', 0.7, 'Color', c.dark_grey); 
        hold on; grid on; axis equal; xlabel("x (cm)"); ylabel("y (cm)"); zlabel("z (cm)");
        view([30 30])
        
        % orientation
        arrow_b = rst.rotm(:,:,i) * e .* arrow_scale;
        for j = 1:3 % body x y z arrows
            quiver3(rst.pos.x(i)*100,rst.pos.y(i)*100,rst.pos.z(i)*100,...
                    arrow_b(1,j), arrow_b(2,j), arrow_b(3,j),...
                    "LineWidth", 1.0, "Color", colors{j}); hold on;
        end

        % pause(0.01)
        drawnow

    end
    hold off
end

%% plot 3D 
if 0
    f = figure(14);
    f.Name = '3D plot';

    e           = eye(3);
    arrow_scale = 0.1;
    plot_T      = 0.05; % (s)
    plot_n      = round(plot_T/mdl.T_high);
    colors      = {c.yellow, c.green, c.blue};

    % desired position
    plot3(rst.pdesp.desx(rst.t.id).*100,...
          rst.pdesp.desy(rst.t.id).*100, ...
          rst.pdesp.desz(rst.t.id).*100,...
          '--','linewidth',1, 'Color', c.blue); hold on

    % position
    plot3( ...
        rst.pos.x(rst.t_h.id,1)*100, ...
        rst.pos.y(rst.t_h.id,1)*100, ...
        rst.pos.z(rst.t_h.id,1)*100, ...
        'LineWidth', 1.0, 'Color', c.dark_grey); hold on; grid on; axis equal

    % orientation
    for i = rst.t_h.id(1):plot_n:rst.t_h.id(end)
        for j = 1:3 % body x y z arrows
            arrow_b = rst.rotm(:,:,i) * e .* arrow_scale;
            quiver3(rst.pos.x(i)*100,rst.pos.y(i)*100,rst.pos.z(i)*100,...
                    arrow_b(1,j), arrow_b(2,j), arrow_b(3,j),...
                    "LineWidth", 1.0, "Color", colors{j}); hold on;
        end
        % pause(0.1)
        % drawnow
    end

    xlabel("x (cm)");
    ylabel("y (cm)");
    zlabel("z (cm)");
    hold off

end

%% Euler angles
if 0
    f = figure(15); 
    f.Name = 'Euler angles ZYX';
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

%% intergral - torque
if ShowPlot.iTorque 
    f = figure(16); 
    f.Name = 'Intergral torque (world error 2 torque)';

    plot(rst.itorq.t, rst.itorq.x); hold on; grid on;
    plot(rst.itorq.t, rst.itorq.y)
    % plot(rst.itorq.t, rst.itorq.z)
    ylabel('N m');
    % ylim([-20 20])

    xlim([rst.t.start, rst.t.stop])
    
    hold off
    title('intergral torque')

    % legend('x','y','Location','northwest')
    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [65, 13, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.625, 0.25, 0.35]); % [l b w h]        
    end
end

%% intergral - thrust
if ShowPlot.iForceZ
    f = figure(17); 
    f.Name = 'Intergral thrust (acc)';

    plot(rst.ithr.t, rst.ithr.thr); hold on; grid on;
    ylabel('acc in g');

    xlim([rst.t.start, rst.t.stop])
    
    hold off
    title('intergral thrust')

    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [65, 1, 13, 10]); % [l b w h]
    elseif ShowPlot.NextScreen_4K
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.45, 0.35, 0.45]); % [l b w h]
    else
        set(gcf, 'Units', 'normalized');
        set(gcf, 'Position', [1, 0.625, 0.25, 0.35]); % [l b w h]        
    end
end
%% torque x control gain comparison
if ShowPlot.TorqueControlX

    f = figure(18); 
    f.Name = 'Control comparison (Tx)';

    rst.cat.x3 = -ctr.gain.at3*( (mdl.g*rst.ast.omex)' + dot(rst.ast.rot.R2,traj.rd_ddd(:,1:size(rst.ast.rot.R2,2))) );
    rst.cat.x2 = -ctr.gain.at2*( dot(rst.ast.rot.R2, (mdl.g * [zeros(length(rst.ast.rot.R2),2), ones(length(rst.ast.rot.R2),1) ]' + traj.rd_dd(:,1:size(rst.ast.rot.R2,2)))) );
    rst.cat.x1 = ctr.gain.at1*( dot(rst.ast.rot.R2, (rst.ast.vel - traj.rd_d(:,1:size(rst.ast.rot.R2,2))')' ));
    rst.cat.x0 = ctr.gain.at0*dot(rst.ast.rot.R2,(rst.ast.pos - traj.rd(:,1:size(rst.ast.rot.R2,2))')');

    plot(rst.ast.t,rst.cat.x0,'linewidth',1); hold on; grid on;
    plot(rst.ast.t,rst.cat.x1,'linewidth',1);
    plot(rst.ast.t,rst.cat.x2,'linewidth',1);
    plot(rst.ast.t,rst.cat.x3,'linewidth',1); 
    plot(rst.ast.t,rst.cat.x3+rst.cat.x2+rst.cat.x1+rst.cat.x0,'linewidth',1); hold off
    title('torque x control gains')
    legend('at0','at1','at2','at3','Total','Location','northwest')

    xlim([rst.t.start, rst.t.stop])

    if ShowPlot.ThisScreen
        set(gcf, 'Units', 'centimeters');
        set(gcf, 'Position', [78, 13, 13, 10]); % [l b w h]
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

    f = figure(19); 
    f.Name = 'Control comparison (Ty)';

    caty3 = ctr.gain.at3*( (mdl.g*wy)'-dot(R1',rd_ddd') );
    caty2 = -ctr.gain.at2*( dot(R1',-(mdl.g*[zeros(length(x),2),ones(length(x),1)]+rd_dd)') );
    caty1 = -ctr.gain.at1*( dot(R1',Dr_dot') );
    caty0 = -ctr.gain.at0*dot(R1',Dr');

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

%% higher order trajectory
if ctr.traj.en
    
    f = figure(20); 
    f.Name = 'Higher order derivatives';

    % design lowpass filter
    d1 = designfilt("lowpassiir",'FilterOrder', 4, ...
    'HalfPowerFrequency', 5, 'SampleRate',mdl.f, 'DesignMethod', "butter");
    
    % filter position
    rst.pos.fil.x = filtfilt(d1,rst.pos.x);
    rst.pos.fil.y = filtfilt(d1,rst.pos.y);
    rst.pos.fil.z = filtfilt(d1,rst.pos.z);

    % velocity from filtered position
    rst.v4p.x = gradient(rst.pos.fil.x)./mdl.T_high;
    rst.v4p.y = gradient(rst.pos.fil.y)./mdl.T_high;
    rst.v4p.z = gradient(rst.pos.fil.z)./mdl.T_high;
    
    % acceleration from velocity
    rst.a4v.x = gradient(rst.v4p.x)./mdl.T_high;
    rst.a4v.y = gradient(rst.v4p.y)./mdl.T_high;
    rst.a4v.z = gradient(rst.v4p.z)./mdl.T_high;

    % jerk from acceleration
    rst.j4a.x = gradient(rst.a4v.x)./mdl.T_high;
    rst.j4a.y = gradient(rst.a4v.y)./mdl.T_high;
    rst.j4a.z = gradient(rst.a4v.z)./mdl.T_high;

    % snap from jerk
    rst.s4j.x = gradient(rst.j4a.x)./mdl.T_high;
    rst.s4j.y = gradient(rst.j4a.y)./mdl.T_high;
    rst.s4j.z = gradient(rst.j4a.z)./mdl.T_high;

    subplot(2,2,1); %subplot(5,1,1)
    plot(rst.pos.t, rst.pos.fil.x, 'Color', c.blue); hold on
    plot(traj.t,  rst.pos.fil.x(1) + traj.rd(1,:)', '--', 'Color', c.blue)
    plot(rst.pos.t, rst.pos.fil.y, 'Color', c.red);
    plot(traj.t,  rst.pos.fil.y(2) + traj.rd(2,:)', '--', 'Color', c.red); grid on
    title("Position")

    subplot(2,2,2); %subplot(5,1,2)
    plot(rst.pos.t, rst.v4p.x, 'Color', c.blue); hold on
    plot(traj.t,  traj.rd_d(1,:)', '--', 'Color', c.blue)
    plot(rst.pos.t, rst.v4p.y, 'Color', c.red); hold on
    plot(traj.t,  traj.rd_d(2,:)', '--', 'Color', c.red); grid on
    title("Velocity")

    subplot(2,2,3); %subplot(5,1,3)
    plot(rst.pos.t, rst.a4v.x, 'Color', c.blue); hold on
    plot(traj.t,  traj.rd_dd(1,:)', '--', 'Color', c.blue)
    plot(rst.pos.t, rst.a4v.y, 'Color', c.red); hold on
    plot(traj.t,  traj.rd_dd(2,:)', '--', 'Color', c.red); grid on
    title("Acceleration")

    subplot(2,2,4); %subplot(5,1,4)
    plot(rst.pos.t, rst.j4a.x, 'Color', c.blue); hold on
    plot(traj.t,  traj.rd_ddd(1,:)', '--', 'Color', c.blue)
    plot(rst.pos.t, rst.j4a.y, 'Color', c.red); hold on
    plot(traj.t,  traj.rd_ddd(2,:)', '--', 'Color', c.red); grid on
    title("Jerk")

    % subplot(5,1,5)
    % plot(rst.pos.t, rst.s4j.x, 'Color', c.blue); hold on
    % plot(traj.t,  traj.rd_dddd(1,:)', '--', 'Color', c.blue)
    % plot(rst.pos.t, rst.s4j.y, 'Color', c.red); hold on
    % plot(traj.t,  traj.rd_dddd(2,:)', '--', 'Color', c.red); grid on
    % title("Snap")

end


%%
if som.en
    figure()
    plot(rst.som.state.t, rst.som.state.s); grid on
end

%% Euler angles ZXY
if 1
    f = figure(20); 
    f.Name = 'Euler angles ZXY';
    if 0
        plot(rst.EulXYZ.t, rad2deg(rst.EulZYX.x)); hold on; grid on;
        plot(rst.EulXYZ.t, rad2deg(rst.EulZYX.y))
        plot(rst.EulXYZ.t, rad2deg(rst.EulZYX.z))
        ylabel('degree');
        ylim([-20 20])
    else
        plot(rst.EulXYZ.t, rst.EulZXY.x, 'r'); hold on
        plot(rst.EulXYZ.t, rst.EulZXY.y, 'g'); hold on
        plot(rst.EulXYZ.t, rst.EulZXY.z, 'b')
        ylabel('radian');
        % ylim([-0.3 0.3])
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
    % plot([rst.t.start, rst.t.start],[rad2deg(min(min(min(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z))), rad2deg(max(max(max(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z)))],'k--','linewidth',1)
    % plot([rst.t.stop, rst.t.stop],[rad2deg(min(min(min(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z))), rad2deg(max(max(max(rst.EulZYX.x,rst.EulZYX.y),rst.EulZYX.z)))],'k--','linewidth',1)
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
