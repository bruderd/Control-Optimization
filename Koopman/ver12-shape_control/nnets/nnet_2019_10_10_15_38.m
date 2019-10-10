function [Y,Xf,Af] = nnet_2019_10_10_15_38(X,~,~)
%NNET_2019_10_10_15_38 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 15:38:58.
% 
% [Y] = nnet_2019_10_10_15_38(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 10xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1.32113880804237;-1.27503539837562;-1.18817916448048;-0.928038264067655;-1;-1;-1;-1;-1;-1];
x1_step1.gain = [0.822633420854031;0.833854785567747;0.926003062509369;1.26021758813278;1;1;1;1;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.83086859101726606713;0.23780268741828305967;0.37787280411670559621;-0.21841415215466059019;0.14013257656423031006;-0.083124477706507660102;0.7156163462217275395;-0.36582942856338535043;0.46326881172152495347;0.2821170754336170261];
IW1_1 = [0.72504989892026672216 -0.17396981978113942868 2.3716047529777495306 0.11302732013753820361 0.27596506423637384708 -0.0073145846240623129536 -0.24143276440068661692 0.14024171482595632066 0.011803906216577401272 -0.1149471049835815023;0.0011930192308621271821 -0.3053608872445772171 -0.22010405169757082944 0.095693058965083219181 1.4321372475604929875 0.90577550520033367487 0.54904924532028875905 0.31668393877400335956 0.28731930071685574113 0.11439761702845137326;-0.5277358824702829132 0.17711012713574508792 -1.6702678282397778187 -0.034725392951140368614 -0.068172040286603799442 0.032566064079317232072 0.082940539989737521731 -0.15251659849222956589 -0.12088072202149539869 0.040708896868345514908;-0.017026857108960298526 -0.17960612921366506112 0.15272464723328463276 0.45885826385925165827 -1.05848125669796711 -1.1282828852019166632 -0.84381340474861910028 0.27684243448795942122 0.08354912624903224061 -0.059885379708583486025;-0.021052888847447055742 -0.089610041046528934872 0.096165228062714158686 0.15497983876406914994 -1.0327565290857996239 -0.53208982684240202499 -0.27882326517130018306 -0.37935515116660006862 -0.32231345279473161414 -0.1081022043385684861;-0.12483564761272999966 0.24386455487404753995 -0.2259128639378828185 -0.20693416461909611148 0.22381691352075808177 0.13043100073842411879 0.048867091891461537922 0.17609728548663977632 0.1342458901493199519 0.044403500710141735608;-0.42529371706375507234 0.14730303744938916255 -0.57653928081005700879 0.047834784351772588473 -1.5505723267954987232 -0.84900458517236243594 -0.4640027768031553812 -0.49902861728867720092 -0.42944616440014615755 -0.14408634576751250256;-0.83715145376801891608 0.12946402479726729084 -2.9329233576034980935 -0.0014520283897359025777 -0.065409748150146496126 -0.28218307268257153408 -0.26655574059187719937 -0.2737259977828563895 -0.24329066284016387378 -0.2309267600722690883;0.95303876259919473313 -0.10061779613734407601 3.5731379978416524246 0.044333437396318869927 -0.04647122851357683021 0.53070909116030651198 0.26608198520055736935 0.21911095995514265344 0.54969239875581388244 0.10834585999741667972;-0.0063114043252175591053 0.34835178565599045353 -0.18828105919160728621 -1.094951303664532416 0.74639640108246596562 1.1779097747107034611 1.1273640536606439611 -0.21791383350719162326 0.21137145882718150203 0.25213544361749162803];

% Layer 2
b2 = [-0.15845493382048511655;-0.41232832323845447497;-1.0195484271966639422];
LW2_1 = [-4.5952071708289770058 -9.8325233269878715703 -7.3639282124894505088 -9.5493105672658167293 -13.503384415944372776 -6.2137223732542770094 5.271385684007245942 -0.34553893389777284861 -1.9376024946424612594 -4.0510897931928555593;0.60917688829401539508 -7.2353676179442221184 0.64336966565761100068 -3.0024813500163594071 -14.246111602816403874 -11.568607660410020088 4.7159489003241459315 3.5799420328417888015 2.9500362447461663251 -0.17570543706855390464;5.5100181743114333699 -4.3196838366331844483 9.4417238243909711315 0.71301784620551633687 -10.562253838564208408 -10.760139665488583915 3.4688177990762150138 -3.3168943112618016755 -1.108300247704383068 1.5813270238733256878];

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
