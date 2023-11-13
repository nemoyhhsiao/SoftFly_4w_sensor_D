function [mdl,rbt1,rbt2,ctr1,ctr2,flt,rsim1,rsim2,traj2,som] = controller_setup_v5(flight_time, exe_time)

%% ==== openloop tunning ====

% flight condition
rbt1.DV = [-200 -200 -200 -200]; 
rbt2.DV = [-200 -200 -200 -200]; 

%% ==== controller 1 parameters ====

ctr1.en          = 0;	% controller enable (0 for open-loop)
ctr1.yaw.en      = 0;
ctr1.integral.en = 0;
ctr1.safety.T    = 0.04;

ctr1.freq_vec = [400 400 400 400];

% attitude controller gains
ctr1.gain.at3 = 62*0.75;				
ctr1.gain.at2 = 798*0.75;
ctr1.gain.at1 = 6631*1.15;
ctr1.gain.at0 = 13608*1.1;				
ctr1.gain.ati = 0.5e4*1.5;				

% altitude controller gains 
ctr1.gain.al0 = 150*0.55;	% p gain		
ctr1.gain.al1 = 30*0.9;      % d gain
ctr1.gain.ali = 20*0.9;	

% yaw controller gains
% ctr1.yaw.simulink = 0; % use the simulink embedded block
ctr1.gain.yaw.fw = 1.78e-5;
ctr1.gain.yaw.p  = 8e-6*1;  % 2021.12.28 3e-4
ctr1.gain.yaw.d  = 8e-6*1;  % 2021.12.28 1e-4  % old: 4e-05
ctr1.gain.yaw.i  = 0.1e-6;


% saturation for i terms [ x,       y,      z,      thrust ] 
ctr1.integral.lim.upper = [ 10e-2,   3e-2,   1e-6,   3.5e-4   ]; % y = 1e-2
ctr1.integral.lim.lower = [-10e-2,  -3e-2,  -1e-6,  -6e-4   ];
ctr1.integral.yaw.upper = 3e-6;
ctr1.integral.yaw.lower = -3e-6;

% torque/force limits;
ctr1.lim.taux = 500*48e-9*1.25;		% for now, these limits are v generous.
ctr1.lim.tauy = 500*270e-9/2;
ctr1.lim.tauz = 4e-6*1; %100*320e-9;

% enable zone -> beyond this zone -> shotdown
ctr1.safety.enableZone.xmax = 0.50;
ctr1.safety.enableZone.ymax = 0.50;
ctr1.safety.enableZone.zmax = 0.50;

% maximum operating voltage for safety.T
ctr1.safety.volt     = [1900 1900 1900 1900]';

% beyond this zone/volt -> landing
ctr1.safety.land.xmax = 0.40;
ctr1.safety.land.ymax = 0.40;
ctr1.safety.land.zmax = 0.40;
ctr1.safety.land.volt = ctr1.safety.volt - 30;
ctr1.safety.land.T    = 0.1;

% overload setting
ctr1.safety.overload.T     = 1;
ctr1.safety.overload.count = 20;

% setpoint (in m)
ctr1.setpoint.x   = 0;
ctr1.setpoint.y   = 0;
ctr1.setpoint.z   = 0.05;		
ctr1.setpoint.yaw = deg2rad(0);

% landing
ctr1.landing.en     = 0;
ctr1.landing.height = 0.001;
ctr1.landing.time   = 1; 

% takeoff
ctr1.takeoff.en     = 0;
ctr1.takeoff.height = 0.012; % desired traj starting point
ctr1.takeoff.time   = 1;

% desired yaw trojactory
ctr1.yaw.dy.en       = 0;
ctr1.yaw.dy.angle    = deg2rad([0 -45 0 0 0]);
ctr1.yaw.dy.duration = [1 1 1 1 1];
ctr1.yaw.dy.trans    = [1 1 1 1];


%% ==== controller 2 parameters ====

ctr2.en          = 1;	% controller enable (0 for open-loop)
ctr2.yaw.en      = 0;
ctr2.integral.en = 0;
ctr2.safety.T    = 0.8;

ctr2.freq_vec = [400 400 400 400];

% attitude controller gains
ctr2.gain.at3 = 62*0.75;				
ctr2.gain.at2 = 798*0.75;
ctr2.gain.at1 = 6631*1.15;
ctr2.gain.at0 = 13608*1.1;				
ctr2.gain.ati = 0.5e4*1.5;				

% altitude controller gains 
ctr2.gain.al0 = 150*0.55;	% p gain		
ctr2.gain.al1 = 30*0.9;      % d gain
ctr2.gain.ali = 20*0.9;	

