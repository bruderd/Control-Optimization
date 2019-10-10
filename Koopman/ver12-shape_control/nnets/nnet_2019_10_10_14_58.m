function [Y,Xf,Af] = nnet_2019_10_10_14_58(X,~,~)
%NNET_2019_10_10_14_58 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 14:58:31.
% 
% [Y] = nnet_2019_10_10_14_58(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 7xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1.12520182470669;-0.919903580947738;-0.964677203024396;-0.629975818805019;-1;-1;-1];
x1_step1.gain = [1.02168829524382;1.07363252809921;1.1531025043986;1.59009301111279;1;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.3665097478487653326;-0.74722305240412645322;0.85279391328405573791;-0.00025931423709364323895;0.2452725287710030011;-0.30216996124927625322;-0.58662919156346959859;-0.302972672132425902;-1.0243806685703167325;-1.1196727750618635788];
IW1_1 = [-0.0030052098893770563814 0.00029134895111904233339 -0.00085575898788146920193 0.00015966479326447437985 0.65196882830588043234 0.17052659499831912537 0.069371243993743766931;-1.4294798799949320122e-05 -7.4670336351850263574e-05 1.7055621914679709527e-05 4.9431818744955447408e-05 0.033346777469966087937 -0.13062060917412190997 -0.17547014043215797274;-0.3752538605285181128 -0.37240405828821793177 0.14982317732744113159 -0.10280019612476665181 -1.0222521412163056986 -0.32598773854114865278 -0.093855678015304852546;0.27888952368019614969 -0.60275299705705986941 0.001972410141086127118 0.063160219217979748918 0.22350972251356471254 -0.39711597509463275602 -0.0040373472462281604148;-6.3162766327301341916e-05 5.9054746956216068189e-06 -1.1294703326954121667e-05 -6.422120320257371927e-07 -0.24156381487112485451 -0.063242769599530207492 -0.025775234398776086103;6.7967769434614555319e-05 7.4975233284621010748e-05 -2.0521313927318641672e-06 -4.9177884370374214476e-05 0.014018560108524306951 -0.088601728500866894223 0.081305599718292945188;-2.5043001158533115708e-05 9.9287484749405167006e-05 8.4460751487136849394e-06 -7.4252344059910453257e-06 -0.027900394980184036603 0.10924662429100974459 0.146764951726491788;-3.9725850591885964553e-05 -0.00011638308957011465829 4.0442425810305604732e-06 5.2443735417137546189e-05 0.013879736751861687649 -0.087115759575817006133 0.079911692061194319892;4.7958021436145133176e-05 -4.5795872900885306242e-06 2.0793600845519458892e-05 7.4423801062488190348e-06 -0.036826623832597271679 0.23209547373800484826 -0.21292262112314791489;0.00033307644995017392881 -0.00013572010405489613695 2.2946131894204495208e-05 -3.4423522835387071115e-06 -0.41729869359512378191 -0.10921527030887182019 -0.04449688534480985419];

% Layer 2
b2 = [0.65680628640724858514;-0.90042601386886600423;1.2637362667435114716];
LW2_1 = [0.60213312405650243342 0.76228690939988041908 6.8245226883741877508e-05 -8.1306920453051516849e-05 -3.4023436868831775648 0.84629335893580992511 -1.0859703684047286032 0.26518762745626217603 -0.1379786040128321567 -1.0932247714911911274;0.1190766495018038551 -1.9794674577672748406 1.0357477997529609951e-05 0.00057303581122499587432 -0.67309258221400292133 -3.586527700482200931 2.8197425965930618119 -2.6542680747091962346 0.77020758071773742781 -0.21622843988814610672;0.02584667238464970207 -2.2890671593404063877 -4.4840263810198574757e-06 0.00021477982584635840562 -0.14499735097537744255 1.7486346246308648311 3.2607486028498469111 3.1274628194536249204 -0.59762416583496946743 -0.046626701907180913287];

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
