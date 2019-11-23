function [Y,Xf,Af] = nnet_2019_10_10_14_57(X,~,~)
%NNET_2019_10_10_14_57 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 14:57:41.
% 
% [Y] = nnet_2019_10_10_14_57(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-1.12520182470669;-0.919903580947738;-0.964677203024396;-0.629975818805019;-1;-1];
x1_step1.gain = [1.02168829524382;1.07363252809921;1.1531025043986;1.59009301111279;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.8162979690347724748;-3.1124827461250004212;0.72094407818908201602;1.7011706168290698926;0.93808852459528291323;-1.9936778107996262488;-0.0015552621748600881785;4.533622400376188466;-0.98059983053068444647;-1.0326458425149676046];
IW1_1 = [1.9061325945843623497 0.80266972467729535978 1.3452577203224291846 0.017284361011717062906 -0.90467403531469270384 -0.037646130966825661068;0.9370703966373298277 -4.548742358208802905 0.19188396082428588185 0.065271305844357169201 1.7974616710081376958 -2.6440592052985070204;3.8764783829192026587 3.5431392391430622801 3.806072057241195683 -1.4582918084931195679 1.0496003753748675003 -2.9560225863280682468;0.15060007381454504349 1.2593994320209584981 1.0344419814477257002 -1.5767965717514011992 2.0678609172496589252 -1.8422887637065059607;5.9798266446161951748 -1.9169398509818806886 0.35127280110441466698 1.5645641552232132376 -2.5044468552091521119 -1.6980184580564814389;3.2809332121916341407 1.8203534595341612778 -8.0904739801019047718 -6.9114323431136792664 3.8112597500112239679 -15.995687967195799217;-0.67799087822007164661 -0.79695391120556402509 -0.50947056093916920361 0.94573774572461011267 -1.100614292449139997 -1.504521392481410258;-3.7700166405847839179 -7.8692969919287731884 -1.98941228083176469 -3.4332230260817460099 2.0706051914878007558 7.8200602617976544551;-0.89050398349202131154 -1.4799515051323230974 -1.0790571173984728759 0.062544345760782826815 -0.57635624809239516253 -0.23577748069499626649;-0.55589279724864471 -1.5002452396461840589 -1.4636568510702536727 1.3573142732865861593 -1.2403107445718799529 1.3481001438587185692];

% Layer 2
b2 = [0.44039542934445519151;0.36721425710105570772;0.033059144474273091663];
LW2_1 = [-0.93309988739805316271 0.55922949354630246965 0.30909769685011889706 0.52435109300501703267 -0.21870232948042170329 0.0016308338375052679799 0.1984279990982117936 0.24118069119947990742 -1.3702526369371108572 1.0036769015099833435;0.5738180966253025872 0.5625405485189848287 -0.39852440374566278081 -1.4542666359760563211 0.10826057606396068123 0.04734931541273477984 -0.48136512394216607325 0.18549327809205756745 1.2877915972101068309 -2.4628003513369001176;0.64543067778599616524 0.1524888118790587721 -0.34480346103214792874 -0.95857077282436653487 0.12125679612512807459 0.17497355424831273485 -0.4380124908098124159 0.073403456737501246443 1.0968820154301601733 -1.6729932291840774461];

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