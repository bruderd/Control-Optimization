function [Y,Xf,Af] = nnet_2019_10_10_14_53(X,~,~)
%NNET_2019_10_10_14_53 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 14:53:27.
% 
% [Y] = nnet_2019_10_10_14_53(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 8xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1.57727744017018;-0.987805776291691;-1.1215612827827;-0.752810532489044;-0.47080079441883;-0.513129285106241;-1;-1];
x1_step1.gain = [0.611039855072676;0.929486169836227;0.926914811116244;1.35127122552213;1.82534178024856;1.97195302928362;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-3.8938148846034446038;-0.4316927746617705286;-3.4332057854309421252;3.0896228600377493301;0.29322465034735178957;-1.027576262828595155;-1.8487911148852356202;0.98472157597746712288;-10.934571475009819963;4.1075075767855837583];
IW1_1 = [-4.3096797830735908974 -8.1238336591538953257 3.099012520864084852 -2.9923273744523508633 4.4476253600148165646 -2.2524472283301468778 5.9793697677302137805 -0.34571591806164880811;-0.33015521382826085173 2.1648986292148584276 -0.45301273793930429967 -1.7322194968537254489 -0.79497344787880974692 1.1862662409696493881 0.36400346226164331798 0.35741876850141857114;2.8495807608316114923 4.9519244442673926443 5.8958907066595491742 4.0657486334836434594 1.6079582811309554025 0.92817631092678309912 -4.8320068017077932865 -2.7379024222872616612;-2.8112400029876902785 -4.7911098024356961744 -5.3032066862777149652 -3.6746122013536908213 -1.4803385895374787662 -1.0918488901464180607 4.4009072067011079099 2.6980405395019015913;7.1110779900049925217 3.0798114216071321714 -6.4953565804845343479 2.3328669158897370473 -5.5171245942840725363 6.7403814628863294445 7.3754040258244861761 -8.1753112602328243952;-3.8975907906299354089 2.9637316464770013802 -4.1159192946004852232 -0.33682482306743272149 -5.7469853695252739456 0.52915764802538911571 0.16323883458556234793 -2.8005099348057771458;-7.7576618970433539602 0.76449417611117465032 -7.7347046804585755098 0.092683293494860694017 -8.4410230630490410419 -1.8020958230749228868 0.59279197639039504786 -4.6628395148448626983;2.8666674890860961433 1.3153405276178120609 2.1040989471293385371 -0.35874689796824127397 0.081350382258536330093 1.8960384123425979563 1.6282212767124257802 -2.6407530868273436653;3.9284199048175851843 10.535992016019958939 -32.914112180385927786 23.831615347414633277 -2.0505206026262712271 -18.805129089440054457 -0.58521592433027080915 19.656491832186375746;4.5213436852929174137 8.4536559811941405229 -3.3913994078216940231 3.1044279412212936187 -4.5343551370074317575 2.2032828089998797161 -6.2169469204295753073 0.2408758002743046911];

% Layer 2
b2 = [-0.017999276276022432158;0.12427553909981869928;0.07891951920774124829];
LW2_1 = [4.1379879428763759464 0.56132553346598168531 2.2923072672117834614 2.6304435465891740087 -0.21677097059977229465 -0.36841089346679389838 0.29854616226343311247 0.44517892596358299429 0.060982277006244679785 3.9399758240219151517;2.1864494208346960669 0.42497428239039414244 2.6303548272080119474 2.5112387744578077431 0.14904033951445244677 -0.67375919515613025279 0.49386624140599943988 -0.065231809073443947078 -0.075844618587964221512 2.2354863218690876892;1.1091993534130735188 0.15920968949894906408 0.068912619881484810103 -0.0098496904525995770951 0.071726528850591483866 -0.50961381766083968525 0.46890826982736305562 -0.063372284668809272801 -0.028698773995522362801 1.1518595919193452826];

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