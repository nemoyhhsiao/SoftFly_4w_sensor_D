function [R] = pakpongs_euler_to_rotm(euler_angles)
eu_x = euler_angles(1);
eu_y = euler_angles(2);
eu_z = euler_angles(3);

R = [cos(eu_y)*cos(eu_z); -cos(eu_y)*sin(eu_z); sin(eu_y); ...
    cos(eu_x)*sin(eu_z)+sin(eu_x)*sin(eu_y)*cos(eu_z); cos(eu_x)*cos(eu_z)-sin(eu_x)*sin(eu_y)*sin(eu_z); -sin(eu_x)*cos(eu_y); ...
    sin(eu_x)*sin(eu_z)-cos(eu_x)*sin(eu_y)*cos(eu_z); sin(eu_x)*cos(eu_z)+cos(eu_x)*sin(eu_y)*sin(eu_z); cos(eu_x)*cos(eu_y)];

R = unflatten_rotm(R);
end
