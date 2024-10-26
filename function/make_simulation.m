function [rsim, rbt] = make_simulation(rbt,mdl,rsim)
    % Initialize the 'rsim' structure with simulation parameters

    % Simulation sample time
    rsim.mdl.f = 1000;
    rsim.mdl.T = 1 / rsim.mdl.f;

    % Initial angular conditions
    rsim.Eul_XYZ.x = deg2rad(10);
    rsim.Eul_XYZ.y = deg2rad(10);
    rsim.Eul_XYZ.z = deg2rad(180);
    rsim.R0 = eul2rotm([rsim.Eul_XYZ.x rsim.Eul_XYZ.y rsim.Eul_XYZ.z],'XYZ');
    rsim.w0 = [0, 0, 0];
   
    % Initial translational conditions
    rsim.p0 = [0.02, 0.04, 0.01];
    rsim.v0 = [0, 0, 0];
    rsim.v0_b = (rsim.R0*rsim.v0')';

    % Robot parameters in simulation
    rsim.rbt.m   = 1.0 * rbt.m;
    rsim.rbt.ixx = 1.0 * rbt.ixx;  % kg.m^2;
    rsim.rbt.iyy = 1.0 * rbt.iyy;
    rsim.rbt.izz = 1.0 * rbt.izz;

    % Robot rotational dynamics damping
    rsim.drag_coef.force = 2.5e-3;       % drag_force = rsim.drag_coef.force * linear_velocity
    rsim.drag_coef.torque = 1e-8;%9.0e-7;      % drag_torque = rsim.drag_coef.torque * angular_velocity

    % Response delay for Vicon measurements
    rsim.delay.Vicon.time = 0.001;
    rsim.delay.Vicon.n_steps = floor(rsim.delay.Vicon.time / 0.002);
    if rsim.delay.Vicon.n_steps > 0
        rsim.delay.Vicon.init_val = repmat([rsim.p0'; 0; 0; 0;], 1, rsim.delay.Vicon.n_steps);
    else
        rsim.delay.Vicon.init_val = 0;
    end

    % Response delay for actuator commands
    rsim.delay.actuator.time = 0.001;
    rsim.delay.actuator.n_steps = round(rsim.delay.actuator.time / mdl.T);
    if rsim.delay.actuator.n_steps > 0
        rsim.delay.actuator.init_val = ones(4, rsim.delay.actuator.n_steps) * rbt.m * mdl.g / 4;
    else
        rsim.delay.actuator.init_val = 0;
    end

    % Disturbance enable
    rsim.dist.pos.en = 1;
    rsim.dist.rot.en = 1;

    % Force disturbance (N)
    rbt_mg = mdl.g * rbt.m;  % Mass
    rsim.dist.x.mean = 0 * rbt_mg;
    rsim.dist.y.mean = 0 * rbt_mg;
    rsim.dist.z.mean = 0.1 * rbt_mg;
    rsim.dist.x.var = 0e-3 * rbt_mg;
    rsim.dist.y.var = 0e-3 * rbt_mg;
    rsim.dist.z.var = 5e-2 * rbt_mg;
    rsim.dist.x.seed = 0;
    rsim.dist.y.seed = 1;
    rsim.dist.z.seed = 2;

    % Torque disturbance (Nm)
    rsim.dist.wx.mean = 1e-6*1;
    rsim.dist.wy.mean = 1e-6*1;
    rsim.dist.wz.mean = -5e-8;
    rsim.dist.wx.var = 5e-8*1;
    rsim.dist.wy.var = 5e-8*1;
    rsim.dist.wz.var = 1e-12;
    rsim.dist.wx.seed = 3;
    rsim.dist.wy.seed = 4;
    rsim.dist.wz.seed = 5;

    % Sensing noise in observer: 
    rsim.sensing_noise.pos.enable = 1;
    rsim.sensing_noise.rpy.enable = 1;
    rsim.sensing_noise.pos_sigma = 0.03e-3 * ones(3, 1); % 0.5 mm
    rsim.sensing_noise.rpy_sigma = 0.5 * ones(3, 1) / 180 * pi; % 0.5 deg
    rsim.sensing_noise.pos.enable = 1;
    rsim.sensing_noise.rpy.enable = 1;

    % No angle offset in simulation 
    if rsim.en
        rbt.angle_offset.x = 0;
        rbt.angle_offset.y = 0;
    end

    % Return the initialized 'rsim' structure
end
