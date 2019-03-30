function polyBasis = stateLift(in1)
%STATELIFT
%    POLYBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    29-Mar-2019 19:52:36

x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
polyBasis = [x1;x2;x3;x1.^2;x1.*x2;x2.^2;x1.*x3;x2.*x3;x3.^2;1.0];