% yaw controller gains
% ctr2.yaw.simulink = 0; % use the simulink embedded block
ctr2.gain.yaw.fw = 1.78e-5;
ctr2.gain.yaw.p  = 8e-6*1;  % 2021.12.28 3e-4
ctr2.gain.yaw.d  = 8e-6*1;  % 2021.12.28 1e-4  % old: 4e-05
ctr2.gain.yaw.i  = 0.1e-6;


% saturation for i terms [ x,       y,      z,      thrust ] 
ctr2.integral.lim.upper = [ 10e-2,   3e-2,   1e-6,   3.5e-4   ]; % y = 1e-2
ctr2.integral.lim.lower = [-10e-2,  -3e-2,  -1e-6,  -6e-4   ];
ctr2.integral.yaw.upper = 3e-6;
ctr2.integral.yaw.lower = -3e-6;

% torque/force limits;
ctr2.lim.taux = 500*48e-9*1.25;		% for now, these limits are v generous.
ctr2.lim.tauy = 500*270e-9/2;
ctr2.lim.tauz = 4e-6*1; %100*320e-9;

% enable zone -> beyond this zone -> shotdown
ctr2.safety.enableZone.xmax = 0.50;
ctr2.safety.enableZone.ymax = 0.50;
ctr2.safety.enableZone.zmax = 0.70;

% maximum operating voltage for safety.T
ctr2.safety.volt     = [1750 1800 1800 1800]';

% beyond this zone/volt -> landing
ctr2.safety.land.xmax = 0.40;
ctr2.safety.land.ymax = 0.40;
ctr2.safety.land.zmax = 0.70;
ctr2.safety.land.volt = ctr2.safety.volt - 10;
ctr2.safety.land.T    = 0.1;

% overload setting
ctr2.safety.overload.T     = 1;
ctr2.safety.overload.count = 20;

% setpoint (in m)
ctr2.setpoint.x   = 0;
ctr2.setpoint.y   = 0;
ctr2.setpoint.z   = 0.05;		
ctr2.setpoint.yaw = deg2rad(0);

% landing
ctr2.landing.en     = 0;
ctr2.landing.height = 0.001;
ctr2.landing.time   = 1; 

% takeoff
ctr2.takeoff.en     = 0;
ctr2.takeoff.height = 0.012; % desired traj starting point
ctr2.takeoff.time   = 1;

% desired yaw trojactory
ctr2.yaw.dy.en       = 0;
ctr2.yaw.dy.angle    = deg2rad([0 -45 0 0 0]);
ctr2.yaw.dy.duration = [1 1 1 1 1];
ctr2.yaw.dy.trans    = [1 1 1 1];




%% ==== flight ====

% flight/robot dependent (leave them as zero)
flt.torx_off   = 0;
flt.tory_off   = 0;
flt.torz_off   = 0;
flt.thrust_off = 0;





%% ==== model parameter (simulink model) ====
%  ==========================================
mdl.flight_time = flight_time;
mdl.exe_time    = exe_time;

mdl.f       = 2e3;			    % controller sampling rate
mdl.f_high  = 10e3;
mdl.T       = 1/mdl.f;		    % controller sampling rate
mdl.T_high  = 1/mdl.f_high;
mdl.i_delay = 2.0;				% initial delay (s)
mdl.s_delay = 0.8;				% short delay (s) before i terms kicks in
mdl.rt      = flight_time + mdl.i_delay;		% flight time
mdl.g       = 9.81;
% mdl.landing = 1.5;

% low pass filter
[mdl.vlp.n, mdl.vlp.d] = butter(2, 80/mdl.f);  	% 80 Hz

% very low pass filter
[mdl.vlp.n, mdl.vlp.d] = butter(3, 70/mdl.f); 		% 60 Hz

% filtered derivatives
mdl.f1     = 500;
mdl.zf1    = exp(-mdl.f1*mdl.T);
mdl.f2     = 100;
mdl.zf2    = exp(-mdl.f2*mdl.T);
mdl.fd_lim = 3.0;				% saturation limit for the linear acceleration (just in case)
%mdl.max_v = 1500;
% mdl.max_v_vec    = [1800 1800 1800 1800]';
mdl.hovering_vec = [1500 1500 1500 1500]';
% mdl.max_v        = max(ctr.safety.volt);
% mdl.freq = 300;					% TO BE CHANGED.

mdl.vicon.gain = 1e5;

%mdl.freq_vec = [300 300 300 300];

% if rsim.en
%     mdl.i_delay = 0;
% end


%% ==== predefined trajectory ====
%  ===============================


