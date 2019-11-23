function [Y,Xf,Af] = nnet_2019_11_04_16_11(X,~,~)
%NNET_2019_11_04_16_11 neural network simulation function.
%
% Auto-generated by MATLAB, 04-Nov-2019 16:11:04.
% 
% [Y] = nnet_2019_11_04_16_11(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 6xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 2xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.925758579615575;-0.118003552089578;-0.109987813615349;-0.232432719239891;-1;-1];
x1_step1.gain = [1.89900924098502;2.34668808680824;5.29950014546465;4.25361637870591;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.8520178690848081438;2.0165381135536275536;-2.6309980937650858657;3.6337982691958781167;1.0204941938105076549;2.445508162226697646;1.5979867888737970816;1.5972379364160653736;2.9612610709596700609;-1.0250638504114002458;-1.0054112315509526887;-0.68063249760607102967;-0.29076547588015655421;-0.82465548411239986137;-0.0033260829048956663812;0.272729679724334928;0.40135979525712150995;0.22889822499278905665;0.84685135062577365783;1.5628860419487251576;-1.4969931639577289673;0.926165239923673278;0.65682206694417111237;1.2349214388106464213;2.8999227718342623916;-2.3939686037739309477;-0.98113978176427008027;-1.6684494586694214036;-2.3572482824542420055;2.4264142008936167016];
IW1_1 = [-0.11113103384397611528 1.7116919011081979107 1.3248632083678912874 -0.75330915533413367324 -0.44464517530827774028 -1.0818594796942337943;-0.8837306275731273697 -1.7327725305846237713 1.6484453325178765049 2.0543243788554299556 1.651366201279137691 0.3696734914047231646;-0.62804787366280379057 -0.050234978814956372795 -1.7422836553920653113 -0.69530434078295688671 -0.82899260064920976543 -0.97561263363534911353;-2.4633202731697059207 3.2436323616910587297 1.9465420559715582716 0.024653155642379166734 0.28647360718594661044 2.458511863517757412;-2.1683784399646821583 -0.98096360585757658157 -2.6211371462113390862 -0.017280042036275797268 1.2019793272642584903 0.97270879863572967672;-0.11699680580651419803 -0.33256200751603387511 0.67765724016077233394 1.1065022690604913169 0.10237382590989903275 3.0661153682010291455;-1.4523876647156837016 -1.0889813617574262139 -2.9102068590716183571 0.075552771772013971319 -0.49328604745276138921 3.3663324148984785644;0.85045087136978780862 1.3947074801192895777 -2.4677242184758489962 0.5060346168497388275 -3.3682723282779898355 3.4999010703217003915;-1.0787173097140974054 -2.9558738267455009208 3.0175705421044227705 0.012101086215402623303 0.99441520158731588896 3.0528323288818861592;0.79291730536318050238 -0.4810084346198131855 0.26690580860341045488 2.1995287033005599397 1.2622359942609719941 -0.1791155834876846098;0.097750827621016125879 1.5868132556090501772 -0.2358526939366218933 -0.71313662186657111874 -1.7682097897188022717 0.7338803356668808231;-0.22917591647049825876 0.38649403962836975657 -1.4634414202547028072 0.16261964461890687783 -1.8310644581471307024 -0.7969618132628180085;1.2910512966527121215 -0.13168157292915241841 0.94963848734114586492 0.86830135310010292393 0.98000104317256164776 0.77743242963459513462;1.2201282705045075616 1.6869445076916462778 -0.71500232922559703308 -0.76609005107022387637 1.373422243703736001 1.4118313993164841591;1.51227244622630419 -0.20131957137688363813 3.0296945147266858278 -0.47518533863595702194 2.3956383962429605994 2.4051926002741601529;-0.85305962133146107096 0.12301233625344930311 6.869733601898428077 -1.4150664082886008632 1.9977400234284978797 -1.6301655369541188101;-2.9525457050100847312 -0.47765249286575151011 0.81445547876868884529 -0.73735350042814185034 -0.1262089143775883826 1.3895051098605701867;1.4737782444659219827 -1.4302013739440879725 1.105662801381598781 -0.78125093502842268833 3.5547243995711155229 -0.59083494456181295806;1.7825286621055906888 -0.31110660166882009303 -2.0189337614091842354 -0.56703143826417201634 0.86770016409314021377 -0.83390356431557111083;1.5583886226491552307 -0.36868913450568913115 -1.106429244029761616 2.164157262406759763 0.43069841487532256608 -2.1054890567781701094;-1.092442506596236651 -0.094864416283686553433 -1.8245620918442315705 -0.14525482218388832689 0.85149180172165628289 -0.9311667720586140895;1.0263572215238319085 1.1956029319276864076 -0.94738543544888276227 0.39155184295523681737 -1.2934508235432555789 0.61037383787391996659;1.0936406714084283553 1.8407410540196085247 0.54950702972921339207 0.34907603547494542306 2.2598385136304033338 1.3779657660983406497;2.5454071792299277632 0.80159115924678192577 -1.344357656774113341 0.3834801742448653572 -0.64987507037210101579 1.6218989833564381176;0.73770111152790607267 0.30792214132110667935 0.85391493854153399656 1.7463220215988142225 -2.009746573016023774 2.2172773800677658684;-0.029367687308937726054 1.6128030632177345893 1.4958990124557642876 -1.4590762974353714831 -2.1140711324718401976 1.3383704972835486213;-0.42032447771028519368 0.6202248517562405361 -0.85217307970038169707 0.76476933683041592449 2.356626996755418979 -0.37292235970200865447;-0.16393052126121826495 2.1939614239459483969 -1.1429054272821739247 0.62953138701174504721 0.53053160452528647095 0.050515034029103129953;-0.41594191392529117346 0.14387547247165510811 -1.3726838222823112279 1.215444538025247434 -0.08829378687220512667 1.6049039399548192808;1.7452189243404323538 -1.848290947507132298 -0.068847353229256488816 -1.602298266903902535 0.65832472630845373374 0.38781002056857566407];

