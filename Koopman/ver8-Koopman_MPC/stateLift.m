function polyBasis = stateLift(in1)
%STATELIFT
%    POLYBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    23-Oct-2018 18:35:16

x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
x4 = in1(4,:);
t2 = x1.^2;
t3 = x2.^2;
t4 = x3.^2;
t5 = x4.^2;
t6 = t2.^2;
t7 = t3.^2;
t8 = t4.^2;
t9 = t5.^2;
polyBasis = [1.0;x1;x2;x3;x4;t2;x1.*x2;t3;x1.*x3;x2.*x3;t4;x1.*x4;x2.*x4;x3.*x4;t5;t2.*x1;t2.*x2;t3.*x1;t3.*x2;t2.*x3;x1.*x2.*x3;t3.*x3;t4.*x1;t4.*x2;t4.*x3;t2.*x4;x1.*x2.*x4;t3.*x4;x1.*x3.*x4;x2.*x3.*x4;t4.*x4;t5.*x1;t5.*x2;t5.*x3;t5.*x4;t6;t2.*x1.*x2;t2.*t3;t3.*x1.*x2;t7;t2.*x1.*x3;t2.*x2.*x3;t3.*x1.*x3;t3.*x2.*x3;t2.*t4;t4.*x1.*x2;t3.*t4;t4.*x1.*x3;t4.*x2.*x3;t8;t2.*x1.*x4;t2.*x2.*x4;t3.*x1.*x4;t3.*x2.*x4;t2.*x3.*x4;x1.*x2.*x3.*x4;t3.*x3.*x4;t4.*x1.*x4;t4.*x2.*x4;t4.*x3.*x4;t2.*t5;t5.*x1.*x2;t3.*t5;t5.*x1.*x3;t5.*x2.*x3;t4.*t5;t5.*x1.*x4;t5.*x2.*x4;t5.*x3.*x4;t9;t6.*x1;t6.*x2;t2.*t3.*x1;t2.*t3.*x2;t7.*x1;t7.*x2;t6.*x3;t2.*x1.*x2.*x3;t2.*t3.*x3;t3.*x1.*x2.*x3;t7.*x3;t2.*t4.*x1;t2.*t4.*x2;t3.*t4.*x1;t3.*t4.*x2;t2.*t4.*x3;t4.*x1.*x2.*x3;t3.*t4.*x3;t8.*x1;t8.*x2;t8.*x3;t6.*x4;t2.*x1.*x2.*x4;t2.*t3.*x4;t3.*x1.*x2.*x4;t7.*x4;t2.*x1.*x3.*x4;t2.*x2.*x3.*x4;t3.*x1.*x3.*x4;t3.*x2.*x3.*x4;t2.*t4.*x4;t4.*x1.*x2.*x4;t3.*t4.*x4;t4.*x1.*x3.*x4;t4.*x2.*x3.*x4;t8.*x4;t2.*t5.*x1;t2.*t5.*x2;t3.*t5.*x1;t3.*t5.*x2;t2.*t5.*x3;t5.*x1.*x2.*x3;t3.*t5.*x3;t4.*t5.*x1;t4.*t5.*x2;t4.*t5.*x3;t2.*t5.*x4;t5.*x1.*x2.*x4;t3.*t5.*x4;t5.*x1.*x3.*x4;t5.*x2.*x3.*x4;t4.*t5.*x4;t9.*x1;t9.*x2;t9.*x3;t9.*x4;t2.*t6;t6.*x1.*x2;t3.*t6;t2.*t3.*x1.*x2;t2.*t7;t7.*x1.*x2;t3.*t7;t6.*x1.*x3;t6.*x2.*x3;t2.*t3.*x1.*x3;t2.*t3.*x2.*x3;t7.*x1.*x3;t7.*x2.*x3;t4.*t6;t2.*t4.*x1.*x2;t2.*t3.*t4;t3.*t4.*x1.*x2;t4.*t7;t2.*t4.*x1.*x3;t2.*t4.*x2.*x3;t3.*t4.*x1.*x3;t3.*t4.*x2.*x3;t2.*t8;t8.*x1.*x2;t3.*t8;t8.*x1.*x3;t8.*x2.*x3;t4.*t8;t6.*x1.*x4;t6.*x2.*x4;t2.*t3.*x1.*x4;t2.*t3.*x2.*x4;t7.*x1.*x4;t7.*x2.*x4;t6.*x3.*x4;t2.*x1.*x2.*x3.*x4;t2.*t3.*x3.*x4;t3.*x1.*x2.*x3.*x4;t7.*x3.*x4;t2.*t4.*x1.*x4;t2.*t4.*x2.*x4;t3.*t4.*x1.*x4;t3.*t4.*x2.*x4;t2.*t4.*x3.*x4;t4.*x1.*x2.*x3.*x4;t3.*t4.*x3.*x4;t8.*x1.*x4;t8.*x2.*x4;t8.*x3.*x4;t5.*t6;t2.*t5.*x1.*x2;t2.*t3.*t5;t3.*t5.*x1.*x2;t5.*t7;t2.*t5.*x1.*x3;t2.*t5.*x2.*x3;t3.*t5.*x1.*x3;t3.*t5.*x2.*x3;t2.*t4.*t5;t4.*t5.*x1.*x2;t3.*t4.*t5;t4.*t5.*x1.*x3;t4.*t5.*x2.*x3;t5.*t8;t2.*t5.*x1.*x4;t2.*t5.*x2.*x4;t3.*t5.*x1.*x4;t3.*t5.*x2.*x4;t2.*t5.*x3.*x4;t5.*x1.*x2.*x3.*x4;t3.*t5.*x3.*x4;t4.*t5.*x1.*x4;t4.*t5.*x2.*x4;t4.*t5.*x3.*x4;t2.*t9;t9.*x1.*x2;t3.*t9;t9.*x1.*x3;t9.*x2.*x3;t4.*t9;t9.*x1.*x4;t9.*x2.*x4;t9.*x3.*x4;t5.*t9];
