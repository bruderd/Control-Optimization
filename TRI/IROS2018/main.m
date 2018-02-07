% main.m

% Set the values of all of the system parameters
Gama = deg2rad([40, -40, 89]);
R = 0.009525 * ones(1,3);
L = 0.1 * ones(1,3);
d = zeros(3,3);
p = [0,0,0 ; 0,0,0 ; 1,1,1];
Pmax = [103.421e3, 103.421e3, 103.421e3];   % kPa = 15psi
params = setParams(Gama, R, L, d, p, Pmax);

% Set the value of test parameters
testParams = struct;
testParams.Psteps = 4;     % how finely to break up Pmax
testParams.stest = [0, 5, 5, -5, -5];   % mm
testParams.wtest = [0, 20,-20, 20, -20];    % deg
testParams.TRmax = 103.421e3;   % kPa = 15psi

% Calculate the force zonotope
[zntp, vx, vy] = zonotopeFun(params);

% Create csv of the test data points
testPoints = setTestPoints(testParams, params);
% Need to convert these to voltages before writing to csv or tsv
testPoints = testPoints * diag([0.033418, 1, 10/testParams.TRmax, 10/testParams.TRmax, 10/testParams.TRmax]);
csvwrite('testPoints.csv',testPoints);      % exports testPoint to csv file
dlmwrite('testPoints.txt',testPoints, 'delimiter', '\t', 'newline', 'pc');