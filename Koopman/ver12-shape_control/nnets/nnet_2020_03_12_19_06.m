function [Y,Xf,Af] = nnet_2020_03_12_19_06(X,~,~)
%NNET_2020_03_12_19_06 neural network simulation function.
%
% Auto-generated by MATLAB, 12-Mar-2020 19:06:03.
% 
% [Y] = nnet_2020_03_12_19_06(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 17xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-4.702639015035;-1.81760817156019;-2.77546549018686;-1.9853835690187;-1.52007060790812;-1.51727033615088;-1.24644352154268;-0.930062010589408;-1.36036318110849;-1;-1;-1;-1;-1;-1;-1;-1];
x1_step1.gain = [0.244832787345922;0.261681510998831;0.442897618284858;0.693606658702392;0.419852343196382;0.663338183877252;0.693157195777839;1.19385801212038;0.892932928251952;1;1;1;1;1;1;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.4797319172422418454;-1.7131908126336456988;-1.7981623219806925906;1.2619953172568783017;-0.66893486467904050841;1.578112603883750964;0.81049171983218759596;-0.99977227801744072977;-0.80985806711204777475;-0.54460772045387284557;-0.29049676232960236488;-0.45212398674517112473;-0.24691268622919426701;0.46456439213711286929;-0.15770837235128906673;-0.017592765797658033167;-0.085247311926488225642;-0.37438117467371267999;0.59595966881783934976;0.18323240813479715894;-0.48964078970992958029;0.85792764215791539328;-1.0809718524960456598;1.4698378116521408909;0.97644641412772703593;-1.4766712595251731965;1.6799457306334011353;1.7677471711566021817;-1.769447792879865089;1.4604387787173727098];
IW1_1 = [0.45561333527623676387 -0.31715993644722129119 -0.44215925486528584454 -0.43962517541151197031 -0.71663446878701630993 -0.11196351374635642173 0.37284299217568284135 -0.035851364009598825355 0.30369107967625991185 -0.60050467367478299607 -0.087894503490847070148 0.41956919922423385749 -0.69129960270682799806 -0.21732425754410059082 0.28714327602337974543 -0.57994800391011558371 -0.10093353057353229851;0.46222007402669518239 0.54512528363786183494 0.042138686053277751853 -1.0313417970064309159 0.44910142455622847901 -0.63225418371922859073 0.0092603368972253193026 0.30695474796625193958 -0.12002125221411241718 0.098045835456146993026 0.26222936946992564389 -0.19673731768317312407 0.74437617854825122166 -0.42934642822443874755 0.53194560840080162833 0.087144794619484128306 -0.87974683962179012209;0.778724659562493704 0.73656889771532108036 0.15051415442363968999 0.53549169596161361184 -0.38526041117465731345 -0.0065869137359902442397 -0.18441359361681403106 -0.17337354887023795347 0.10978909319440834091 -0.034908694062155659621 0.11549931006220737206 -0.44431413851693740691 0.66706737325664400284 0.034200473513141732562 -0.43193304186483388873 0.22238851464396633406 0.75077984291380239767;-0.4548264966235785467 0.96789658545279089186 -0.011606972795919753838 -0.31549630688032748171 -0.058381354622704439983 0.50456362174944402454 0.26579171606403284578 0.048242839873002138495 0.20116498423594997291 0.24024334100313832208 -0.057987079332229449213 0.13901477951569254921 0.20056189115194875128 -0.37876187271957650893 -0.386015038219518547 -0.44920932245543465644 0.68822901945121106593;0.31791543902630048368 0.93511180948791450263 -0.41382343173488050914 -0.16882673985592852595 0.36791252330224810674 -0.026825700877454963789 0.26582193674099680036 0.41416010635078343016 0.071729349072627637818 0.094810120445416840029 -0.0034018548439572857296 -0.044309850291908363384 0.35338324075621263543 -0.57434472795977131732 0.57807547000112979863 -0.60068353126133244846 -0.072689090735245542874;0.13679678128022065842 0.40936855560712326341 -0.20510649842659237074 0.59253773069738158163 -0.37763255545599688778 0.074968420162590629352 0.24244413059187983062 0.2400242223797888208 -0.34488587160276679144 0.42965812932857672113 -0.8739659645761184148 -1.27883417121838594 0.90272722747970479684 0.033043059198846792823 -0.14352909357704643489 0.2618310225312694417 -0.38376784904527472264;-0.75371956205493306769 0.41656378197236648697 -0.44469315308211160298 0.66970893521757468569 -0.39569756657723964555 -0.17104854025566335052 0.14200615704547792095 -0.16251010558406092654 -0.096237068117203977691 0.34669357622363861093 -0.39551552242479515176 0.47675707230432856631 0.35600633207609949649 -0.35547231458649936053 -0.13749440529828851898 0.64006580884177399771 0.36397742913567554535;-0.19850171824957296707 -0.24716125898477514511 -0.54072463432289730179 -0.6606543001152058725 -0.49606309894689271101 -0.54009202009228729491 0.44464969514835606113 -0.18617864918153120835 -0.33440450386511688663 0.34520437449351509818 -0.31956923991334312829 -0.57639761708282544195 0.11476352852297957985 0.24870774507981174839 -0.076783939437668868866 -0.2165224857881450915 -0.62831912075156548525;-0.071850743566285499297 0.3032762303267523829 0.61518839700554295291 0.090110100949305854678 0.22323843622943934095 -0.34020513307198196884 0.29364775843762064289 0.43211418881998286956 0.37913893720524127762 -0.30968444172017267624 -0.1633465734421534199 0.094820509740210404126 -0.12067172651054886012 0.41926012323740030618 -0.41831528199651119015 0.24783386523501363397 0.47700669500631681652;-0.017293606672569954152 -0.054357195594355013635 -0.6247911462066636501 0.39363460814591849646 -0.18961858783898735692 0.73176544807279142457 0.64100291851101220963 -0.41373739454098978907 0.69849604980919022257 1.0125425541123567186 0.055417044790768296703 0.54282315655592727754 -0.13297142048279195214 -0.25390572541030981268 -0.13781962369397454671 -0.27095160671765844418 -0.062910021113648240121;0.29028707318158680772 -0.73426907539077246323 0.049192625823968688659 -0.31112739387693172377 -0.20311121705189016939 -0.038933052637926457429 0.54473214963859839521 -0.26215485862140547324 0.2529961901159777371 -0.43200768735456879233 -0.4139184883875264287 -0.25158002281568869751 -0.01546006932692954236 -0.16387988996756056026 -0.14658637131442664447 0.1270748270496772081 -0.012711413709016143939;0.053703699418112066377 -0.23575770032698600831 -0.29408497461631666337 0.58932521698219619832 -0.23373897766007101229 0.6027859149871752642 0.062533718736149254691 -0.67104146402807274274 -0.15545017540691447033 -0.20533568409169966618 -0.095676452488583016431 0.44443974674251174317 -0.5516908714945149006 -0.28822282921573955106 0.18125351047041179942 -0.11425949072066393652 -0.4778857199837207026;-0.11133173241134750042 -0.14492351640341144536 -0.496202390135854432 -0.38388392649756952757 -0.28767395916726867799 0.56098506558033955915 0.18820687799951346664 -0.12044927586147843868 -0.13968870928233384499 -0.111484976908225078 0.0072801613110332792644 0.32336303642275709969 -0.048966852068648855645 0.59197203387935481977 -0.2886483798022995706 0.025147363638974851163 0.2903115649791273567;-0.26205522020560723107 -0.20370717939887572623 0.51555828820257754153 -0.30570291082393091786 0.58230765253567184914 0.64989561780930305002 0.17032970084570184244 0.0011368531125766538972 0.30650867097150835683 -0.99554359965178873537 -0.17839208086411778575 0.3315002495155038309 0.31076444507194750377 0.25929362083151519247 -0.24756160466275353715 0.57047867167677501765 -0.12111972703651339989;-0.23150585647379215426 0.4276108368764533485 0.32016866987962194768 0.08167841252589767842 0.067288480632824193561 -0.2644936828498892778 0.9799178094632423619 -0.027463645423697786996 -0.13267886740327747286 0.19039384474199874675 0.45633516405122925841 -0.192473232885315787 0.47379700346733077954 -0.28028332057174948355 0.11233877187258080321 0.22122127772929742195 0.61571274970166411933;-0.28634529174244011118 0.23879491744495889849 0.45920204745617326791 -0.2557351525855007246 -0.13787072909866712744 -0.36262566624422776229 0.018786219821026618054 -0.033461124381046265797 0.18720642424951305927 -0.33752549116018204511 -0.32688971732219451738 -0.35137645488677815564 -0.062217386206238733948 0.29994960173872303733 -0.36312675748549688715 -0.30301405548878679319 -0.28896163573487787524;-0.33365567506227633565 -0.48666356340803895719 -0.34280660406587543099 1.2220771753618686617 0.13615772085271504732 0.24274727335279211449 -0.24828828199810235033 0.06593453943917777782 0.3657421239595043394 0.095887556191358969127 -0.23017938016602618179 -0.4309424702570818777 -0.76455081375793021436 -0.22060110300541227457 0.140530605582612933 0.305215351769072607 0.53553646909580732149;-0.40825049663623225182 0.32057321329538407406 0.3884936489426314421 -0.98642636234284164498 -0.12179859501839176983 0.38486703336592009705 -0.44502174180509446177 -0.43941333232166335243 -0.2575189079550214144 0.39438582022700197083 0.10145195146279167853 -0.8112910274473693617 0.97549314098010064811 0.13458435481668287736 0.043590297836323219083 -0.040615450400699887323 -0.37789878781730101842;0.089060203959493836057 -0.30652664300849447043 -0.1762390259131897674 0.22461606784377033397 0.029621045773337031926 0.0075936888343356417214 -0.37966937153106350422 0.029068641699917907584 -0.18617578290746472636 -0.78969337030045660963 -0.027221377318966968883 0.99542778909432449996 -0.51807671799160004422 0.81309576917297099463 -0.42744577060081317965 0.51795491690682782249 0.21081431717711554552;0.30379509293329232111 -0.44088462680600520871 0.1117058246885190842 0.44062173029707435434 0.29708747308274530141 0.16230103768192311042 0.2810211988901224478 -0.26456273584282780087 0.12595717454657395784 0.14477467839395485871 0.081541689692215202356 -0.30045273270129901899 -0.62870662418523859394 -0.53039182127578443637 0.33506975981498204886 -0.53775200330331318632 0.29969953740982391288;-0.3415424136646646458 0.14277001225785912464 -0.22149242225671722517 0.59507547588812637063 -0.24374650515883547475 0.12762493715940650962 -0.32001465151145724874 -0.29250089916494237396 -0.019831148313692543994 -0.66343596894602208103 -0.38586794955368269866 -0.39770624246167668447 0.49395423615814171292 0.69245866939049238731 0.28125166715247645888 -0.28165327673582807311 0.14235662608153037967;0.4893964058927462446 0.10846014133788536848 0.3033873623104320072 0.55106401416369910073 -0.0088033329958054906683 0.72412688163807770181 0.90814054268930666236 -0.16072210922620569495 0.3938525186438139869 -0.60430287518700687155 -0.14425277897232874347 -0.13065046442020575301 -0.11923985371637439712 -0.12391910334815794958 -0.012086618003506712643 0.49254513872860167245 -0.0062807637592595805254;0.23760263255023042483 -0.40088344458510571933 0.19313163736209121302 0.45416086421842771781 -0.20990396078751780151 -0.37371990006877275903 0.021835016640923986253 -0.0029720182104383055521 0.24535610917053932156 -0.81881987765597974427 -0.27895313472889454731 0.25010017033444897905 1.0847928601719118991 0.14517913768457652024 0.52620791565597446748 -0.36104323216117806261 -0.28978697938141706469;0.67122036551662023207 0.1727386182217486299 -0.03775947689298855825 -0.013134629034147259768 0.051605349833163886852 -0.43623886589664584434 0.53455858327601124547 0.11744740003191009303 0.17937439623298198632 -0.32988435910978142207 -0.25101831178794908883 0.081711479509824741507 -0.11922660658185421645 -0.32570797943692414433 0.75507965890854478186 -0.15274082357358917394 0.45290693137482107566;0.22694390427291080692 -0.16349092236607673523 0.56243839286509078601 0.26489990113168060404 0.25015900676952468329 -0.052950313147308351869 1.091929694950964036 -0.17108183928055942236 0.23117697522357749662 0.63026705421186235423 -0.22596854958384168799 -0.25555254167496566087 0.22067213941664606813 -0.62012253751081214403 -0.31738709563184602791 -0.063884990995477605735 -0.28041647363862953757;0.029806055414776717882 -0.48791795562820650112 -0.18276283059236042572 0.14417970223811682473 -0.062260368105144944795 -0.098818332961081570276 0.59309734786751655555 0.3623309511966072427 -0.11925271361394287895 0.49765108905351340685 0.43857820465627261886 -0.24263400530162892998 0.44961459998521002834 0.28054128943479239577 -0.85206832021332068461 0.41788380076937869934 0.045395134589013307058;0.17587852374480331119 0.096426092968062079858 0.67741926882180658609 0.40516929474437418657 0.094797954942456505445 -0.13892828127119363768 0.12385091287998833964 0.18855840761018435869 -0.28532882260877268088 0.28246868849940542923 -0.15376310022725209192 -0.35671861115839664791 -1.0434202950404460886 -0.24632902924159322255 0.4421119610954006296 0.079033392653904688263 0.71409312535711255698;0.082682035261848779717 -0.18250477133111342454 -0.058151756885078495496 0.54838524762260887346 0.69226683492079321702 0.22901556376556328476 -0.53109868511428803828 0.45221782074473548807 -0.10480888744181970917 -0.50366163721305490242 0.20441372407318680882 0.31646304281573828243 -0.72119497938057952613 -0.092923525761363062747 -0.54704582564524562027 -0.073451493776920187551 0.075729479562768611811;-0.61681382040778331977 0.25215736251298309645 0.69461168438482279175 0.12293271580735176673 0.57287500296306059777 -0.15659549688756804753 -0.56673921316449515917 0.044620136810107950687 -0.32239735089189985873 -0.030663458761167248362 -0.44506654606666251617 -0.42952908157880309581 -0.48878101518765526556 0.051749274403441597459 0.26309196432203879601 -0.19925028712901357575 0.24833127540039565129;0.18666477116655622037 0.077783459421344861018 0.91429603044816032398 0.10474510318783035456 0.11511876457273495511 -0.053424269595981566106 -0.092890943327538277874 -0.24226368065687195474 0.13057340850612231264 -0.11258694512222908179 -0.58462500121680160969 0.95624773295371823245 0.054160562789156353747 -0.65930380583469572198 -0.67905235519180429105 0.26677402249103487897 -0.44826044797802794273];

