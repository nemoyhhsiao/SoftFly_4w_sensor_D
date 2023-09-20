function [x_ref] = traj_planner(t, N, traj_type, ctr)

T = ctr.rtmpc.pred_T; % model sampling time
x_ref = zeros(N*6, 1);
for i = 1:N
    if traj_type == 0
        [r, v] = step_circle(t + T*(i-1));
    elseif traj_type == 1
        [r, v] = hover_and_land(t + T*(i-1));   
    elseif traj_type == 2
        [r, v] = constant_ref(t, ctr);
    else 
        r = zeros(3,1);
        v = zeros(3,1);
    end
    x_ref(6*i-5:6*i, 1) = [r; v;];
end

end

function [r, v] = step_circle(t)

    
    r_ref = 0.05; 
    v_ref = 0.05236;
    omega = v_ref/r_ref;

    if t > 3.5
        
        t = t - 3.5;
    
        c = cos(omega*t - pi/2);
        s = sin(omega*t - pi/2);
    
        r = zeros(3,1);
        r(1) = r_ref*c;
        r(2) = 0;
        r(3) = 0.01 + r_ref + r_ref*s; 
    
        v = zeros(3,1);
        v(1) = -v_ref*s;
        v(2) = 0;
        v(3) = v_ref*c;
        
    else
        r = [0; 0; 0.01];
        v = [0; 0; 0];
    end

end

function [r0, v0] = constant_ref(t, ctr)
    r0 = [ctr.setpoint.x; ctr.setpoint.y; ctr.setpoint.z];
    v0 = zeros(3,1);
end

function [r0, v0] = hover_and_land(t)
   mission_init_time = 2.5;
   land_time = 4.5;
   transition_time = 1.0;
   r_ground = [0.0; 0.0; 0.0];
   %r_air = [0.03; 0.03; 0.03];
   r_air = [0.03; 0.03; 0.03];
%    r_ground = [0; 0; 0.01];
%    r_air = [0.01; 0.01; 0.1];
   t_mission = t - mission_init_time;
   if t_mission < 0.0 % stay on ground
    r0 = r_ground;
    v0 = zeros(3,1);
   elseif (t_mission > 0.0) && (t_mission <= land_time)  % take off
    [r0, v0] = go(t_mission, transition_time, r_ground, r_air);
   else % land
    [r0, v0] = go(t_mission - land_time, transition_time, r_air, r_ground);
   end
end

function [r0, v0] = go(elapsed_time, transition_time, orig, dest)

if elapsed_time > transition_time
    r0 = dest;
    v0 = zeros(3,1);
elseif elapsed_time <= 0.0
    r0 = orig;
    v0 = zeros(3,1);
else
    frac = elapsed_time/transition_time;
    delta_pos = (dest - orig);
    r0 = orig + frac*delta_pos;
    v0 = zeros(3,1);
end
end