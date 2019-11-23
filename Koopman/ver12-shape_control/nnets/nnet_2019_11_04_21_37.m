function [Y,Xf,Af] = nnet_2019_11_04_21_37(X,~,~)
%NNET_2019_11_04_21_37 neural network simulation function.
%
% Auto-generated by MATLAB, 04-Nov-2019 21:37:52.
% 
% [Y] = nnet_2019_11_04_21_37(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.0166332776599913;-0.015665029737179;-0.0143790322309408;-0.0177905783923246;-0.00626630483480459;-1;-1];
x1_step1.gain = [53.5590251969158;50.9680404329837;77.5039806116064;63.6337860299689;124.678942008564;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.0247451321252212253;2.1460146332371490274;0.76580953764790404836;0.028014703960438678415;4.0495282607988771773;1.4734472558678697318;-4.4498198497779544169;47.596635921259803581;-0.021328679624455268438;-18.158858212707944091;11.277396093865656113;-114.15192537064402245;98.443776737139131683;-48.364130890220955905;18.995306131716692022;13.331494318247413489;19.421898653752915465;-18.139102537498093426;48.043587956953992091;57.844035468555567547;0.45623285409646952004;107.94209238780770477;66.688564857159875032;-98.475123617605220261;-158.04903204696597641;125.49365388807383681;-1.1265423624823995841;-1.7195638507738764122;49.694534796845189817;-1.5740266489199405964];
IW1_1 = [-0.40777692654399871897 0.0056395265174200483876 0.65610775593907055825 0.90342667235039031404 0.12543164131685102802 0.59641814775460277875 -0.10452657040658044907;1.2087568359449436528 -1.133062854094823324 -0.2225614479255970668 -1.805450290672710123 0.95362713293979961549 0.70589244134263151587 -0.17988117607697154399;-0.39799321602175230517 -0.096870856696330970292 0.77689787363090834216 0.86239586221979913638 -0.10331530278300979364 -3.3960680998865111491 0.07845121465657250992;-3.1382096119525053624 1.0488893947858550781 1.5379020719853990773 2.257219911998717965 2.3413847479849079214 4.623418748144442425 -6.3839120532135478214;1.3286016032124918773 1.0291535677752783329 -2.4374263562100204616 -3.0616645629890815172 -0.0027348818303583218026 -9.7439041709709766081 0.25566429852861710659;0.49421999416857770315 0.41472737290407452049 -0.85344798016823275599 -1.0826855225443072772 -0.043059361787785771503 -3.5555291421577641664 0.10293457158708049781;4.9384092075719090431 3.2148300414836441519 -8.6707233944021471217 -10.515473306811811582 0.51392015474492502847 25.651048710959617694 -0.51391943411813989506;-45.660659609560092065 -1.4654674846464554872 -43.559162535054184673 20.188405512678802012 -2.0596077106115826538 -157.83019873597635296 -4.5379675847211853323;0.089658351932528662642 0.036038963636602250329 0.04593319067587419563 -0.023449084254063407712 0.0125653393867945877 0.073961298676892800463 -0.029376934777750319389;-5.3469807250992920089 5.5168503854186532465 0.35127517660219109707 7.3988289818674921605 -0.84187224924292425321 53.976922932649586073 -0.70849001764694352623;4.6501919925231360864 2.0291111135926476194 -8.2618849027661198647 -9.917077627085667757 0.89782628186758550726 -24.995298634062091736 0.80586211855622646993;154.39691191084185107 33.604753430624889177 85.412184851057006085 -56.381630158063757108 8.969345351674103739 430.49768749294895542 6.3055405725396758143;-137.2055067712412324 -13.915357686740959409 -63.217268150084244382 73.385205212496018135 -7.3691761091496124081 -379.06519094762575151 -7.5668610882933471373;-31.463200798127772373 1.2974511338421468309 -23.546102765063341877 2.8489919591707026925 16.191796650789335388 161.90593634361877662 1.0222999550589824125;-15.017994404981113377 -1.4811393237765018149 7.8756605787590112655 5.1283249986035253087 -3.4357364880729495127 -73.0723412091542599 1.62375435184830752;-19.121074401128385745 1.1830983487487454209 4.4285110787933961163 12.155006095531208032 -1.4167417701769866589 -55.962243293423277635 0.65405693513081497592;-11.179591192007748646 5.6436593732000535084 -11.543262827559706452 -5.7265536856296330726 0.99625387243775920254 -55.438578803417804863 0.83158792062314179638;-3.5369171141342494735 4.2632953766943622043 -6.0630567087960276496 0.10841101950596215842 -0.2620683553238492558 58.313664088444696176 -0.48289047442742438765;-46.054600376750549628 -1.8596572636263459799 -44.811018710609047844 17.990038451817571996 -1.6661113335946442504 -159.11499793737209529 -4.3279937104366998923;-79.293886304002512588 -4.2272872703139094952 -36.972305033271013031 47.602727583517946641 -5.7134681638008535387 -221.38599685820707919 -5.2537486482658968256;0.017948999219512790093 0.80666894407523981325 -1.4434540728577114344 -1.114380951030861322 0.19151402242308990242 -0.77611668405171063689 0.36688398469320937512;-96.30937458336464374 -2.980723941312508618 -105.13471763915720203 4.3971671410712769301 -3.1620281879378766554 -340.14068184280324658 -5.4915720649765740191;46.742029858881608106 -8.6529607659362675065 50.728738882400101318 11.04685009448801658 -22.709204536734048929 -236.62045697463904048 -2.0476371884108557353;-79.637454848212286151 14.058747949054064108 -68.839487246981803992 -1.3730772762258638409 34.714164808761772463 338.24101401841022607 2.7955664460932396764;-148.62043161002296188 18.477758113698218523 -128.15249483554819676 -2.6942482505834512985 61.362377671982940797 542.90401998701554476 5.3678201459110637117;108.83507273704006479 -25.93969264102717176 119.41825420392872559 22.328341283752635604 -51.869022874636300457 -458.26017579310865813 -4.4957981279014580522;1.7593291863037820999 0.34426587506287892326 -3.8797380535191310358 -4.8754698946505286017 0.47220677244549508211 10.044521502155213 -0.16829694227954364316;1.3866659171388890925 0.32291332762930591294 -2.7472999056997950973 -3.2996292904492166009 0.4482470821759041435 9.4465237149016196838 -0.16219655086596240778;34.338521328058384086 -3.5938759181493873385 24.823331021833329402 -2.1544147508073652197 -15.756275718262788388 -165.82549524465713375 -1.2690902948233386827;-2.7541839378567107843 -1.8119054157607124012 -0.54651335927881228294 1.19156950906232173 1.085049037056465826 1.7817871107567451183 -0.2981183331260266467];

% Layer 2
b2 = 0.21113778747189959617;
LW2_1 = [0.95236086078123105558 0.087171509628074780873 4.8543422843275783052 0.0061576160589968328973 -10.766741026185080443 -5.0850309877330586161 -21.93710350916131091 -21.69397530945268926 -5.0222377362251302557 17.492678794525193808 -20.941524322039235528 48.41559012187722999 -54.0195576317109456 26.021868172869201175 11.856241263856926338 -19.128962449684330238 12.151499910423693152 -10.162555697351905337 51.647952198605565854 -66.730612731617142686 -0.27407690083202801423 139.45157920014219144 -89.206087787325103022 -109.87257042253503414 -52.163845934305250296 -111.61429277363816936 4.1788437266247830948 -15.906472046333137271 65.325784102721300428 -0.17179298246672136674];

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