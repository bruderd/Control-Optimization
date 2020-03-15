function [ yplus , xplus ] = vf_siso(k,x,u)
%vf_siso: Dynamics of sample discrete dynamical system (SISO)
%   Detailed explanation goes here

%% Linear system (with nonlinear output mapping)
A = [ 1 , 0.01 ; -0.01 , 1]; B = [0 ; 0.01];

xplus = A * x + B * u(k);  % linear dynamics

% yplus = xplus(1);   % linear output map
% yplus = sin( xplus(1) ) + xplus(1)*xplus(2);   % nonlinear output map
yplus = 5*sin( 10 * xplus(1) ) + xplus(1)*xplus(2) - xplus(2)^3;   % nonlinear output map


end
