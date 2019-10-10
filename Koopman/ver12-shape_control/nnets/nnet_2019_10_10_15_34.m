function [Y,Xf,Af] = nnet_2019_10_10_15_34(X,~,~)
%NNET_2019_10_10_15_34 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 15:34:40.
% 
% [Y] = nnet_2019_10_10_15_34(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 6xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1.15306536650079;-0.836479659634494;-0.87995216847934;-0.663480256590221;-1;-1];
x1_step1.gain = [0.823838303416335;1.03998860154958;1.15597095928608;1.53112443794366;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [0.80504784063407697214;0.3798410342946190732;1.5266801965682259556;-1.7118446245739338263;0.088368896701723320675;-0.28516436437401487813;0.46148949836409436376;-1.5413117554048503255;2.1612617694147457925;1.7040797694373586157];
IW1_1 = [1.0167940502413082005 -0.60461082732805404572 1.4755143673826445205 1.5947722202307244022 0.30614426678768125178 0.17895475404397018226;5.9531797640182393394 3.1458068700397965323 3.518742778763945811 -0.82461071958108866919 2.7499543141551678893 -0.071364471841519422357;-1.3229519606375346186 -0.78398600194996304058 -1.0337186607814710104 -1.2675846805734500844 2.0024313150736587907 1.3967093272160302497;1.0877311219570950929 -2.960514792337424872 0.25078514910055188514 2.3796968032578558194 -2.8830490583950156847 1.3802668212855351282;-0.37111997646885325208 2.6800131295862841263 0.13666049699063342882 -2.1340948703394513331 3.0976207180917056938 0.70356491578533697506;0.56163179110974636998 -2.6340619427618783277 -0.75961014809785210034 2.0762405825214513833 -3.3402641642804162814 -0.41808215260915371214;5.2629242543198131443 2.8292250157507048414 3.32122310676069743 -0.29384024819172271936 2.5474154931370240895 -0.21276560374671993348;-2.3996739595270439871 -3.4730559346696971978 -0.83659024692556960279 1.0999652448701209284 -2.5373281806517669068 1.2190581094458474709;8.0594601537843040262 3.4379806021984027353 6.9869373975367023988 -2.5148211239046136534 -2.5348282073034398287 8.2738877471135587882;-1.6723002980078076618 -0.36662958831063952037 -1.4028401860449934979 -1.6252012712733168165 2.1045599277115645265 1.1571819267638823181];

% Layer 2
b2 = [0.62492715599351122968;0.35585370149832767916;-0.18809925035833655049];
LW2_1 = [-1.0021760595572397623 -2.474997283431837225 3.7846927911877492612 -1.0601648332733988322 2.5088557780319948876 2.930244119602381403 3.373223161610933829 0.89742760551873879127 -0.073276840431622414229 -3.614955472023551053;-0.40431011851865839013 -2.4037955676208970779 1.7480283952000996717 0.31841055481734126253 0.88007438045312513797 0.5949040352840856416 2.3929868017065558661 -0.26363491153572438108 -0.0044391691065669399222 -1.8548004957598027698;0.34906756555168977352 0.10380193515960245421 -0.11939843363428109813 0.63798317609295740471 -0.10165482615288726209 -0.48816471748891260285 -0.57079701667101412355 -0.64182367239536397552 -0.10919683628408850817 0.13182851959776939466];

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
