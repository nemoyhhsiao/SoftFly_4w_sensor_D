function [R] = normalize_rotm(Rin)
%NORMALIZE_ROTM Normalizes a given 3x3 matrix
% and outputs a rows-normalized 3x3 rotation matrix
% TODO: not sure this is guaranteed to be orthonotmal
% TODO: look into matlab function https://www.mathworks.com/help/uav/ref/se2.normalize.html
Rin = flatten_rotm(Rin);
Rm = [Rin(1:3)./norm(Rin(1:3)),Rin(4:6)./norm(Rin(4:6)),Rin(7:9)./norm(Rin(7:9))];
Rout = [Rm(:,1);Rm(:,2);Rm(:,3)];
R = unflatten_rotm(Rout);
end

