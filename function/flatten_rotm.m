function [R] = flatten_rotm(R)
%FLATTEN_ROTM Transforms a 3x3 rotation matrix in a 9 x 1 (column) vector
% The rotation matrix is flattened by rows
R = [R(1,1); R(1, 2); R(1, 3); ...
    R(2, 1); R(2, 2); R(2, 3); ...
    R(3, 1); R(3, 2); R(3, 3)];
end

