function [mdl,rbt,ctr,flt,rsim,som] = controller_setup_v5(flight_time)

%% ==== openloop tunning ====
%  ==========================

% channel check (each channel -> check mapping)
% rbt.DV = [-1600 -1600 -1600 -600];

% flight condition
% rbt.DV = [70 -90 -175 -75]; % 2021-12-30_11:21
% rbt.DV = [-40 30 0 -120]; % 2022-01-04_15:21
rbt.DV = [20 19 -123 -37]; % 

%% ==== controller parameters ====
%  ===============================

ctr.en          = 1;	% controller enable (0 for open-loop)
ctr.yaw.en      = 0;
ctr.integral.en = 0;
ctr.safety.T    = 0.04;

% attitude controller gains
ctr.gain.at3 = 62*0.75;				
ctr.gain.at2 = 798*0.75;
ctr.gain.at1 = 6631*1.15;
ctr.gain.at0 = 13608*1.1;				
ctr.gain.ati = 0.5e4*1.5;				

% altitude controller gains 
ctr.gain.al0 = 150*0.55;	% p gain		
ctr.gain.al1 = 30*0.9;      % d gain
ctr.gain.ali = 20*0.9;	

% yaw controller gains
% ctr.yaw.simulink = 0; % use the simulink embedded block
ctr.gain.yaw.fw = 1.78e-5;
ctr.gain.yaw.p  = 8e-6*1;  % 2021.12.28 3e-4
ctr.gain.yaw.d  = 8e-6*1;  % 2021.12.28 1e-4  % old: 4e-05
ctr.gain.yaw.i  = 0.1e-6;


% saturation for i terms [ x,       y,      z,      thrust ] 
ctr.integral.lim.upper = [ 10e-2,   3e-2,   1e-6,   3.5e-4   ]; % y = 1e-2
ctr.integral.lim.lower = [-10e-2,  -3e-2,  -1e-6,  -6e-4   ];
ctr.integral.yaw.upper = 3e-6;
ctr.integral.yaw.lower = -3e-6;

% torque/force limits;
%TORQUE_LIM_GAIN = 1.2; % TODO: ANDREA: REMOVE/SET TO 1.2/1.3
ctr.lim.taux = 10.0e-5; % -> used by kevin in somersault %500*48e-9*1.25;
ctr.lim.tauy = 10.0e-5;
ctr.lim.tauz = 4e-6*1; %100*320e-9;

ctr.lim.unit_force.lb = 0.0; 

% enable zone -> beyond this zone -> shotdown
ctr.safety.enableZone.xmax = 0.35;
ctr.safety.enableZone.ymax = 0.35;
ctr.safety.enableZone.zmax = 0.6;

% maximum operating voltage for safety.T
ctr.safety.volt     = [1950 1950 1950 1900]';

% beyond this zone/volt -> landing
ctr.safety.land.xmax = 0.25;
ctr.safety.land.ymax = 0.25;
ctr.safety.land.zmax = 0.2;
ctr.safety.land.volt = 1950;
ctr.safety.land.T    = 0.15;

% Orientation check
% if cos(roll)*cos(pitch) > ctr.safety.min_cos_roll_pitch -> then fly
% default ctr.safety.min_cos_roll_pitch: 0.5
% somersault: disable by setting it to -1
ctr.safety.min_cos_roll_pitch = -1;

% overload setting
ctr.safety.overload.T     = 1;
ctr.safety.overload.count = 10;

% setpoint (in m)
ctr.setpoint.x   = 0;
ctr.setpoint.y   = 0;
ctr.setpoint.z   = 0.05;		
ctr.setpoint.yaw = deg2rad(0);

% landing
ctr.landing.en     = 0;
ctr.landing.height = 0.001;
ctr.landing.time   = 1; 

% takeoff
ctr.takeoff.en     = 0;
ctr.takeoff.height = 0.012; % desired traj starting point
ctr.takeoff.time   = 1;

% desired yaw trojactory
ctr.yaw.dy.en       = 0;
ctr.yaw.dy.angle    = deg2rad([0 -45 0 0 0]);
ctr.yaw.dy.duration = [1 1 1 1 1];
ctr.yaw.dy.trans    = [1 1 1 1];

% flight/robot dependent (leave them as zero)
flt.torx_off   = 0;
flt.tory_off   = 0;
flt.torz_off   = 0;
flt.thrust_off = 0;

%% ==== model parameter (simulink model) ====
%  ==========================================

mdl.f       = 1e3;			    % controller sampling rate
% mdl.f_low   = 1600;
mdl.f_high  = 10e3;
mdl.T       = 1/mdl.f;		    % controller sampling rate
% mdl.T_low   = 1/mdl.f_low;
mdl.T_high  = 1/mdl.f_high;
mdl.i_delay = 2.0;				% initial delay (s)
mdl.s_delay = 0.8;				% short delay (s) before i terms kicks in
mdl.rt      = flight_time + mdl.i_delay;		% flight time
mdl.g       = 9.80655;
mdl.drag_force.linear = 2.5e-3;
rsim.rbt.torque_damping = 9e-7; % mav_sim has 10e-7
% mdl.landing = 1.5;

