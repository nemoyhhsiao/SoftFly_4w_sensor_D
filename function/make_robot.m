function [rbt] = make_robot(mdl)
    rbt.m = 4 * 180e-6;
    rbt.base.th = 0.0 * rbt.m;
    rbt.base.xt = 0.0 * 1e-5;
    rbt.base.yt = 0.0 * 1e-5;
    rbt.base.zt = 0.0 * 1e-5;
    rbt.offset.x = 0;
    rbt.offset.y = 0;
    rbt.ixx = 2.4 * 48e-9;
    rbt.iyy = 1.3 * 270e-9;
    rbt.izz = 1.2 * 320e-9;
    rbt.ld = (14 + 8) * 1e-3;
    rbt.lw = (6.3 + 4) * 1e-3;
    rbt.lt = (7.0 + 1.5 + 3.5) * 1e-3;
    rbt.til = 0;
    rbt.A = [ones(1,4); ...
        rbt.lt * [-1, 1, 1, -1]; ...
        -rbt.ld * [1, 1, -1, -1]];
    rbt.Apinv = pinv(rbt.A);
    rbt.A2 = [1 * cosd(rbt.til) * [1, 1, 1, 1]; ...
        rbt.lt * cosd(rbt.til) * [-1, 1, 1, -1]; ...
        rbt.ld * cosd(rbt.til) * [-1, -1, 1, 1]; ...
        rbt.ld * sind(rbt.til) * [1, -1, 1, -1]];
    if rbt.til == 0
        rbt.A2inv = zeros(4, 4);
    else
        rbt.A2inv = inv(rbt.A2);
    end
    rbt.VM_robot_1 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    rbt.VM_robot_2 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    rbt.VM_robot_3 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    rbt.VM_robot_4 = [180 * 9.8e-6, 1; 200 * 9.8e-6, 1] \ [1600; 1625];
    rbt.VM_input1 = [rbt.VM_robot_1(1) rbt.VM_robot_2(1) rbt.VM_robot_3(1) rbt.VM_robot_4(1)];
    rbt.VM_input2 = [rbt.VM_robot_1(2) rbt.VM_robot_2(2) rbt.VM_robot_3(2) rbt.VM_robot_4(2)];
    rbt.VM2 = sqrt(4 / (rbt.m * mdl.g)) * 1600;
    rbt.DV_flip = [0 0 0 0];
    load("thrust_to_voltage_poly_fit.mat")
    rbt.thrust_to_voltage_polyfit = thrust_to_voltage_poly_fit;
    load("thrust_error_poly_fit.mat")
    rbt.thrust_error_poly_fit = thrust_error_poly_fit;
end
