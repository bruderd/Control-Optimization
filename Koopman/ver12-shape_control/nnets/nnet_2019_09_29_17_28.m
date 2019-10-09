function [Y,Xf,Af] = nnet_2019_09_29_17_28(X,~,~)
%NNET_2019_09_29_17_28 neural network simulation function.
%
% Auto-generated by MATLAB, 29-Sep-2019 17:28:58.
% 
% [Y] = nnet_2019_09_29_17_28(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-1.61801073815431;-1.39324170180633;-1.38506603689883];
x1_step1.gain = [0.62315006696931;0.699300701065174;0.658357661796093];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.0679279329878719196;1.7162209816389366601;0.40849429957899890953;-0.99563927801724272371;0.079475012201370820453;-0.047976753445657528696;0.57788916885889529684;-0.92006090669271001214;-0.64029225558426339227;1.9499245285157495999];
IW1_1 = [-2.1438224917046975193 0.053356536683290690937 -1.9860089045252826701;-0.92602487729421956164 -0.79552983042525682311 -1.3796166068308193253;-2.8319703171576522394 4.3871930937304721709 1.9315287178124449508;0.63664447443373228808 -0.12251694198476453801 -1.1196860612724437445;-2.6655088620028282165 0.28197635426908912448 3.9103193535085210009;-0.2862064407725567472 -0.43086197267514980691 -0.55448775755518631136;0.42823105724165311248 -0.075463247274437414425 -0.75808554186797727503;0.150656371131220157 -0.48076143369632157176 0.21289296234544335951;-0.12131119403112229638 0.44431859044556709648 -0.19725375122208055334;0.68254897147039794714 0.80688882081125457013 1.1219229378256740937];

% Layer 2
b2 = [-0.05685964157681452219;-0.54382103902882938939;-0.23597134208161249513];
LW2_1 = [0.072374748618738785066 -0.13180715470733703198 -0.0047972235194254277818 -0.42869741301641528519 0.014928215096150623808 -0.69554438486261660479 -0.81229756882740999924 -1.2103886873514919653 1.3942428626778924361 0.19032212451817914767;0.13131999199128008282 -0.19110348894435646994 0.012592131560673147997 0.77282617102760031713 -0.0020145831308069077521 -1.0163515213349596511 1.4701130344943953432 -0.76272402578813891516 0.83797609511476300881 0.23705205353098865451;0.21669749711078234444 -0.39162453756165177543 -0.0039761247201785098609 0.37437403371720867629 -0.0019193072462120545213 -1.6947503900350864292 0.74361075819000987952 1.7072908107930961918 -1.8211498778829318113 0.49380331169031010941];

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