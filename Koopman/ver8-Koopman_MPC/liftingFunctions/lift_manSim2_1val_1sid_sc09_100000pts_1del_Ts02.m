function polyBasis = stateLift(in1)
%STATELIFT
%    POLYBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    02-Jan-2019 17:20:53

ud1 = in1(5,:);
ud2 = in1(6,:);
x1 = in1(1,:);
x2 = in1(2,:);
xd1 = in1(3,:);
xd2 = in1(4,:);
t2 = x1.^2;
t3 = x2.^2;
t4 = xd1.^2;
t5 = xd2.^2;
t6 = ud1.^2;
t7 = ud2.^2;
polyBasis = [x1;x2;xd1;xd2;ud1;ud2;t2;x1.*x2;t3;x1.*xd1;x2.*xd1;t4;x1.*xd2;x2.*xd2;xd1.*xd2;t5;ud1.*x1;ud1.*x2;ud1.*xd1;ud1.*xd2;t6;ud2.*x1;ud2.*x2;ud2.*xd1;ud2.*xd2;ud1.*ud2;t7;t2.*x1;t2.*x2;t3.*x1;t3.*x2;t2.*xd1;x1.*x2.*xd1;t3.*xd1;t4.*x1;t4.*x2;t4.*xd1;t2.*xd2;x1.*x2.*xd2;t3.*xd2;x1.*xd1.*xd2;x2.*xd1.*xd2;t4.*xd2;t5.*x1;t5.*x2;t5.*xd1;t5.*xd2;t2.*ud1;ud1.*x1.*x2;t3.*ud1;ud1.*x1.*xd1;ud1.*x2.*xd1;t4.*ud1;ud1.*x1.*xd2;ud1.*x2.*xd2;ud1.*xd1.*xd2;t5.*ud1;t6.*x1;t6.*x2;t6.*xd1;t6.*xd2;t6.*ud1;t2.*ud2;ud2.*x1.*x2;t3.*ud2;ud2.*x1.*xd1;ud2.*x2.*xd1;t4.*ud2;ud2.*x1.*xd2;ud2.*x2.*xd2;ud2.*xd1.*xd2;t5.*ud2;ud1.*ud2.*x1;ud1.*ud2.*x2;ud1.*ud2.*xd1;ud1.*ud2.*xd2;t6.*ud2;t7.*x1;t7.*x2;t7.*xd1;t7.*xd2;t7.*ud1;t7.*ud2;t2.^2;t2.*x1.*x2;t2.*t3;t3.*x1.*x2;t3.^2;t2.*x1.*xd1;t2.*x2.*xd1;t3.*x1.*xd1;t3.*x2.*xd1;t2.*t4;t4.*x1.*x2;t3.*t4;t4.*x1.*xd1;t4.*x2.*xd1;t4.^2;t2.*x1.*xd2;t2.*x2.*xd2;t3.*x1.*xd2;t3.*x2.*xd2;t2.*xd1.*xd2;x1.*x2.*xd1.*xd2;t3.*xd1.*xd2;t4.*x1.*xd2;t4.*x2.*xd2;t4.*xd1.*xd2;t2.*t5;t5.*x1.*x2;t3.*t5;t5.*x1.*xd1;t5.*x2.*xd1;t4.*t5;t5.*x1.*xd2;t5.*x2.*xd2;t5.*xd1.*xd2;t5.^2;t2.*ud1.*x1;t2.*ud1.*x2;t3.*ud1.*x1;t3.*ud1.*x2;t2.*ud1.*xd1;ud1.*x1.*x2.*xd1;t3.*ud1.*xd1;t4.*ud1.*x1;t4.*ud1.*x2;t4.*ud1.*xd1;t2.*ud1.*xd2;ud1.*x1.*x2.*xd2;t3.*ud1.*xd2;ud1.*x1.*xd1.*xd2;ud1.*x2.*xd1.*xd2;t4.*ud1.*xd2;t5.*ud1.*x1;t5.*ud1.*x2;t5.*ud1.*xd1;t5.*ud1.*xd2;t2.*t6;t6.*x1.*x2;t3.*t6;t6.*x1.*xd1;t6.*x2.*xd1;t4.*t6;t6.*x1.*xd2;t6.*x2.*xd2;t6.*xd1.*xd2;t5.*t6;t6.*ud1.*x1;t6.*ud1.*x2;t6.*ud1.*xd1;t6.*ud1.*xd2;t6.^2;t2.*ud2.*x1;t2.*ud2.*x2;t3.*ud2.*x1;t3.*ud2.*x2;t2.*ud2.*xd1;ud2.*x1.*x2.*xd1;t3.*ud2.*xd1;t4.*ud2.*x1;t4.*ud2.*x2;t4.*ud2.*xd1;t2.*ud2.*xd2;ud2.*x1.*x2.*xd2;t3.*ud2.*xd2;ud2.*x1.*xd1.*xd2;ud2.*x2.*xd1.*xd2;t4.*ud2.*xd2;t5.*ud2.*x1;t5.*ud2.*x2;t5.*ud2.*xd1;t5.*ud2.*xd2;t2.*ud1.*ud2;ud1.*ud2.*x1.*x2;t3.*ud1.*ud2;ud1.*ud2.*x1.*xd1;ud1.*ud2.*x2.*xd1;t4.*ud1.*ud2;ud1.*ud2.*x1.*xd2;ud1.*ud2.*x2.*xd2;ud1.*ud2.*xd1.*xd2;t5.*ud1.*ud2;t6.*ud2.*x1;t6.*ud2.*x2;t6.*ud2.*xd1;t6.*ud2.*xd2;t6.*ud1.*ud2;t2.*t7;t7.*x1.*x2;t3.*t7;t7.*x1.*xd1;t7.*x2.*xd1;t4.*t7;t7.*x1.*xd2;t7.*x2.*xd2;t7.*xd1.*xd2;t5.*t7;t7.*ud1.*x1;t7.*ud1.*x2;t7.*ud1.*xd1;t7.*ud1.*xd2;t6.*t7;t7.*ud2.*x1;t7.*ud2.*x2;t7.*ud2.*xd1;t7.*ud2.*xd2;t7.*ud1.*ud2;t7.^2;1.0];
