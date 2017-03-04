% solve_FB- just solves for the tension forces given a pressure and a given
%   FREE geometry


function [Tgama, Tbetta, P, gama, betta, r, L, phi] = solveFB_v2(P_test, x_rest)


[P0, gama0, betta0, r0, L0, phi0] = deal(x_rest(1), x_rest(2), x_rest(3), x_rest(4), x_rest(5), x_rest(6));

x_test = [P_test, gama0, betta0, r0, L0, phi0];

% LB = [0, 0, P_test+1e-3, -pi/2, -pi/2, r0, 0, -inf]; 
% UB = [inf, inf, P_test+1e-3, pi/2, pi/2, inf, inf, inf];

dx = 1e-3;

LB = [P_test-dx, gama0-dx, betta0-dx, r0-dx, L0-dx, phi0-dx, 0, 0]; 
UB = [P_test+dx, gama0+dx, betta0+dx, r0-dx, L0+dx, phi0+dx, Inf, Inf];

% solver variable
x = lsqnonlin(@(x) FB_v2(x, P_test, [x_rest, 0, 0], [x_rest, 0, 0]), [x_rest, 0, 0], LB, UB);
% x = fsolve(@(x)FB_v2(x, P_test, [x_rest, 0, 0], [x_rest, 0, 0]), [x_rest, 0, 0]);

Tgama = x(7);
Tbetta = x(8);
P = x(1);
gama = x(2);
betta = x(3);
r = x(4);
L = x(5);
phi = x(6);

end