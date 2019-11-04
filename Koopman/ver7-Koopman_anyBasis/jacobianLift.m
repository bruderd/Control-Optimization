function dlift = jacobianLift(in1,u1)
%JACOBIANLIFT
%    DLIFT = JACOBIANLIFT(IN1,U1)

%    This function was generated by the Symbolic Math Toolbox version 8.3.
%    29-Oct-2019 21:00:04

x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
t2 = u1.*x1;
t3 = u1.*x2;
t4 = u1.*x3;
t5 = u1.^2;
t6 = x1.^2;
t7 = x2.^2;
t8 = x3.^2;
t9 = x1.*x2.*2.0;
t10 = x1.*x3.*2.0;
t11 = x2.*x3.*2.0;
dlift = reshape([0.0,1.0,0.0,0.0,0.0,x1.*2.0,x2,0.0,x3,0.0,0.0,u1,0.0,0.0,0.0,t6.*3.0,t9,t7,0.0,t10,x2.*x3,0.0,t8,0.0,0.0,t2.*2.0,t3,0.0,t4,0.0,0.0,t5,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,x1,x2.*2.0,0.0,x3,0.0,0.0,u1,0.0,0.0,0.0,t6,t9,t7.*3.0,0.0,x1.*x3,t11,0.0,t8,0.0,0.0,t2,t3.*2.0,0.0,t4,0.0,0.0,t5,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,x1,x2,x3.*2.0,0.0,0.0,u1,0.0,0.0,0.0,0.0,0.0,t6,x1.*x2,t7,t10,t11,t8.*3.0,0.0,0.0,0.0,t2,t3,t4.*2.0,0.0,0.0,t5,0.0],[35,3]);
