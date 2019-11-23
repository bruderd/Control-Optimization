function [Y,Xf,Af] = nnet_2019_10_10_16_10(X,~,~)
%NNET_2019_10_10_16_10 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 16:10:30.
% 
% [Y] = nnet_2019_10_10_16_10(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.71740263907439;-1.16323930167549;-0.609483808430793;-0.5779268954105;-0.71859453153099;-6.99662550118774e-13;-1;-1];
x1_step1.gain = [1.33301691973468;1.20743101514934;1.62390543388507;1.55665933114409;1.4931802716797;1425528092860.8;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [5.0414028120012295275;-1.8244867064137297863;3.2135049121633665337;4.7771646415788975304;-3.0391510841655762221;1.2543756313721960982;0.57198508805254366649;2.2325561523977857092;-1.2460445321683717435;0.54038276997905143606;-0.67674199758694164597;-3.3355471534656260246;-0.10672872385774304083;3.6799802381677531038;1.3165793523257092179;0.86690706447124299405;1.1438130721748178686;-0.91995253778522190213;-5.8837406161041441166;2.174088235868270047;-5.8627073035282482039;2.4092175419293102578;1.9355834444172128617;5.6315398217393140001;2.7912829492707094126;-2.0703420747354166487;-2.0353540954857556322;-4.4158022580960674119;13.418382105507161484;-1.0555962027442917783];
IW1_1 = [-3.1706686377705501911 0.72318042027751683332 7.0964593986526480762 -2.0848876520471710805 7.8396127268122048903 -4.0174925209899106093 -0.98296918879287531468 2.1393687034302613093;0.28392224527129328315 1.9588757807517642728 -2.5185806903142577973 0.55834178405830003911 -2.4576656080728365161 -0.13420520709678981919 -1.3405945731821629074 -1.4694989808994136649;-1.5018235087974243225 -0.97912570960109923668 -0.57645881269854037932 -1.8729290612194176013 3.0068185610962756549 -2.0802991543207633995 -2.6964065870007378756 -0.51954560697750995502;-2.8282056307631324721 0.70232693992459771515 6.5336899382781252754 -2.3240310778322963436 7.9878004705411482789 -4.0064475251270730283 -0.55609511214516238464 2.2613341564438189657;2.428836652909123206 -1.6804578353476875563 2.0335190327722005854 -0.089018510931961031263 3.6140080030681414058 2.4468378240501098553 3.7468352318024509273 1.1315090894745645222;-2.1364207259192240507 3.7964909478161126266 -2.0535339074466292253 -2.1607349746969308768 -0.61266588799789656328 -2.0809647685130103767 -1.4189179016602022632 0.24640692264128105649;-0.59569073585305187812 1.4027549772277096984 -2.5178141497342965138 -0.77431786831401705484 -3.1490633393914020388 1.136797353638587138 0.31142319793835865349 -3.3777635247490747084;-1.7010731125276008502 -0.4697080745843307259 1.740784665862770364 -2.3528774720383656138 -1.799162698917827985 1.5141460191250908363 -0.11865003563360704275 -2.9927197563440604;8.5198951746092941306 5.1424411274869505917 -0.3618203512355074869 0.7967508454888890812 -0.67629447477828841251 -0.4962985650674028304 -0.55018245335686388753 7.31638709590220504;-0.33595069470163557712 -2.2423169268974243451 1.412222336364956643 5.0571784831068633537 0.47319772856685521356 1.6793292966874822092 0.029016330884611554047 1.0122454968544973841;-3.1690050739534449953 0.6733374326860674941 -6.5569475079868571044 0.93809718165433941817 -5.9994461795264450998 -0.80575746897533151447 2.519606768681143194 0.10703288492046153513;1.0877971713376006768 2.0684929411361845375 -5.4691389883929453219 -6.3787890719674189555 1.2352610107173553899 -0.34099671840271505996 -0.39721214933000298375 7.8996376087108668429;0.5208547148943092342 2.1233167127059049406 -1.6671224333412661966 0.65705503509522855676 -2.0784733841942517607 -1.0237776555903645992 -1.8742324085316541815 0.7022412067288715809;-3.6669999769012497914 1.4823160148505323264 -3.7089744355404294929 -6.5665270778530935303 1.3713943824457575094 -9.3778159387802908498 0.25649098448737045475 -6.4265423423582230811;-2.9529245832013062412 -1.2758607916266055948 4.2150935971560050675 2.6770271254826836227 4.9621507229589933985 -0.19013511149209982865 0.768611040150589786 -1.342375388194060104;3.1657739983475892132 -0.91671754817254769154 6.5586253092080317728 -0.93691666956363328644 6.3518232114136070621 0.79088189228543726017 -2.6354566219378412484 -0.22341534176147631596;-2.1898205482124235566 -6.1170524860754378338 -4.3493113458616905476 -1.8893288995818582343 -5.2678209673312466066 -1.287234303450035533 -3.8196962962818896692 2.4996393223151902596;0.31475392344809588474 -0.63919317594656044346 -0.99275385957705475359 1.5337212332466836351 -0.78018902500048770143 2.7665126838869120718 0.8319331783199752639 1.5205299985041194066;-0.85216807402858485432 -0.62209579792153291145 -0.93165839547849138569 -3.5443750981350587992 2.6989494974309460318 7.4282364167204821825 -2.9162539290344167142 -2.8461411358212167499;-12.74609476421528953 -8.9616805377992303505 4.1013493385482693299 1.7865618713400530648 -2.4263961541209799755 -1.4180362454178943032 7.3848635724230096145 -4.1710939036130803004;-3.5410776797636942526 -1.5395432016775214557 -7.3822200979107561736 -1.4814415381335155342 -4.5953166293531113595 2.7943053847978931437 -2.9497677730493219173 1.1161540695581879667;0.19355639180699876767 -2.752978448355329455 3.1857709710407648984 -0.87957768985960138597 3.1364477343259706821 0.42260927715036028518 1.6876708716411166211 1.3511087849205676292;0.5300090190990083272 2.9108493087562949952 2.4985597957366421085 -0.64946784592105322176 1.8881027928946823025 -2.1143983530329988341 1.6877875271381648226 2.4170205173253824782;-0.027916177398890101857 -2.013574854465470132 -1.611859284946286941 4.0410153039309228973 -3.5425837884790558618 -4.4382321157408899381 -0.49163180311878867945 1.7732244478262162435;3.5193832874838282265 1.569218347242335998 -0.0022856833844269175415 0.83423063129881136479 -3.2052856718519624479 -3.5316072498711092997 0.37789265312599840119 -1.2381840502690339978;-0.6080203740964090775 -4.2033936814605965537 1.9944357602128950369 0.98453935730949693195 4.9454876929382614037 4.3695077908726212002 -2.4312830756340639837 -1.4920527446458418108;-0.34976162970047797174 0.10557507267200391676 0.84222220179705742371 0.5116721171202792684 0.24757242957315933607 1.3730793346715870484 1.9036754288809745184 0.54396229765650794263;1.6361050314841854014 1.8187479727773225857 -1.6878103480135597803 -3.3172092749280586155 -1.0210154683922501029 2.2568066072512498188 0.03953438820748594873 0.64505458003071058926;-1.2387210985741452518 3.7113372792112668819 14.410444680949645146 4.1287807571052095312 11.737389700849014673 -9.3603224507267803745 -3.4565722122380395653 3.5979335085082571055;-0.94892009452519154866 -1.2083035077919892508 1.3242387562676194435 -0.14332672627563475265 0.88405980681310825098 -0.079397378567887380574 -1.0880159089387972937 -0.21879974736808277536];

% Layer 2
b2 = [2.4098235931851408331;2.7300550779136227852;4.5151339999842070583];
LW2_1 = [2.954540578182751176 -2.6720031906407877287 -0.077994279647049150062 -2.3151276883901426018 0.46305283322919854605 0.088287654093325257376 0.065270307810321281927 0.056695758444284316546 -0.10404941681379398233 -0.10172849734329915405 -3.4350844113349867648 -0.031372838368395869479 -0.088076382041422748848 -0.043552860557505207462 -0.0075061267947870114955 -3.4029418056510647439 -0.19790499779900924682 0.1024346335992855489 0.26607154745656258488 0.06053371167891311716 1.0080827165153534164 -2.1661389698131467973 -0.5704237268797222038 0.8695292908650134045 0.35813914160535709197 -0.38536026110272825207 -1.4006596252860998852 3.1274480802624662346 -1.0924603981543643538 -0.60473111505651511166;3.385971262671577886 -1.2571246330489735943 -0.49447966592311454193 -2.9285387668708708908 0.27890055216773435021 0.47141105123207860395 0.25345670422548971512 -0.25383973969043688301 0.29687442931967028548 0.061766322785237540161 -1.5729439880586857381 -0.066965047965282575859 -0.93186546696614080965 0.14654051493863870514 0.027895933030303042555 -1.5011208172160508401 0.14460023808481703433 0.4695391338395484282 -0.040414378727303662542 -0.13042290265547204497 -1.8578630971446181697 -1.3619769351547130753 -0.28389452443636159495 -0.57283907559292057687 0.029538507884132359643 -0.51751418790830938654 -2.2120382981935025057 -0.27696053721279173532 -5.6528192726509400856 0.59766333909650615208;1.8320902258677913554 1.4533417478299792691 0.38757705891469212967 -1.6428517055700446736 -0.96480197803723632966 -0.70307195262838650951 -0.19125975532058142603 0.10289494055334838518 -0.076632880369667005782 0.28555225691137425814 -0.43992054431257948677 0.21563984892026455409 -0.45772511891112249716 0.13556699365782298727 0.44939693044733164395 -0.38863491840964381474 0.28786825059636728108 0.11510321014323245115 -0.23372589924242700987 -0.147364876496115349 -0.5030704571657429458 0.59663052443238384637 0.78242345692185910622 -0.17773230737817238833 0.30399636144273806115 0.29938905199257059841 0.76762561356156733261 1.3770787275021345586 -4.1935276761526525391 -0.47153646486989397868];

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