% Layer 2
b2 = [-0.0580896347009025385;1.4627306054000670521];
LW2_1 = [0.25098132868385170102 -0.46723819358988838424 -0.0010306132495297229412 0.065889378518949479058 -0.22165806000727078517 -0.020777819559774136221 0.019492054668395372014 -0.098313377925954598124 0.0097250649927756050578 0.13472621277613439084 -0.63244648239091394437 0.74002152172318247381 1.385656739879743915 -0.37521516664889525972 -0.27841470438216620042 0.00099032427701613713437 -0.025631603846899712884 -0.056787818264725016537 -0.3440928015885464375 -0.24332050488220091644 0.072979802078975794521 1.0273168872442945965 0.48191236717522778488 0.18016841014820283995 -0.58580465842443107949 -0.0051658492489057572516 -0.072370000435906911562 -0.0079745371044936293192 -0.087350137402576008561 -0.015598807081337078689;-0.25972332897196215296 -1.8482888889163264778 -1.7074962243767453085 -1.1109161761215566866 -1.4156948333696675046 2.1398989809528123907 0.87645238899461008764 -1.4968660083877987077 -2.0161883940003848537 1.9548166418775783093 0.0021665415439624316485 0.28444587364654250194 0.31899470643426947047 1.9086862940340798556 0.86809492201860805061 -0.42588993691174470424 1.4816669069043961748 -0.72024891519991518507 1.6082892392055379016 -1.8544323546267722502 -2.0607428291144804788 0.33479635776975008588 -2.090824017554298031 -1.7739327715895447657 -2.1797961312119471522 -3.0274274457338776756 -1.4795889982908279059 -0.97744046860018651834 -0.016234388880766188051 -0.94808554120601684634];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [1;1];
y1_step1.xoffset = [-1;-1];

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