% low pass filter
[mdl.vlp.n, mdl.vlp.d]=butter(2, 80/mdl.f);  	% 80 Hz

% very low pass filter
[mdl.vlp.n, mdl.vlp.d]=butter(3,2.3*60/mdl.f); 		% 60 Hz

% filtered derivatives
mdl.f1     = 500;
mdl.zf1    = exp(-mdl.f1*mdl.T);
mdl.f2     = 100;
mdl.zf2    = exp(-mdl.f2*mdl.T);
mdl.fd_lim = 3.0;				% saturation limit for the linear acceleration (just in case)
%mdl.max_v = 1500;
mdl.max_v_vec    = [1950 1950 1950 1900]';
mdl.hovering_vec = [1400 1600 1630 1470]';
mdl.max_v        = max(mdl.max_v_vec);
%mdl.freq = 300;					% TO BE CHANGED.

mdl.freq_vec = [400 400 400 400];
%mdl.freq_vec = [300 300 300 300];

% if rsim.en
%     mdl.i_delay = 0;
% end


%% ==== robot parameter ====
%  =========================

rbt.m       = 4*180e-6*1;				% kg.
rbt.base.th = 0.0*rbt.m;
rbt.base.xt = 0.0*1e-5;			% torque
rbt.base.yt = 0.0*1e-5;
rbt.base.zt = 0.0*1e-5;

rbt.offset.x = 0;
rbt.offset.y = 0;

% geometric parameters
rbt.ixx = 2.4*48e-9;		% kg.m^2; % should be around 2.4
rbt.iyy = 1.3*270e-9;
rbt.izz = 1.2*320e-9;
rbt.ld  = (14+8)*1e-3;			% m.
rbt.lw  = (6.3+4)*1e-3;			% center of unit to lift center
rbt.lt  = (7.0+1.5+3.5)*1e-3;
rbt.til = 0; % deg
% rbt.lh  = sqrt(rbt.ld^2+rbt.lt^2);
% rbt.li  = rbt.lt*sind(25);

% thrust/torque to unit force mapping

rbt.A = [ones(1,4); ...
        rbt.lt*[-1,1,1,-1]; ...
        -rbt.ld*[1,1,-1,-1]] ;
rbt.Apinv = pinv(rbt.A);

rbt.A2 = [     1*cosd(rbt.til).*[1,1,1,1];
          rbt.lt*cosd(rbt.til).*[-1,1,1,-1];
          rbt.ld*cosd(rbt.til).*[-1,-1,1,1];
          rbt.ld*sind(rbt.til).*[1,-1,1,-1];];

if rbt.til == 0
    rbt.A2inv = zeros(4,4);
else
    rbt.A2inv = inv(rbt.A2);
end

%account for different DEAs of different layers
% rbt.VM_robot_1 = [180*9.8e-6*cosd(rbt.til), 1; 200*9.8e-6*cosd(rbt.til), 1]\[1600;1625];
% rbt.VM_robot_2 = [180*9.8e-6*cosd(rbt.til), 1; 200*9.8e-6*cosd(rbt.til), 1]\[1600;1625];
% rbt.VM_robot_3 = [180*9.8e-6*cosd(rbt.til), 1; 200*9.8e-6*cosd(rbt.til), 1]\[1600;1625];
% rbt.VM_robot_4 = [180*9.8e-6*cosd(rbt.til), 1; 200*9.8e-6*cosd(rbt.til), 1]\[1600;1625];

rbt.VM_robot_1 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt.VM_robot_2 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt.VM_robot_3 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt.VM_robot_4 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];

rbt.VM_input1 = [rbt.VM_robot_1(1) rbt.VM_robot_2(1) rbt.VM_robot_3(1) rbt.VM_robot_4(1)];
rbt.VM_input2 = [rbt.VM_robot_1(2) rbt.VM_robot_2(2) rbt.VM_robot_3(2) rbt.VM_robot_4(2)];

rbt.VM2 = sqrt(4/(rbt.m*mdl.g))*1600; % F=(mg/4)*(V/V_takeoff)^2

rbt.DV_flip = [0 0 0 0];

load("thrust_to_voltage_poly_fit.mat")
rbt.thrust_to_voltage_polyfit = thrust_to_voltage_poly_fit;

load("thrust_error_poly_fit.mat")
rbt.thrust_error_poly_fit = thrust_error_poly_fit;

if ctr.en
	% 
else
	mdl.rt = mdl.i_delay + 0.20; %0.40	
	rbt.base.th = mdl.g*rbt.m*cosd(rbt.til);
	rbt.base.xt = 0;
	rbt.base.yt = 0;
	rbt.base.zt = 0;
    disp('rbt.base.th')
    disp(rbt.base.th)
