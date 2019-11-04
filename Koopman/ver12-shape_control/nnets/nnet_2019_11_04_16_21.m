function [Y,Xf,Af] = nnet_2019_11_04_16_21(X,~,~)
%NNET_2019_11_04_16_21 neural network simulation function.
%
% Auto-generated by MATLAB, 04-Nov-2019 16:21:56.
% 
% [Y] = nnet_2019_11_04_16_21(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 6xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.979760528962744;-0.0967493271686649;-0.123235760701103;-0.232445808105878;-1;-1];
x1_step1.gain = [1.79921859849069;2.40876684978895;5.00906977894087;4.1712236562878;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-2.7647687349486709252;2.3154327068761704211;-1.5182288980350377994;-1.1241560747583856372;1.6253536960623815588;-1.5863956535595520325;1.5829494392202880793;1.8421624197119643718;-1.798344176218181989;1.1402575798825671516;0.72378802286023580237;-0.57651875702740795759;-0.48047682573761252289;0.86207349784829401251;-0.45078981905896226001;0.55324478300193091762;0.03921268526253192388;-0.70438853227325581852;-1.1174878760256792276;0.64325222143228888427;1.0703937982404450047;1.3388799098795700626;-1.0936067031656413473;1.4750373864197248164;-1.2183722567657848668;-1.8760198925920372748;2.2304744892722481175;1.7490373501763594177;2.2595296804185154294;2.7421013102491071933];
IW1_1 = [0.98043518315906441618 -0.24700155138401819199 1.6613940887942411084 -0.62680460306806462523 -0.21097729937398790323 1.4236189657520910146;-1.1059397790629046376 -0.89394096666595967982 0.0043759936340707038249 1.2120812366917459446 1.4304488714413921002 -1.261265908372049438;1.3642044385598983691 -1.6948355331325783979 -0.24335314203844718439 0.20540098976136053621 -0.6192709710117147992 0.58129847357757402637;1.6747627722819933282 -0.71883914313917962602 1.1784355837375799503 -0.28601623823067157115 0.75960366151156655246 -0.93854449735719280845;-1.5671166511838372504 -0.12404453100625746631 0.00095193449066574217787 1.0793890984294070012 0.71743034334401301066 -0.8039670150852767927;1.4227135691479542157 -1.5335302172269835719 -0.34212653145325822024 0.68095351649677415828 0.31152392419300883875 -0.75196615757715601358;-0.25209138269066855287 -0.17953574758645207687 -0.13328685135958343033 0.055353887698181655774 -0.98348068709404379284 1.0926014549362546013;-0.0045714709695253170213 0.78974263166587022056 -0.33136068820682595959 -1.4639018667490404368 -0.61696322306784856515 -1.8327979970375558594;-0.014876953017785812805 -0.68754411353346833735 1.1171208942665813435 0.82734723740778781664 0.89766056145913619702 2.4416246938653962673;-0.41922363190746914086 0.44461461392810830429 1.2404290508865749576 -0.68599421628852141897 -0.85638963800741896293 -0.55659151130946360464;0.86970167147465371471 0.55996269609854421034 -0.89238193697548717775 0.88917611108110972129 -1.0304704138148692572 -1.7516304513921221453;-0.29002622812327499835 -0.93205939342884425169 -0.90188003095479929438 -0.0066718510342279376685 1.1062082017824554914 0.14019855173024320383;1.5475036118774945226 0.26772982402184769546 0.82972453509401500327 0.54364679068081256386 -0.69813594840819426235 -1.03133369296329791;0.17402685299219589066 0.91836896882179086532 -0.52706562248478749932 1.0009943935855887265 0.82897669721566036305 0.15088973759776636019;-0.70601291316442793544 -0.02249162187967610263 1.785167874718937675 0.16604466969243003582 0.74944645826445066561 2.4633309775740968028;0.033881759875574242458 0.46642097385880387783 -1.2748757250708491195 1.1972168231564612739 -0.053938892711391746293 -0.39553318984161195404;-0.66207477912968371037 1.1195727680927796133 1.4267964782464974682 1.2022880502785568968 -0.80617511044664491582 -0.22856674804251708721;-1.3555610148358041567 0.60098004847966135511 1.0339462219044370794 0.56844357394603484135 1.154476324820328248 0.70737342464890029525;0.34013253618446132043 -0.8694961987127262093 1.356864642832313228 0.92266280693407121127 0.3361348409314235397 1.2526623261584717284;0.76354213395534986653 0.33221422374218206874 -0.70010292235104309988 -1.5748633496184176739 -0.93959267171413196618 0.93270556707335905422;0.39332703106076194466 1.0599739842724453798 -0.19754708464169118409 -1.1641178864355870015 0.34316276000228146392 1.2833406515097534051;0.54902055428598062203 1.0316329248554567677 -1.615386268861728869 -1.2038709295414160572 0.62898237366756759581 -0.96676594871135856923;-0.76829510233013720288 -1.1769866726564828241 -0.68397531302771807926 0.20067434692877914038 -0.52418967035602526128 -0.6353849954615993223;1.2610174666068154625 0.3919785211143405057 -0.16192054583236265008 0.0039341224279406117326 1.6751398952763405514 0.65951140931445439985;-0.44195621203119528353 0.63195137843016024881 -1.3334524006485251046 0.92177924970088076506 -1.3861545134413215674 0.94137825926552942679;-1.5940839005943023832 0.75693714041312176732 -1.2491942587078914695 0.65809626531063014632 0.66265490485638500751 0.71452966164000097926;1.1632131874638467206 0.69816741772889845397 -1.2007848501626177118 0.24794987334493273634 1.3214536293492864516 -0.46537198446213851044;1.2934674442844582565 1.2344445805150356943 0.70260457729832614948 1.1765298360017759638 0.77525177307844317376 -0.87149429204895745293;1.0970312412930489643 -1.1428945029270778377 0.85996622221363605565 -0.12528713071272559731 -1.3543247485721199297 -1.0939808593273381288;1.167333934616354929 -0.60824224121051373437 0.77040410222375466098 -0.9062836172665181822 0.95245526749766129537 0.91467768716366437687];

% Layer 2
b2 = -0.097398505483117861492;
LW2_1 = [0.5002449164685588423 0.58578364608716970707 -0.077932650710027639995 0.087592645266137567073 -0.43295894018824526706 0.10784196838948220676 -0.30901886790349597511 1.4196531770806060102 1.8326477866005297379 -0.46814623982357006504 -0.39520520431692529595 -0.60242683455398904346 0.55807300058779663043 0.30254574199407369139 -1.3118465847037585892 0.52275118430353328947 0.36083762269983726823 -0.60215450303126394349 0.78289048073468647804 0.048899733566714252697 0.062190051653702435597 -0.16726306456888134777 -0.24213091379995843599 0.39906626598355560143 0.25040476761132890449 0.54113452201613043702 -1.0582182868968643685 0.74402537861406992103 0.56986996664993849748 0.10885981054769575116];

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
