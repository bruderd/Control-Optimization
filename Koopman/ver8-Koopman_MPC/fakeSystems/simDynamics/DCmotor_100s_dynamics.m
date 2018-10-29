function xdot = DCmotor_100s_dynamics(in1,u1)
%DCMOTOR_100S_DYNAMICS
%    XDOT = DCMOTOR_100S_DYNAMICS(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    29-Oct-2018 14:42:27

x1 = in1(1,:);
x2 = in1(2,:);
xdot = [x1.*(-3.931528662420382e1)-u1.*x2.*(2.53e2./3.14e2)+1.910828025477707e2;x2.*(-2.44e2./1.47e2)+u1.*x1.*5.736961451247166e1-1.0e3./3.0];
