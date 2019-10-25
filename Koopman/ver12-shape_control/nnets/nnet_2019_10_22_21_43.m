function [Y,Xf,Af] = nnet_2019_10_22_21_43(X,~,~)
%NNET_2019_10_22_21_43 neural network simulation function.
%
% Auto-generated by MATLAB, 22-Oct-2019 21:43:22.
% 
% [Y] = nnet_2019_10_22_21_43(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 7xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-2.0773423776243;-2.08275132944837;-1.15985990351048;-1;-1;-1;-1];
x1_step1.gain = [0.489870379455579;0.485239699506081;0.892849837143524;1;1;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.3282964657980822487;2.1739232644429686836;2.16012714647566062;1.9506295506179096577;-1.961623189017869695;-1.6647789831878123668;1.8513433625192949883;0.93347484452846085645;-1.0575137521506705607;-0.69444156615284424738;-0.65954397119419316819;-0.71628413474342844669;0.67066508065303587216;0.11561589179689292506;0.14779059432388003126;-0.79173640230818786989;-0.20731529178798377422;-0.38186722512339466018;-0.80779472501881632862;0.67779023129069104758;-0.59089850653144582182;-1.0230534780582751786;-0.78744624990549760835;-1.3656344542661722485;1.6437638735083350827;-1.6605089161569610567;1.9497017549002508829;1.7509432138819474023;2.2629416727112947605;1.9384549502128940457];
IW1_1 = [1.3764490379166569589 0.95751606555934909437 0.83770419239825910651 0.0010816930535863609336 0.39285481958640416922 -0.71995191210938491722 -0.6790778559861480046;-1.1435641936522387141 -1.3518698769341965793 -0.79232978641563789335 -0.62030986732673654149 0.96960602283453667383 -0.58053645517343954729 0.22351032263216039087;-1.1464606130751939794 -1.0780542252131328773 -1.389389855288352571 -0.28679283743562883346 0.75417104125501910339 0.41731492198955860706 0.5830946911278900302;-1.4103698523932102216 -0.95166475478877798899 -0.068499348744888471918 0.19291668100810144271 0.67154082700434925002 -1.3256537822663396753 0.052985455550803473024;0.82501022041913374405 -0.65472490910653724505 0.8121907641723509208 -0.68600925114046173992 -0.66905574980205428925 -0.47545350995833807195 1.0737200409219289643;0.61666469808284907206 -1.3094972782890956786 -0.16560870890403556199 1.1544380215181713201 0.14417380140311511494 -0.39948318925249404199 -0.75751185811891064148;-0.81532415281665249207 1.030008840068056486 0.92587701913575826129 -0.60219037877292802552 0.99521756303045794123 -0.42917395234520633318 0.55520915895725486688;-1.2261939849696665839 -0.72764164386162222264 -0.67149570998684948719 -0.86671826208265922986 -0.38726382794853309033 -0.84059341184031899363 -0.99751398843903049674;1.5925827730622064138 1.2968075330060255812 0.096416797153151045929 -0.87098800321359937104 -0.30666280517311594878 -1.2522077731059197969 0.64559679293521321508;0.66879797401519192057 -0.61639845017724947951 0.74113827172064294935 1.2209290599809239364 -0.56805317119219411737 -1.4497244110378006976 -0.15192413964807433002;0.242633051765586083 1.1380925497825413739 -0.2896498761620278084 1.2736253500312042508 0.98296223579674557591 0.51036412442135348222 0.58899920916542458649;1.3610937182264579715 -0.26876598390330336263 0.1853826259293211709 0.39701104461330172235 -0.80632554266357703288 0.37417444737203237048 -0.57875491346269214432;-0.33290185438851510602 -0.70441268718061200715 0.84537014556303047286 0.78075985414534221363 -1.2225284682549286686 -1.0929029115614881107 0.67590905915523324943;-0.13079738604646190536 -0.89113854614123566567 -0.90632240552013798585 1.3968933290292995242 0.56359024018640691001 0.6513055364974801309 -0.39119222109016299482;0.44676218998469885424 -0.35855976175282522345 -1.0587709301801218054 1.2698016714621889189 -0.57661464223462444156 -1.4458287546698440629 0.15609921860615671996;-0.87945860268206133004 0.48082691401093707873 -0.23208887786939133568 -0.57552905316199887142 1.2001563079595967132 0.88612198608094061569 0.54287880043805070152;-0.78007615400355356794 0.31724410952274323394 -0.50149542719817286063 -0.084646089206800972926 -1.4337552255539571799 -1.2866922973038144029 -0.021038054588408294787;-0.49463535389115353968 -1.2189343857144590011 -0.049909186033915829694 -0.58768618695733054746 1.0182410668005119625 0.87271491756984009847 -1.1486407682598800406;0.006679407750823672385 -1.2777482226441778668 0.67049047479368928393 -1.0851564880531363588 0.60387305960609949373 -0.81244550344567478817 -0.7556818276787917732;0.81166754996311596404 -0.97213502418375563607 -0.24095004449911736066 -1.2692058148427993736 1.3691708433317018034 -0.65584631309629803919 -0.55251845896902429534;-0.11556007040797036667 -0.13051703532474084879 -1.0310034819872557765 -1.1692176367868025721 -0.66068413506660017553 0.93340717997071942502 1.2396739471241766672;-1.5465484470560453278 0.96205245917879145257 -0.45258518495151439653 0.28913033964130946396 -1.281008403695838016 0.70342978381804099897 -0.026335755544347454887;-1.2858375386389655493 -0.11196501315505447138 1.0848866183882961423 -0.39687201180115255772 -0.43361436221190696738 -1.2302494360551876618 -0.31155683344918350119;-0.24305934577373636274 0.55194065355080146329 0.058979924275792162958 1.0790355149110295585 0.91879410473419165228 1.019551701972714719 -1.4223862717594673022;1.2903459399727861268 -0.20316909408197958431 -0.23797491217130661845 1.0313615060492820064 -0.65120546860694683566 0.18843948628774465082 -1.2157573910613233004;-0.75970878763929128308 -1.2941050136701055528 1.4174234495524586919 1.0094635635831052944 0.28645783278444109099 -0.70133154194970881434 -0.16853793511783501935;0.87199030746644490275 -0.007413912775531994459 1.18142070584641945 0.80948528960727172965 0.83072815565342361666 -0.63693620886149626692 -0.93834849089930538746;-0.080069636684101136437 -0.74306591051793768887 1.1911562159198816335 1.1046507209354743395 0.37611208363853732006 0.68514695099516054189 0.85982016500053448649;1.0878755842237948226 -0.010202451187788327824 -0.81744525618550600843 0.42570706550021408798 1.3885477052067092263 -0.36937582955747377822 -1.069614005926105671;0.46855149928297112893 0.96791144068209356011 -0.33443335251613098835 1.0483940328104393025 -0.7888260172316478025 -0.77010037716700330268 -1.7176446191299874489];

% Layer 2
b2 = 0.097897308307588332132;
LW2_1 = [0.25506635252715859075 0.74581889231174425259 0.80471177666894999625 0.47037947551793451995 -0.20520069759381723284 0.24396503996063081954 -0.71734992346199721869 0.22431396390694563481 0.29520860520493069634 1.0551932534914896245 0.12562893464968585833 0.53113548650034902998 -0.40364960142993788761 0.28521832966390597841 -1.0874459220799428394 0.34504471193783148308 0.023895112751753919134 -0.065243821258582787581 0.18865590765897605197 0.24859480130533151421 -0.54685344056296258941 -0.30597133738219617349 -0.13200907579460532948 0.38693215473297393192 -0.11496189764717362758 -0.67222874690249778684 0.35345546897077961823 -0.12153553288090437889 -1.0100067734343658454 0.17476190854947923348];

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
