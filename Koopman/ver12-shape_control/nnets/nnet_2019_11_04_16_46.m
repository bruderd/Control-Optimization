function [Y,Xf,Af] = nnet_2019_11_04_16_46(X,~,~)
%NNET_2019_11_04_16_46 neural network simulation function.
%
% Auto-generated by MATLAB, 04-Nov-2019 16:46:42.
% 
% [Y] = nnet_2019_11_04_16_46(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 3xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.161443988792658;-0.0348157881121125;-1];
x1_step1.gain = [4.48952859324753;7.93185821039875;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.826948832328099126;6.5103667306855834696;-6.1373455642682523958;3.5595898278386290947;3.9975668555206484989;3.212148676273201886;1.775126829614046553;1.9472649487121553857;1.4060736276365557451;-1.5459585712782648592;2.3727193642374331262;2.6459902371165555657;0.63258448446702297829;1.1443961718344111134;-1.9954408910690251133;-1.3432872105063582424;2.5542649401540233889;0.77239022175022775674;1.0336188044265499641;-3.2493118229891275739;-1.357460895020924152;1.1203242489564211315;2.5033057494241459651;-1.8658852853241409964;-4.725195563968582313;3.0807437882576089727;3.7380361424274850535;-3.840926769491944448;-4.7198324071398811697;-3.8198906202847897617];
IW1_1 = [-3.3194840568093764155 -1.6097762415144218906 -3.5106974224007965191;-1.5140202418124386607 1.8311553824505153454 -4.7476650456953306545;2.2475825231222676948 -0.95872242162230802975 4.433035647634783416;-1.5788729436560946517 -2.6397814489192623633 -2.9334024778196274852;-3.3611072196183822136 2.4990581738812851498 -0.91449273340702130763;-1.8180251978797323797 -2.0438506756776013695 -3.1571134608327908744;2.1476717376123448666 -0.98104621613716824768 -10.941930250991473983;-4.6413427385313861251 4.246295084671285025 8.0542493455407431213;-4.3107706170875532692 2.3505747028561567724 2.7774943319491622873;-1.1530416270670611478 0.05236092771168712745 8.7089929503004821498;-2.5910944012275156645 -3.0907304360331204762 1.9745838645493591912;-4.8185044118607827102 -3.175224920892006697 3.2658746977415851198;-2.3193120044659489842 -2.5483612674717077695 -3.8057593938380067655;-1.3003841377610176888 3.627615188962626469 1.408187966549994119;1.6788761672422547466 -5.1679694438571921467 -2.7292587786397439764;3.2989673404925197175 -3.3035882956704751834 -6.7231361794799129328;-1.0490984378658148035 5.8416718235358162659 12.129945791816091116;0.67523237594749008217 1.7889222910694444479 -0.89094660594189178937;2.451263306566110689 -1.483371926426461318 1.6769077464574428937;-6.167465355442144137 -0.24453988816934996153 5.625433699556132261;-2.068952352290208907 3.44781247014775305 3.4763704838824232013;2.3206275989089677481 -0.046767647360435149473 -0.36007234436808599476;2.5592368843785657795 -3.3574924967676063048 -1.554579614461380821;-2.6070330620683725975 2.8018550871366265653 -1.4735094799964041368;-2.500565868117063939 -7.8537075510023157676 2.132760424093109286;0.72582598925628138975 5.0354712044045282227 -0.96577677823023755366;0.64192051469800803787 -2.2615308441713919407 -3.3141151737860625737;-5.4085837028816179384 -1.576962190300750688 5.0178386981139579959;-3.6617812839214431975 -0.84566976001944271779 -3.4170923921127345224;-4.3662786157427380118 1.6360871120155047187 -2.3822343283477955822];

% Layer 2
b2 = 1.0062551959837344739;
LW2_1 = [1.5097630052284138902 1.5155988107264721787 2.9975651919073365015 0.55723228584416506504 -1.1187034599958225467 0.57597707706397405225 2.1544554809012161911 2.1663229849491898449 0.5738937110163888633 2.7592448210057303193 3.2984501419421321522 -1.7253016765047124448 0.63381292781624098964 -2.7243406290166736206 -1.5666513600473108703 3.4363900163070910665 1.1063965332657754725 3.3701996287118531903 2.2841142783876882127 0.90680644560446754809 1.2216440027668267199 0.77104659040529255343 -0.92671326047597091247 1.7739921561093252578 -0.65594193334393735562 -1.7108313334923619387 0.62227064391450059855 -1.180521592492073113 0.91843355268705451078 1.2314322039123493102];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 1;
y1_step1.xoffset = -1;

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
