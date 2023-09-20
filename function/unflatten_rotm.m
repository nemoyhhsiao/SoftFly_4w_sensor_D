function [R] = unflatten_rotm(R)
% UNFLATTEN_ROTM Unflattens a 9 x 1 vector in a 3 x 3 rotation matrix
%   The rotation matrix is assumed to be store in the column vector by rows
R11 = R(1);
R12 = R(2);
R13 = R(3);
R21 = R(4);
R22 = R(5);
R23 = R(6);
R31 = R(7);
R32 = R(8);
R33 = R(9);
R1 = [R11; R21; R31];     % unit (column) vector
R2 = [R12; R22; R32];
R3 = [R13; R23; R33];
R = [R1, R2, R3];
end

