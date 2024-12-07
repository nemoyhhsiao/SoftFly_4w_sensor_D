clear;
clc;
rbt = make_robot;
IxxVal = rbt.ixx;
IyyVal =rbt.iyy;
IzzVal = rbt.izz;
mVal =rbt.m;
gVal = 9.81;

syms x(t) y(t) z(t) m g thrust tao_roll tao_pitch phi(t) theta(t) psi(t) Ixx Iyy Izz p(t) q(t) r(t)

T = [ 1, 0, -sin(theta);0,cos(phi),cos(theta)*sin(phi);0, -sin(phi),cos(theta)*cos(phi)];
R = rotationMatrixEulerZYX(phi,theta,psi);

I = [Ixx, 0, 0; 0, Iyy, 0; 0, 0, Izz];
%J = T.'*I*T;
%dJ_dt = diff(J);
%h_dot_J = [diff(phi,t), diff(theta,t), diff(psi,t)]*J;
%grad_temp_h = transpose(jacobian(h_dot_J,[phi theta psi]));
%C = dJ_dt - 1/2*grad_temp_h;
%C = subsStateVars(C,t);

%phidot   = subsStateVars(diff(phi,t),t);
%thetadot = subsStateVars(diff(theta,t),t);
%psidot   = subsStateVars(diff(psi,t),t);
omega_B  = [p;q;r];
%P_B      = R\[diff(x,t); diff(y,t);diff(z,t)];
tau_beta = [tao_roll; tao_pitch; 0];

state    = [x; y; z; phi; theta; psi; diff(x,t); diff(y,t);diff(z,t);omega_B];
%state = [x; y; z; phi; theta; psi; diff(x,t); diff(y,t);diff(z,t);diff(phi,t); diff(theta,t); diff(psi,t)];
state = subsStateVars(state,t);

%dd stands for twice diff
angle_dot=T\omega_B;
p_dd =  -g*[0;0;1] + R*[0;0;thrust]/m;
%angluar_dd =J\(tau_beta - C*state(10:12));
omeg_B_dot=I\(tau_beta-cross(omega_B,(I*omega_B)));

f = [state(7:9);angle_dot;p_dd;omeg_B_dot];
f=simplify(f);

f = subsStateVars(f,t);


f = subs(f, [Ixx Iyy Izz  m g],[IxxVal IyyVal IzzVal  mVal gVal]);
f = simplify(f);
control = [thrust;tao_roll; tao_pitch];
% A = jacobian(f,state);
% B = jacobian(f,control);
% matlabFunction(A,B,'File','jacobianFcn', 'Vars',{state,control});
matlabFunction(f,'File','dynamicFcn', 'Vars',{state,control});

function stateExpr = subsStateVars(timeExpr,var)
if nargin == 1
    var = sym("t");
end
repDiff = @(ex) subsStateVarsDiff(ex,var);
stateExpr = mapSymType(timeExpr,"diff",repDiff);
repFun = @(ex) subsStateVarsFun(ex,var);
stateExpr = mapSymType(stateExpr,"symfunOf",var,repFun);
stateExpr = formula(stateExpr);
end

function newVar = subsStateVarsFun(funExpr,var)
name = symFunType(funExpr);
name = replace(name,"_Var","");
stateVar = "_" + char(var);
newVar = sym(name + stateVar);
end

function newVar = subsStateVarsDiff(diffExpr,var)
if nargin == 1
    var = sym("t");
end
c = children(diffExpr);
if ~isSymType(c{1},"symfunOf",var)
    % not f(t)
    newVar = diffExpr;
    return;
end
if ~any([c{2:end}] == var)
    % not derivative wrt t only
    newVar = diffExpr;
    return;
end
name = symFunType(c{1});
name = replace(name,"_Var","");
extension = "_" + join(repelem("d",numel(c)-1),"") + "ot";
stateVar = "_" + char(var);
newVar = sym(name + extension + stateVar);
end