% traj2 = generate_traj(mdl);
traj2.en = 1;
traj2.origin = [0.05; 0.10; 0.03;];
% traj2.rd      = zeros(mdl.f*(mdl.rt+1),3);
% traj2.rd_d    = zeros(mdl.f*(mdl.rt+1),3);
% traj2.rd_dd   = zeros(mdl.f*(mdl.rt+1),3);
% traj2.rd_ddd  = zeros(mdl.f*(mdl.rt+1),3);
% traj2.rd_dddd = zeros(mdl.f*(mdl.rt+1),3);


%% ==== robot 1 parameter ====
%  =========================

rbt1.m       = 4.0*180e-6;				% kg.
rbt1.base.th = 0.0*rbt1.m;
rbt1.base.xt = 0.0*1e-5;			% torque
rbt1.base.yt = 0.0*1e-5;
rbt1.base.zt = 0.0*1e-5;

rbt1.offset.x = 0;
rbt1.offset.y = 0;

% geometric parameters
rbt1.ixx = 2.4*48e-9;		% kg.m^2; % should be around 2.4
rbt1.iyy = 1.3*270e-9;
rbt1.izz = 1.2*320e-9;
rbt1.ld  = (14+8)*1e-3;			% m.
rbt1.lw  = (6.3+4)*1e-3;			% center of unit to lift center
rbt1.lt  = (7.0+1.5+3.5)*1e-3;


rbt1.til = 0; % deg
% rbt1.lh  = sqrt(rbt1.ld^2+rbt1.lt^2);
% rbt1.li  = rbt1.lt*sind(25);

% thrust/torque to unit force mapping

rbt1.A = [ones(1,4); ...
        rbt1.lt*[-1,1,1,-1]; ...
        -rbt1.ld*[1,1,-1,-1]] ;
rbt1.Apinv = pinv(rbt1.A);

rbt1.A2 = [     1*cosd(rbt1.til).*[1,1,1,1];
          rbt1.lt*cosd(rbt1.til).*[-1,1,1,-1];
          rbt1.ld*cosd(rbt1.til).*[-1,-1,1,1];
          rbt1.ld*sind(rbt1.til).*[1,-1,1,-1];];

if rbt1.til == 0
    rbt1.A2inv = zeros(4,4);
else
    rbt1.A2inv = inv(rbt1.A2);
end

%account for different DEAs of different layers
% rbt1.VM_robot_1 = [180*9.8e-6*cosd(rbt1.til), 1; 200*9.8e-6*cosd(rbt1.til), 1]\[1600;1625];
% rbt1.VM_robot_2 = [180*9.8e-6*cosd(rbt1.til), 1; 200*9.8e-6*cosd(rbt1.til), 1]\[1600;1625];
% rbt1.VM_robot_3 = [180*9.8e-6*cosd(rbt1.til), 1; 200*9.8e-6*cosd(rbt1.til), 1]\[1600;1625];
% rbt1.VM_robot_4 = [180*9.8e-6*cosd(rbt1.til), 1; 200*9.8e-6*cosd(rbt1.til), 1]\[1600;1625];

rbt1.VM_robot_1 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt1.VM_robot_2 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt1.VM_robot_3 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt1.VM_robot_4 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];

rbt1.VM_input1 = [rbt1.VM_robot_1(1) rbt1.VM_robot_2(1) rbt1.VM_robot_3(1) rbt1.VM_robot_4(1)];
rbt1.VM_input2 = [rbt1.VM_robot_1(2) rbt1.VM_robot_2(2) rbt1.VM_robot_3(2) rbt1.VM_robot_4(2)];

rbt1.VM2 = sqrt(4/(rbt1.m*mdl.g))*1600; % F=(mg/4)*(V/V_takeoff)^2

rbt1.DV_flip = [0 0 0 0];


%% ==== robot 2 parameter ====
%  =========================

rbt2.m       = 4*180e-6;				% kg.
rbt2.base.th = 0.0*rbt2.m;
rbt2.base.xt = 0.0*1e-5;			% torque
rbt2.base.yt = 0.0*1e-5;
rbt2.base.zt = 0.0*1e-5;

rbt2.offset.x = 0;
rbt2.offset.y = 0;

% geometric parameters
rbt2.ixx = 2.4*48e-9;		% kg.m^2; % should be around 2.4
rbt2.iyy = 1.3*270e-9;
rbt2.izz = 1.2*320e-9;
rbt2.ld  = (14+8)*1e-3;			% m.
rbt2.lw  = (6.3+4)*1e-3;			% center of unit to lift center
rbt2.lt  = (7.0+1.5+3.5)*1e-3;


