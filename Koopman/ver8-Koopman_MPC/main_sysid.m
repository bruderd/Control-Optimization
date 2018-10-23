%main_sysid
%main_sysid: A generic "main" function for learning model from data
%   Performs linear system identification of nonlinear systems using a
%   lifting technique based on the Koopman operator projected onto a finite
%   monomial basis.
%
%   INPUTS:
%       getData is a string that specifies whether data will be generated
%       by simulation, from experimental measurements, or loaded from a 
%       file. Possible values are 'sim', 'exp', and 'file'.
%
%   OUTPUTS:
%       koopman is a struct containing the value of the learned Koopman
%       operator and other values related to the koopman sysid. See the
%       koopmanSysid function for more details.


%% Define system parameters (USER EDIT SECTION)
params = struct;

params.getData = 'file';            % ('exp, 'file', or 'sim')
params.basisID = 'poly';   % ('fourier' or 'poly' or 'fourier_sparser')

% parameters for reading in data (these affect how shapshot pairs built from raw data).
params.numTrials        = 1;        % numer of sysid trials
params.numVals          = 1;        % number of validation trials
params.Ts               = 0.02;     % sampling period
params.K                = 5000;     % numer of snapshotPairs to take
params.numericalDerivs  = false;    % choose whether or not to take numerical derivatives of states (boolean)
params.nd               = 1;        % number of delays to include in the snapshot pairs

params.systemName          = 'dp_100s_scale01_5000pts';  % name of current system
params.filterWindow        = floor( [1/params.Ts, 1/params.Ts] );  % if taking numerical derivatives, specifies the moving mean window before and after derivatives taken.

% Koopman Sysid parameters
params.n = 4;   % dimension of state space (including state derivatives)
params.p = 1;   % dimension of input
params.naug = params.n + params.p; % dimension of augmented state (DNE)
params.nzeta = params.n + params.nd * (params.naug);    % dimensinon of zeta (DNE)

% select maximum "degree" for basis elements (NOTE: m1 = 1)
params.maxDegree = 1;   % maximum degree of vector field monomial basis
params.m1 = 1;  % maximum degree of observables to be mapped through Lkj (DNE)

% define lifting function and basis
disp('Defining basis of observables...')
if strcmp(params.basisID, 'fourier')
    params = def_fourierLift(params);  % creates fourier lifting function, fourierLift;
elseif strcmp(params.basisID, 'poly')
    params = def_polyLift(params);  % creates polynomial lifting function, polyLift
elseif strcmp(params.basisID, 'fourier_sparser')
    params = def_fourierLift_sparser(params);
end
disp('Done.')

% Koopman sysid tuning parameters
params.t        = 5 * params.N; % penalty on model complexity
params.epsilon  = 1; % model accuracy tolerance (larger value = less accurate)
params.percSat  = 0.75;  % percentage of snapshot pairs that must satisfy accuracy tolerance

% output parameters
params.validateon          = true;  % boolean to decide whether to validate the model
params.ploton              = true;  % boolean to turn validation/error/compare plot on or off
params.compareon           = true;  % boolean to decide whether to convert to iddata and compare to validation data with Matlab compare function

%% Get training data
[data, some_snapshotPairs] = get_trainingData(params);

%% Learn the approximate Koopman operator and corresponding NL system
U               = get_KoopmanConstGen( some_snapshotPairs, params );
statespaceSys   = sysid_statespaceSys( U, some_snapshotPairs, params );
liftedSys       = sysid_liftedSys( U, params );

%% Simulate the results and compare to validation trial(s)
if params.validateon
    disp('Comparing to validation data set...');
    [error, koopsim] = koopmanValidation( data, params, statespaceSys );
    disp('Done.')
end

%% Convert to iddata and compare to validation data
if params.compareon
    disp('Converting to iddata format...');
    data4sysid = get_data4sysid( data , koopsim , params );
    disp('Done.')
end