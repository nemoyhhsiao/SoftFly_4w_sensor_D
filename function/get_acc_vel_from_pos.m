function rst = get_acc_vel_from_pos(rst, HPF_pos, HPF_vel, show_filter_pos, show_filter_vel, show_acc)

    % ==== Get vel from pos ====

    % Design filter
    f_pos = designfilt("lowpassiir",'FilterOrder', 2, ...
    'HalfPowerFrequency', HPF_pos, 'DesignMethod', "butter");
    
    % Filter position
    rst.pos.filt.x = filtfilt(f_pos,rst.pos.x);
    rst.pos.filt.y = filtfilt(f_pos,rst.pos.y);
    rst.pos.filt.z = filtfilt(f_pos,rst.pos.z);

    % Plot filter result
    if show_filter_pos
        figure(1069); subplot(3,1,1); hold on; grid on
        plot(rst.pos.x); plot(rst.pos.filt.x)
        plot(rst.pos.y); plot(rst.pos.filt.y)
        plot(rst.pos.z); plot(rst.pos.filt.z)
        title("Filtered position")
    end

    % Get velocity
    dt               = rst.pos.t(2) - rst.pos.t(1);
    rst.vel.from_p.x = gradient(rst.pos.filt.x)./dt;
    rst.vel.from_p.y = gradient(rst.pos.filt.y)./dt;
    rst.vel.from_p.z = gradient(rst.pos.filt.z)./dt;

    % ==== Get acc from vel ====

    % Design filter
    f_vel = designfilt("lowpassiir",'FilterOrder', 2, ...
    'HalfPowerFrequency', HPF_vel, 'DesignMethod', "butter");

    % Filter velocity
    rst.vel.from_p_filt.x = filtfilt(f_vel,rst.vel.from_p.x);
    rst.vel.from_p_filt.y = filtfilt(f_vel,rst.vel.from_p.y);
    rst.vel.from_p_filt.z = filtfilt(f_vel,rst.vel.from_p.z);

    % Plot filter result
    if show_filter_vel
        figure(1069); subplot(3,1,2); hold on; grid on
        plot(rst.vel.from_p.x); plot(rst.vel.from_p_filt.x)
        plot(rst.vel.from_p.y); plot(rst.vel.from_p_filt.y)
        plot(rst.vel.from_p.z); plot(rst.vel.from_p_filt.z)
        title("Filtered velocity (post obtained from position)")
    end

    % Get acceleration
    rst.acc.from_p.x = gradient(rst.vel.from_p_filt.x)./dt;
    rst.acc.from_p.y = gradient(rst.vel.from_p_filt.y)./dt;
    rst.acc.from_p.z = gradient(rst.vel.from_p_filt.z)./dt;

    % Plot acc
    if show_acc
        figure(1069); subplot(3,1,3); hold on; grid on
        plot(rst.acc.from_p.x);
        plot(rst.acc.from_p.y);
        plot(rst.acc.from_p.z);
        title("Acceleration (post obtained from position)")
    end