rbt2.til = 0; % deg
% rbt2.lh  = sqrt(rbt2.ld^2+rbt2.lt^2);
% rbt2.li  = rbt2.lt*sind(25);

% thrust/torque to unit force mapping

rbt2.A = [ones(1,4); ...
        rbt2.lt*[-1,1,1,-1]; ...
        -rbt2.ld*[1,1,-1,-1]] ;
rbt2.Apinv = pinv(rbt2.A);

rbt2.A2 = [     1*cosd(rbt2.til).*[1,1,1,1];
          rbt2.lt*cosd(rbt2.til).*[-1,1,1,-1];
          rbt2.ld*cosd(rbt2.til).*[-1,-1,1,1];
          rbt2.ld*sind(rbt2.til).*[1,-1,1,-1];];

if rbt2.til == 0
    rbt2.A2inv = zeros(4,4);
else
    rbt2.A2inv = inv(rbt2.A2);
end

%account for different DEAs of different layers
% rbt2.VM_robot_1 = [180*9.8e-6*cosd(rbt2.til), 1; 200*9.8e-6*cosd(rbt2.til), 1]\[1600;1625];
% rbt2.VM_robot_2 = [180*9.8e-6*cosd(rbt2.til), 1; 200*9.8e-6*cosd(rbt2.til), 1]\[1600;1625];
% rbt2.VM_robot_3 = [180*9.8e-6*cosd(rbt2.til), 1; 200*9.8e-6*cosd(rbt2.til), 1]\[1600;1625];
% rbt2.VM_robot_4 = [180*9.8e-6*cosd(rbt2.til), 1; 200*9.8e-6*cosd(rbt2.til), 1]\[1600;1625];

rbt2.VM_robot_1 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt2.VM_robot_2 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt2.VM_robot_3 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1625];
rbt2.VM_robot_4 = [180*9.8e-6, 1; 200*9.8e-6, 1]\[1600;1623];

rbt2.VM_input1 = [rbt2.VM_robot_1(1) rbt2.VM_robot_2(1) rbt2.VM_robot_3(1) rbt2.VM_robot_4(1)];
rbt2.VM_input2 = [rbt2.VM_robot_1(2) rbt2.VM_robot_2(2) rbt2.VM_robot_3(2) rbt2.VM_robot_4(2)];

rbt2.VM2 = sqrt(4/(rbt2.m*mdl.g))*1600; % F=(mg/4)*(V/V_takeoff)^2

rbt2.DV_flip = [0 0 0 0];


%% ==== openloop ====

if ctr1.en || ctr2.en
    mdl.rt      = flight_time + mdl.i_delay;		% flight time
else
    if ctr1.en
        %
    else
        mdl.rt = mdl.i_delay + 0.20; %0.40	
        rbt1.base.th = mdl.g*rbt1.m*cosd(rbt1.til);
        rbt1.base.xt = 0;
        rbt1.base.yt = 0;
        rbt1.base.zt = 0;
        disp('rbt1.base.th')
        disp(rbt1.base.th)
    end
    if ctr2.en
        % 
    else
        mdl.rt = mdl.i_delay + 0.20; %0.40	
        rbt2.base.th = mdl.g*rbt2.m*cosd(rbt2.til);
        rbt2.base.xt = 0;
        rbt2.base.yt = 0;
        rbt2.base.zt = 0;
        disp('rbt2.base.th')
        disp(rbt2.base.th)
    end
end



%% ==== simulation 1 parameter ====

rsim1.en = 0;

% simulation sample time
rsim1.mdl.f = 1000;
rsim1.mdl.T = 1/rsim1.mdl.f;

% initial condition
rsim1.R0 = [1;0;0;0;1;0;0;0;1];	% initial rotation matrix.
rsim1.w0 = [0;0;0.01];     % initial angular velocity.
rsim1.p0 = [0.005;0.01;0];              % initial position
rsim1.v0 = [0,0,0];     % initial velocity.

% robot parameter in simulation
rsim1.rbt.ixx = 1.0*rbt1.ixx;		% kg.m^2;
rsim1.rbt.iyy = 1.0*rbt1.iyy;
rsim1.rbt.izz = 1.0*rbt1.izz;

% response delay
rsim1.delay.en   = 1;
rsim1.delay.time = 0.01; % 0.027

% disturbance enable
rsim1.dist.pos.en  = 0;
rsim1.dist.rot.en  = 1;

