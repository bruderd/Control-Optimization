function [Y,Xf,Af] = nnet_2019_09_29_17_31(X,~,~)
%NNET_2019_09_29_17_31 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Sep-2019 17:31:31.
% 
% [Y] = nnet_2019_09_29_17_31(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 3xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-2.50566973365884;-2.25694169526187;-2.31692614454142];
x1_step1.gain = [0.385388843904636;0.454451989534436;0.464244179672087];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.2186615202969028893;-3.1160514461029964473;-0.94834764788212155828;1.0517931710603356521;0.03385255106266574221;-0.022690652823017729012;0.5122052845238607155;0.87147330287362778645;2.8952585707541107496;2.8004060916244659651];
IW1_1 = [-1.353412157401019833 0.17476647816939158697 -1.2355455472220231439;2.1689525194599155178 0.89650744247314484436 -1.0506979963543423562;1.1184590085051622221 -1.3882875362271345221 -0.85347739849282000524;-0.58211392679573881193 -1.9766722440992972043 -2.8925584231128005364;0.39617195883839984027 -0.00096300057884938020103 0.3781949440705612564;-0.28134067868442358407 -0.3765438963147435536 0.2695360397042654288;0.63434243681244739665 -0.71187938802405803518 -0.46505861855963609441;0.74911944693309251431 -0.44563868222259828134 -0.6420005350550420653;1.2334297142339978315 2.2814836215302554123 0.14026213072683199612;1.3160752128264732175 0.54010054564082243811 0.46938245138900702713];

% Layer 2
b2 = [0.49773525560304643367;1.0839727178053288892;-0.23920129139622628434];
LW2_1 = [-0.5170197767394654198 -0.104385806659853142 -0.063245502342686249486 -0.00081514970480332576627 0.36678796966074639352 -2.8161435369247160843 -0.099097317485267635839 -0.07173184150255006164 -0.094125649301120731249 0.020819649470495360521;-1.3169318131262957028 -0.24156450406052534796 0.023730874920192497612 0.015036840867372362404 2.8543717028632578092 0.072285552471729450086 0.31694008196445011549 -0.20713872005753178329 -0.14353758621954421093 0.0095203566926209681753;0.37027857333746266866 -0.10759094316650588685 0.42942277403212286702 0.015475600214713829128 -0.27987088272204618811 -0.43359336163193390457 1.483621217603946052 -0.15359333711718023419 0.085868185503653160495 -0.48894162919164790848];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [1;1;1];
y1_step1.xoffset = [-1;-1;-1];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end
