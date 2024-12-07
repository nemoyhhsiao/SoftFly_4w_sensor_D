function att = RotmToEuler(R)
    % Extract the values from the rotation matrix
    r11 = R(1,1);
    r21 = R(2,1);
    r31 = R(3,1);
    r32 = R(3,2);
    r33 = R(3,3);

    % Calculate the pitch angle (theta)
    pitch = CustomAtan2(-r31, sqrt(r32^2 + r33^2));

    % Calculate the roll angle (phi)
    roll = CustomAtan2(r32, r33);

    % Calculate the yaw angle (psi)
    yaw = CustomAtan2(r21, r11);
    att=[roll;pitch;yaw];
end