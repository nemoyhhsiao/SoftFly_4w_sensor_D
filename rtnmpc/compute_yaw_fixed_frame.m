function [R_wi, R_ib] = compute_yaw_fixed_frame(R_wb, align_x)
% Creates the yaw-fixed reference frame (denoted as i).
% Inputs:
%   R_wb: 3x3 rotation matrix mapping vector in body to world
%         w_r = R_wb * b_r; w_r: vector in world; w_b: vector in body
% 
%   align_x: see below:
%  
% Note: we are assume that the thrust vector of the robot is never
% parallel to the world vector used for the alignent. 
% use align_x = false if the flip causes the body axis to be parallel
% to the world x axis

% thrust should be the same as the current thrust
iz = R_wb(:, 3);

if align_x 
    % we want ix aligned with wx
    wx = [1; 0; 0;];
    
    % we project wx 
    iy = cross(iz, wx) / norm(cross(iz, wx));
    
    % we compute the remaining vector 
    ix = cross(iy, iz);
        
else
    % we want iy aligned with wy
    wy = [0; 1; 0;];

    % we project wx 
    ix = cross(wy, iz) / norm(cross(wy, iz));

    % we compute the remaining vector 
    iy = cross(iz, ix);

end

R_wi = [ix(:), iy(:), iz(:)];

R_bi = R_wb'*R_wi;
R_ib = R_bi';

end