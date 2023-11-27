function [rbt] = make_robot()

    % Robot pysical parameters
    rbt.m = 4 * 190e-6;      % mass in kg
    rbt.ixx = 0.438*1e-7;    % MoI
    rbt.iyy = 0.438*1e-7;    % MoI
    rbt.izz = 0.438*1e-7 * 4;  % MoI
    rbt.ld = (15) * 1e-3;    % moment arm
    rbt.lt = (15) * 1e-3;    % moment arm

    % Robot thrust vector offset
    rbt.angle_offset.x = -0.06;
    rbt.angle_offset.y = -0.025;

    % Inclined stroke-plane version
    rbt.til = 0;

    % rbt.base.th = 0.0 * rbt.m;
    % rbt.base.xt = 0.0 * 1e-5;
    % rbt.base.yt = 0.0 * 1e-5;
    % rbt.base.zt = 0.0 * 1e-5;

    % rbt.A = [ones(1,4); ...
    %     rbt.lt * [-1, 1, 1, -1]; ...
    %     -rbt.ld * [1, 1, -1, -1]];
    % rbt.Apinv = pinv(rbt.A);
    % rbt.A2 = [1 * cosd(rbt.til) * [1, 1, 1, 1]; ...
    %     rbt.lt * cosd(rbt.til) * [-1, 1, 1, -1]; ...
    %     rbt.ld * cosd(rbt.til) * [-1, -1, 1, 1]; ...
    %     rbt.ld * sind(rbt.til) * [1, -1, 1, -1]];
    % if rbt.til == 0
    %     rbt.A2inv = zeros(4, 4);
    % else
    %     rbt.A2inv = inv(rbt.A2);
    % end

    % Original robot lift to voltage mapping (Nature 19 to Sci Rob 23)
    % rbt.VM_robot_1 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    % rbt.VM_robot_2 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    % rbt.VM_robot_3 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    % rbt.VM_robot_4 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    % rbt.VM_input1 = [rbt.VM_robot_1(1) rbt.VM_robot_2(1) rbt.VM_robot_3(1) rbt.VM_robot_4(1)];
    % rbt.VM_input2 = [rbt.VM_robot_1(2) rbt.VM_robot_2(2) rbt.VM_robot_3(2) rbt.VM_robot_4(2)];
    % rbt.VM2 = sqrt(4 / (rbt.m * mdl.g)) * 1600;
    % rbt.DV_flip = [0 0 0 0];
    
end