% Layer 2
b2 = [-0.19681587331308211808;0.64076499082735438595;0.28985226615878484369];
LW2_1 = [-0.67697040797425056535 -0.30832498521759560406 0.81861237702354916479 0.63058688492464354258 0.28043009711281541296 -0.40262228689177975705 1.0313866305563914594 0.0056858026281090302823 -0.45287863918618104231 -0.51304646089804473164 0.49086907439246063589 0.32337298199188413417 0.56667454098244984806 -0.46968177496703750196 -0.24610704099759064811 0.052878925510235104401 0.18886964063582786788 0.071515609829634618766 -0.065355401138222413149 -0.14316571474505654371 -1.1466879597527248613 -0.11709098739645551479 0.62849978138039841458 -0.054988004083910885234 -0.0067311253352226665947 0.66104719936808564729 0.059474556385115749657 -0.09931570767860425919 0.073820073755725426623 0.61055315751141492342;-0.3881972811898264375 0.6619846363000120304 -0.38698300457875878244 -0.70532489514837215516 0.49300923361472137607 -0.2061424287802003652 -0.44488548956148238345 -0.58898253702584968394 -0.21899982900412676146 0.14390109545399962232 -0.45937562559175254551 -0.14715823605261771356 0.61557939123769012113 0.29197537255828009961 -0.021857180775581797061 0.55044761966269595277 -0.50714332096151515383 -0.52475237430064658462 0.49644292401414563676 0.51153798338768674547 0.69791830799547605046 0.39646679505648818598 -0.017651808787201208467 -0.49314420273773001968 -0.4187396713008029181 -0.56625817740897765873 0.49950993833435852753 -0.74764947343869081475 -0.12919249539455418541 -0.099389807243657660174;-0.021686138476221583637 -1.1328502315828707925 0.16620715012359701945 -1.137386323993430981 0.87244681382298894246 1.3015659357958742071 -0.26857403832115728237 -0.49646531905269708496 -0.5588994957895302429 0.53267019419185890339 0.4395304682775107441 -0.31879162593172172269 -0.44689610823720765653 0.13430651693441933436 0.98029854812804639863 1.1651470339440890278 0.896835593230915884 0.8407813257851103339 0.91942374779719882039 0.2034972095237738976 -0.29933706576296331692 -0.3948145989951060697 -0.82982921418601440777 -0.51765630401908746538 -0.39584251353130167628 0.36245326577381220545 -0.69300889783742969374 -0.0051182878358271011177 -0.54920509725887278751 -0.80513617477606003181];

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