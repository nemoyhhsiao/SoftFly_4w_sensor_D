
R_wb = eul2rotm([0, 0.1, 0.1]); % maps vector in body to world

[R_wi, R_ib] = compute_yaw_fixed_frame(R_wb, false);

assert (max(max(R_wb - R_wi*R_ib)) < 1e-5);