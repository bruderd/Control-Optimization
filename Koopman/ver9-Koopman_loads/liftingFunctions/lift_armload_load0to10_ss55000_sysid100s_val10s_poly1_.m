function polyBasis = stateLift(in1)
%STATELIFT
%    POLYBASIS = STATELIFT(IN1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    29-Mar-2019 17:46:03

x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
polyBasis = [x1;x2;x3;1.0];
