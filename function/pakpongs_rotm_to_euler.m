function [eu] = pakpongs_rotm_to_euler(Rm)
% euler angles
euy = asin(min(max(Rm(1,3),-1),1));
eux = atan2(-Rm(2,3),Rm(3,3));
euz = atan2(-Rm(1,2),Rm(1,1));
%euz=acos(min(max(Rm(1,1)/cos(euy),-1),1));
%eux=acos(min(max(Rm(3,3)/cos(euy),-1),1));
eu = [eux;euy;euz];
end