end

ctr.lim.unit_force.ub = rbt.m*9.81*1.2/2;

%% ==== simulation parameter ====
%  ==============================

rsim.en = 1;

% simulation sample time
rsim.mdl.f = 1000;
rsim.mdl.T = 1/rsim.mdl.f;

% initial condition
rsim.R0 = [1;0;0;0;1;0;0;0;1];	% initial rotation matrix.
rsim.w0 = [0;0;0];     % initial angular velocity.
rsim.p0 = [-0.049;-0.047;0.068];              % initial position
rsim.v0 = [0,0,0];     % initial velocity.

% robot parameter in simulation
rsim.rbt.ixx = 1.0*rbt.ixx;		% kg.m^2;
rsim.rbt.iyy = 1.0*rbt.iyy;
rsim.rbt.izz = 1.0*rbt.izz;

% response delay
rsim.delay.Vicon.time    = 0.004;
rsim.delay.Vicon.n_steps = floor(rsim.delay.Vicon.time/0.002);
if rsim.delay.Vicon.n_steps > 0
    rsim.delay.Vicon.init_val = repmat([rsim.p0;0;0;0;],1,rsim.delay.Vicon.n_steps);
else
    rsim.delay.Vicon.init_val = 0;
end

rsim.delay.actuator.time = 0.015; % 0.027
rsim.delay.actuator.n_steps = round(rsim.delay.actuator.time/mdl.T);
if rsim.delay.actuator.n_steps > 0
    rsim.delay.actuator.init_val = ones(4,rsim.delay.actuator.n_steps).*rbt.m*mdl.g./4;
else
    rsim.delay.actuator.init_val = 0;
end


% disturbance enable
rsim.dist.pos.en  = 0;
rsim.dist.rot.en  = 0;

% force disturbance (N)
rbt_mg = mdl.g*rbt.m; % mass

rsim.dist.x.mean = 0.25*rbt_mg;
rsim.dist.y.mean = 0.25*rbt_mg; 
rsim.dist.z.mean = -0.4*rbt_mg;
rsim.dist.x.var  = 1e-6*rbt_mg;
rsim.dist.y.var  = 1e-6*rbt_mg;
rsim.dist.z.var  = 1e-6*rbt_mg;
rsim.dist.x.seed = 0;
rsim.dist.y.seed = 1;
rsim.dist.z.seed = 2;

% torque disturbance (Nm)
rsim.dist.wx.mean = -1.5e-5;
rsim.dist.wy.mean = -1.5e-5;
rsim.dist.wz.mean = 0.0*0.1e-5;
rsim.dist.wx.var  = 1e-13;
rsim.dist.wy.var  = 1e-13;
rsim.dist.wz.var  = 0; %10e-9;
rsim.dist.wx.seed = 3;
rsim.dist.wy.seed = 4;
rsim.dist.wz.seed = 5;

%% ==== cascaded parameters ====
%  =============================

ctr.casd.en  = 1; % 1 for cascaded, 0 for geometric 
ctr.casd.yaw = 1; % 1 to enable yaw control
ctr.traj.en  = 1;
ctr.traj.ome = 2;

% controller gains

% attitude controller
ctr.casd.att.x.p = 0.001;
ctr.casd.att.x.d = 0.00006; %4.6e-05;
ctr.casd.att.y.p = 0.001;
ctr.casd.att.y.d = 0.00008; %6.6e-05;
ctr.casd.att.z.p = 3e-5;  % 2021.12.28 3e-4
ctr.casd.att.z.d = 1e-5;  % 2021.12.28 1e-4  % old: 4e-05

% position controller
ctr.casd.pos.x.p = 6; % 17
ctr.casd.pos.x.d = 2;
ctr.casd.pos.y.p = 6; % 16
ctr.casd.pos.y.d = 2;

ctr.lim.att      = 0.05; % 0.25


%% ==== somersault parameters ====
%  ===============================

som.en = 0;	% enable, 0 or 1

som.t_start = 2000 + mdl.i_delay;
som.t_rise = 0.52;	% time for acclerelating upwards (while maintaining the attitude)
som.t_acc = 0.14;	% time for positive roll
som.t_dcc = 0.03;	% time for decelerating the roll (noimally same as t_acc).
som.t_rec = 0.2;	% recovering time.
som.thrust_f = 1.50;	% thrust amplification factor during the t_rise (relative to g)
som.roll_mag = 5e-5; % max roll torque magitude during the flipping (in Nm).
%this is nominal force for the other two wings, it should not as small as -g.

% signal smoothing
som.filter.fc = 80;	% around 100 Hz?
som.filter.alp = 2*pi*mdl.T*som.filter.fc / (1+2*pi*mdl.T*som.filter.fc);
% these som.thrust are used in "adaptive controller>saturation"


end
