function [zeta0, xdot] = manipulatorBlock( zeta, xdot0, x , params)
%manipulatorBlock: Relates module torques to manipulator torques in global
%frame
%   Detailed explanation goes here

invJx = Jxinv(x);   % invert coordinate transformation Jacobian to go from global to local coordinates

%% set output values
xdot = invJx * xdot0;
zeta0 = invJx' * zeta;

end