% position disturbance
rsim1.dist.x.mean = 0.04*mdl.g;
rsim1.dist.y.mean = 0.04*mdl.g; 
rsim1.dist.z.mean = 0.00*mdl.g;
rsim1.dist.x.var  = (0.04*mdl.g)^2;
rsim1.dist.y.var  = (0.04*mdl.g)^2;
rsim1.dist.z.var  = (0.05*mdl.g)^2;
rsim1.dist.x.seed = 555;
rsim1.dist.y.seed = 9862;
rsim1.dist.z.seed = 0;

% rotation disturbance
rsim1.dist.wx.mean = 0.7e-5;
rsim1.dist.wy.mean = 0.7e-5;
rsim1.dist.wz.mean = 0; %0.3e-5;
rsim1.dist.wx.var  = (0.3e-5)^2;
rsim1.dist.wy.var  = (0.4e-5)^2;
rsim1.dist.wz.var  = (0.1e-5)^2; %10e-9;
rsim1.dist.wx.seed = 845;
rsim1.dist.wy.seed = 9422;
rsim1.dist.wz.seed = 445;

%% ==== simulation 2 parameter ====

rsim2.en = 0;

% simulation sample time
rsim2.mdl.f = 1000;
rsim2.mdl.T = 1/rsim2.mdl.f;

% initial condition
rsim2.R0 = [1;0;0;0;1;0;0;0;1];	% initial rotation matrix.
rsim2.w0 = [0;0;0.01];     % initial angular velocity.
rsim2.p0 = [0.005;0.01;0];              % initial position
rsim2.v0 = [0,0,0];     % initial velocity.

% robot parameter in simulation
rsim2.rbt.ixx = 1.0*rbt2.ixx;		% kg.m^2;
rsim2.rbt.iyy = 1.0*rbt2.iyy;
rsim2.rbt.izz = 1.0*rbt2.izz;

% response delay
rsim2.delay.en   = 1;
rsim2.delay.time = 0.017; % 0.027

% disturbance enable
rsim2.dist.pos.en  = 0;
rsim2.dist.rot.en  = 1;

% position disturbance
rsim2.dist.x.mean = rbt2.m*mdl.g*0.0;
rsim2.dist.y.mean = rbt2.m*mdl.g*0.0; 
rsim2.dist.z.mean = rbt2.m*mdl.g*0;
rsim2.dist.x.var  = (0.04*rbt2.m*mdl.g)^2;
rsim2.dist.y.var  = (0.04*rbt2.m*mdl.g)^2;
rsim2.dist.z.var  = (0.05*rbt2.m*mdl.g)^2;
rsim2.dist.x.seed = 555;
rsim2.dist.y.seed = 9862;
rsim2.dist.z.seed = 0;

% rotation disturbance
rsim2.dist.wx.mean = 0; %0.9e-5;
rsim2.dist.wy.mean = 0; %0.9e-5;
rsim2.dist.wz.mean = 0; %0.3e-5;
rsim2.dist.wx.var  = (1e-4)^2; % 0.5e-5
rsim2.dist.wy.var  = (1e-4)^2; % 0.5e-5
rsim2.dist.wz.var  = (0.01e-5)^2; %10e-9;
rsim2.dist.wx.seed = 845;
rsim2.dist.wy.seed = 9422;
rsim2.dist.wz.seed = 445;


%% ==== jumping robot ====
jsim.init.pos = [0,0,0.27]; %(m) inertial axes
jsim.init.vel = [0,0,0];    %(m/s) body axes
jsim.init.Eul = [0,0,0];    %(rad) iniital Euler orientation [roll, pitch , yaw]
jsim.init.pqr = [0,0,0];    %(rad/s) initial body rotation rates [p q r]
jsim.mass     = 0.00085;
%% ==== cascaded parameters ====
%  =============================

% ctr.casd.en  = 1; % 1 for cascaded, 0 for geometric 
% ctr.casd.yaw = 1; % 1 to enable yaw control
% ctr.traj.en  = 1;
% ctr.traj.ome = 2;
% 
% % controller gains
% 
% % attitude controller
% ctr.casd.att.x.p = 0.001;
% ctr.casd.att.x.d = 0.00006; %4.6e-05;
% ctr.casd.att.y.p = 0.001;
% ctr.casd.att.y.d = 0.00008; %6.6e-05;
% ctr.casd.att.z.p = 3e-5;  % 2021.12.28 3e-4
% ctr.casd.att.z.d = 1e-5;  % 2021.12.28 1e-4  % old: 4e-05
% 
% % position controller
% ctr.casd.pos.x.p = 6; % 17
% ctr.casd.pos.x.d = 2;
% ctr.casd.pos.y.p = 6; % 16
% ctr.casd.pos.y.d = 2;
% 
% ctr.lim.att      = 0.05; % 0.25


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
