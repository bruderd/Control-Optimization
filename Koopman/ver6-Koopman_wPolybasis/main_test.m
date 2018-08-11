function [ output_args ] = main_test( getData )
%main_test: A generic "main" function for development and testing
%   Detailed explanation goes here


%% Define system parameters
params = struct;

% Koopman Sysid parameters
params.n = 4;   % dimension of state space (including state derivatives)
params.p = 1;   % dimension of input
params.naug = params.n + params.p; % dimension of augmented state (DNE)

% select maximum degrees for monomial bases (NOTE: m1 = 1)
params.maxDegree = 5;   % maximum degree of vector field monomial basis
params.m1 = 1;  % maximum degree of observables to be mapped through Lkj (DNE)

% define lifting function and basis
params = def_polyLift(params);  % creates polynomial lifting function, polyLift

% choose whether or not to take numerical derivatives of states ('on' or 'off')
params.numericalDerivs = 'off';

params.Ts = 1/30;   % sampling period

% animation parameters
params.fps                 = 30;
params.movie               = true;

% parameters for generating data
params.numTrials = 6;
params.observe = ones(1, params.n);    % row vector choosing which states to observe
params.inputType = 'sinusoid';
params.vf_real = @vf_doublePendulum;
params.ampRange = [0, 5];       % amplitude range of sinusoidal inputs
params.freqRange = [0, 10];     % frequency range of sinusoidal inputs
params.amp = [];
params.freq = [];
params.x0min = [-pi/2, -pi/2, 0, 0];
params.x0max = [pi/2, pi/2, 0, 0];
params.uType = 'sinusoid';
params.mean                = 0;     % mean of noise 
params.sigma               = 0.01;     % standard dev of noise
params.duration            = 10;   % in seconds
params.systemName          = 'doublePendulum';  % name of current system

% parameters that are specific to chosen system
params.phi1                = pi/6; % (pi/2)*rand - pi/4;
params.dtphi1              = 0;
params.phi2                = -pi/4.5; % (pi/2)*rand - pi/4;
params.dtphi2              = 0;
params.g                   = 9.81; 
params.m1                  = 1; 
params.m2                  = 1; 
params.l1                  = 1; 
params.l2                  = 1;

%% Generate or load data from file

addpath('generateData');

if strcmp(getData, 'sim')
    data = gen_data_fromSim( params );
elseif strcmp(getData, 'exp')
    data = gen_data_fromExp( params );
elseif strcmp(getData, 'file')
    % Prompt user to identify data file
    [data_file,data_path] = uigetfile;
    matcontents = load([data_path, data_file]); % must be a .mat file
    data = matcontents.data;
end

rmpath('generateData')

%% Use Koopman operator to perform sysid

koopman = koopmanSysid(data.snapshotPairs, params);

end

