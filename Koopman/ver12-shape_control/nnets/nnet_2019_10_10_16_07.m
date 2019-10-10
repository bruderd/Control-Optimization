function [Y,Xf,Af] = nnet_2019_10_10_16_07(X,~,~)
%NNET_2019_10_10_16_07 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 16:07:29.
% 
% [Y] = nnet_2019_10_10_16_07(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.579754433464736;-0.805543758446051;-0.203588990146155;-0.125523154590286;-0.223927909142362;-6.17935470084711e-13;-1;-1];
x1_step1.gain = [2.14010824611054;2.03372170692418;6.20638380148667;8.55015998110298;7.84113097277866;981642116310.616;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-3.0663595528078988472;-2.2305235348176015719;0.35713273018952151894;-2.8112187699215054337;0.71006559715380845876;-0.70569665018906646559;4.7946075502416682923;1.3349504307305737338;-3.0651885408970249713;3.3001849037174366686;-0.6561003577833939282;-0.10730579561440459213;4.3706843253653762105;-6.2436387513279649752;-3.3396171617515011398;0.7865097523845386851;-0.29333653776302337501;-1.8112698896934071868;1.9656196716626497256;-1.9252803966937148683];
IW1_1 = [2.8341071231107650696 0.93981428169829317465 -11.019940962330021961 -5.9750892400489181711 -1.1230516673661623539 -11.36804317484608795 -1.0458576977476929937 0.22778940637069633457;-4.3415033308051080851 3.2271249843804996615 -9.4498756280471241098 -2.7127462111236910758 -2.3329028474074511301 -8.9955748648787441368 -0.4815645267132850349 -1.9355294495618220463;0.54863425444340185866 0.88791831635209761409 3.2854565168668030672 -1.2355762460717385487 -0.04083634490752285906 3.2680891404373939579 1.5590527119186579075 2.0676996218300396357;-1.9135352116725543592 3.7352364380872731253 -10.543175761307736593 3.3152038004865702625 -2.8195952666471000292 -10.363167586663280417 0.01733578677185265704 -0.21794445608129003888;4.3143025099102558784 -2.7360903065301500625 -8.4552364285316965464 -10.494283427689831356 -0.10744158523157976148 -9.9286669328346519592 2.5317067253111975589 2.1101769568190977822;-2.658389739710952604 0.68028243913076535954 -0.64755115322220757612 3.8359342064922521409 1.0188843411723744747 0.6413611940695110869 -1.6009767488339197161 1.3703589174855690391;-7.8344754782249408365 -2.7965874336255764909 35.828693584381660742 21.163064879213436598 6.3050412925740531023 39.90684364119327654 -3.6998234176803483919 -0.76591413127771501568;-1.6293443174654835826 -1.2791691319767415358 -3.6879915185605671724 -3.1354811375594300316 0.10008505048920228464 -5.0037319291690325329 0.24966804273440718065 0.67147958487495895685;0.24762929589305954226 1.3199578624923837822 -8.2291585244856619852 1.5166450255866534835 2.523812139553263556 -4.8577977881265903548 6.4294432171783952867 -4.3888171156494069081;10.577828447285712699 -10.222029063027386897 9.0632076955347748992 -11.18157580670833795 5.5953751977279750918 5.9940893170809630419 4.5082036999410659561 0.23680446430489765497;-3.0136455295995614456 2.4675404532905744759 -1.1921026901301672307 4.8134514629340623415 -0.19893138609938657013 -0.33987133843808720046 -1.8501600277886762758 1.2879079168046629889;2.8419366859000136927 0.35244002892118564407 3.0949247762129368233 -1.5093150581421674872 -0.7711021669825002256 2.5393242844402763581 1.1627042796855961981 -0.73654017822567408036;-12.172519817654604779 -2.4667559542396171324 3.3428827275178307765 14.644715803643263641 4.3503798087511498238 7.4972446444575959745 0.8051897479020138082 -4.186110222619802812;9.7837494898670644972 6.140524195799061502 -15.138768410084521676 -15.611845543092252697 -7.9670906754689143625 -21.663684823481837327 -0.6726736969253944709 5.0898818461423545045;8.3955442116551353138 3.0238159278672567254 -1.6575725342811513663 -11.71471718130565165 -3.0197576841986770724 -3.8247416289540292489 3.0949581387097895302 0.99537714541547139824;3.0908668070538269923 -3.0488468047337233813 1.8707676631716820825 -4.9763064569123081071 0.59842648653029784089 1.2091227642804007747 2.0029489854217681355 -1.2924259499994281697;-2.4431359160885040005 -0.11127603569499490421 0.78782693114992996541 0.93218342550555277626 0.40963758068726402461 1.722254976323960296 -0.98828953465219615548 -1.3625958845247172491;-1.4637815835634517825 -0.71691560035972001774 -3.6894136660889134127 3.1269480446065358592 3.6186618899719569242 -0.070022921305012308935 5.0728347997734344332 -3.2685137581872503176;-6.0460227793922483031 -1.9502988635259339567 0.1639429606947917506 7.0203366465744760916 2.4111137879396484784 3.0553720581897856334 2.0024952145008092508 -2.7186039695646022629;6.4494069670432248031 1.9264727413922630994 0.56436633809909519943 -7.2145604892576544742 -2.4274822375933196028 -2.3435878739108875202 -1.9909695408285148499 2.7596762870968736259];

% Layer 2
b2 = [0.34167757461879411096;-0.053588993269431575706;1.5945335097603985375];
LW2_1 = [0.46653430179984439752 -0.025486457488014185174 -0.14520924298284182408 -0.41864254293509067795 0.26419129551982922788 2.8399863337733450841 -0.021043950647960055905 -0.23802814404963223982 0.35996152709764472899 0.055210602308299612517 -7.5800353356354612799 1.1830449087465058078 1.2786356389599551342 0.91481070223132221475 -0.038720822163160667495 -5.7224095494387547944 0.16241903707246438393 -0.53772268974401105091 7.2022971681600855831 7.2164774371338271663;0.36494178582397290844 0.26696523449704007147 -0.41651086760392014297 -0.29529376534569068413 0.1692846950355043345 -3.9212062995094121298 0.10826673221992413887 -0.19252574078850126504 1.2356810248765948135 0.014561941835525256742 23.776631345325444755 1.4172837749326558932 -1.5697331469374931068 -1.321609243967661218 -0.20012356169899336855 19.566335275816825856 -0.61943532049566829567 -1.2264143335826835912 -22.354233466170448708 -21.937683092183767997;1.2715355838476034567 -1.8772031828242676799 2.4652360728519866484 1.7405580625282104368 -1.5198671680554414198 1.1670361372335282812 -0.62927409914213305875 1.8471145301198124145 0.96717596569786334904 0.58313372721723510939 0.21526231354276734176 1.534527137750465231 -0.39456824027533099475 -0.25290893011519366418 -0.85123843534664922483 1.2063760224865596182 3.6073205469018545521 -1.436393113605444638 -0.56594588249464949925 -0.7370330089976124821];

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
