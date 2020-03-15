function [Y,Xf,Af] = nnet_2020_03_15_16_51(X,~,~)
%NNET_2020_03_15_16_51 neural network simulation function.
%
% Auto-generated by MATLAB, 15-Mar-2020 16:51:08.
% 
% [Y] = nnet_2020_03_15_16_51(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-3.97410284351861;-1.99617007911474;-1.69103646891215;-1.04723069924316;-1.53003798243988;-1.33210267353329;-0.881418107698254;-0.662524792023262;-1.05615487908034;-1;-1;-1;-1;-1;-1;-1;-1];
x1_step1.gain = [0.288124361486755;0.629877789735755;0.582406663687722;0.537631560261711;0.670020317820407;0.722469746440657;0.822531466710493;1.01473630857431;1.06678217975399;1;1;1;1;1;1;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.6004804851864984361;-1.2766753880427523793;1.6898405925730870525;-1.0535131581011605295;1.8722016669502872244;0.45771953873379228606;1.3735196579455906107;0.98981148395632712056;-0.54738459882439427506;-0.65549948606713615007;0.60461309980996635893;0.99076710951731794541;1.1056374539216091701;-0.27197110988192657599;-0.73717266236124001644;0.74330221177341726513;-0.28936641518867123324;-0.23983531955132403324;-1.1184313140887385263;0.66111831487611272262;-0.67249776729690902144;0.99091352300762958194;1.4302572089490319662;-0.96515797743516873464;2.3468954079044141992;-1.3722250304540040133;1.4952596452944699745;1.7055142624709325183;0.99899420578516973102;-1.3722590359833741758];
IW1_1 = [1.2866697899702401742 0.28770464672144513418 -0.53563042606569277737 0.63810193081698085571 -0.37832658006475006207 0.48418539629288709358 -0.46320152330678920904 -0.19256736751707176358 -0.26941672575368447173 -0.090905127071102834191 0.29080088762553640835 -0.12375374405088229723 -0.34174660566096287662 0.23634339586151426049 0.10926380303974742025 -0.17873690573195757936 0.52523592892005488419;0.36478694722006693718 0.24938643390698439495 -0.75669629736436772038 -0.53402757788752741597 -0.77177535891760351561 0.017971424265356295696 -0.37932924491049324622 -0.14634738621331050412 -0.2366065216561439033 0.29300754725702976566 -0.20861519492510649521 -0.28735154696856152201 0.33214871465766909742 -0.56613088114785481419 0.080832383254017745045 -0.37190912447407686869 -0.63202000791897239296;0.38960013174503416167 -0.53474744255344530686 -0.34890807862410749829 -1.1862475958789469033 0.37147607969340307177 0.23507737182707502677 -0.087281240048575139956 0.049109956555626735342 0.26764209742562139471 0.78664990791163424966 -0.43514913277950739712 -1.0791534938329572224 0.059400483851359701937 -0.36744191365176548381 -0.46723988505755359446 0.32700888764028840372 0.12459406157891150801;1.2267956229663912193 0.34817956581112219361 -0.66682912974076857804 0.24875383766209555048 0.084512895662721812529 0.22378087148386172078 0.035739519236218167397 -0.068266548105015742443 0.31958340412685476428 -0.1521046155302231695 -0.25715645158695349393 -0.30080346674532187912 0.29217865999370107311 -0.44513339739557788999 -0.1131705016852189577 -0.53583620653422991964 -0.84435493626057656069;-0.57841964357762121196 0.31718320849535647232 -0.13307826252908103171 -0.58363095649705243328 0.1849847410993882002 0.17312518304805793457 -0.026699343016015342211 0.1629501793707827384 -0.23348070692849950958 -0.15367574185659485519 -1.2673161767314926607 0.46999957668937131228 0.46367259742514638221 0.67470743869168592344 0.33148821662304633895 -0.26794295877532259276 -0.42848920297025783199;-0.21084398454390068656 0.2087482040919510784 -0.54517535381508996917 -0.27729053799884595399 0.24631699551513366875 -0.46577524918048812674 -0.45844814823019114369 -0.17916345125834109986 0.33936022324074410772 -0.083387099228271047147 -0.44554839078275804143 0.22162144524627630515 1.2712965126152206974 0.080600024285994081863 -0.24478825297433123853 -0.068547963449700655136 -0.21859407702545297081;-0.69640208021930849469 -0.21480711889620507371 0.013107540730076751648 -0.39941488329979585314 -1.0452119462357825075 -0.092985376795926513727 -0.22155166564262163131 -0.38756603188612309685 -0.32061418168402511242 1.1528126643040403909 -0.50801527492240994288 -0.62378816422590921409 -0.12805726440019643553 -0.037970717302167202034 0.79231533406716103674 -0.97216376037822327394 0.046392858781793923362;-0.49810766848214416136 -0.032342393962561916121 0.094939569912273438779 -0.10204297943476417498 0.080172095664062026366 -0.2558556222202500452 -0.44250753428054406813 0.037782521773483374039 -0.31465163500161069665 0.52865291348259002557 -0.30531047021857909973 -0.030208060268497649581 -0.16971374812507797336 -0.64947144467510153909 0.26878431121772972112 -0.38560850354218795255 0.068470173857611449364;0.012425356670993280284 -0.12481477015877091852 -0.39094477170918506825 0.62665725153615592369 0.030406136589732932901 0.033012160359468523119 -0.48058159841074560292 0.38149955136194052541 0.01497195947099928641 -0.45948428493819459817 -0.37585855813077762022 0.39827388628666809955 -0.036196508333070642749 0.53396085137523108255 -0.42644898058624786108 -0.0025071524544697507998 -0.60445525421345480677;0.61213241331365353393 0.30748406276678913462 0.3570283059952326643 -0.13991768965339310138 -0.39348781157868417679 -0.74813638899686796258 0.27671028435585354188 0.091743579208360057087 0.12329236916426845883 -0.48338225240709298269 -0.022048621883294036022 -0.24894175475447327672 -0.34839947033322676839 -0.46775579890513030445 0.6789406228656362785 0.11561224500209818511 -0.1529927051190786147;0.40740497461481317565 0.57618107242469973617 -0.10851217342507968322 -0.39150088065202975907 -0.24610515397170026897 -0.20378166978994283198 -0.34220070164061655582 0.070561135575907527051 0.20189850029878667059 -1.0281647450781579156 0.30374196231278466351 0.39096054130132423809 0.05586658053933938467 0.20932765769241692966 -0.38751478818743656518 -0.071421431179843813952 0.29954131871499461992;-0.94861604267696630899 -0.0019335430627834991266 -0.17547553718976738324 -0.057445049225986255514 0.12021620534921657886 0.053400463866343304831 -0.1830634593655366682 -0.17781199702278144281 -0.055637957657729289473 0.53363030978780234825 0.029176369033887563503 -0.21993736059582874587 -0.081616175535620921755 0.4280388840373404169 0.033636635406696348272 -0.31385327969849574625 0.26521847901519474133;-0.11371328646714645716 0.53523307058255675805 0.029996113590311550973 -0.14306739895953671238 -0.11118441592322286793 -0.085838953994406816395 0.13267061769442370367 0.18088724207003756272 0.13120037198530326572 -1.3160132005971403313 -0.16945555662044778367 -0.10464534725442728447 -0.13410282983034271798 -0.64622863466990765335 -0.60688989098829471125 0.098635910890330455447 0.30508127570459347977;0.45895527012008635603 -0.95259933407521091286 -0.44646411501989818893 -0.092023514916115670137 0.35804948805955449931 -0.34383869840967068443 0.16920157608305211316 0.077009845505235430263 0.06199424834032159215 -0.69408798869217458449 0.12750599384494773481 1.0993832688144935528 0.061384554905912970535 -0.23552384185799513094 -0.04198541339772703801 0.009365075451237353521 -0.23110266198275458693;-0.42938761259164454076 0.19661140844379532133 0.38775217972428704938 -0.6287907665354155462 -0.67849376398968219704 0.017635656945161469478 0.19717852557611853515 -0.18138251396757726353 -0.15352588267859820781 0.084877729639467588973 -0.10303057129500660383 -0.86032317214698905694 0.34575225117484231774 -0.25562595216950101396 -0.11413556037290784051 -0.069807494995648089464 0.6412413208902107975;0.72514256006141819544 -0.46439611128857843925 -0.19697475386637161576 0.043367447772903994219 0.070656352370527517048 -0.15717146544489341009 -0.0067780468173214937153 0.10774297606571850427 -0.34602953024905325208 0.76246066509925558563 0.49392827902370894932 0.091434977109494386394 -0.045938124874287077082 0.34162123971556357382 -0.15065607011621709455 0.17603949627429893443 0.71990176515730408546;-0.42096775148415782608 -0.052654981828396889287 0.18277116806979629149 0.76224707504050948081 -0.29477020336242248932 0.00055521322950741539004 0.13234354239283899202 -0.30985357014917708218 0.57370710790655887745 0.32582539902208762506 0.29470960426533521215 0.30587490426839447633 0.1114884420454418934 0.042405869317047595324 0.25425407622606283065 0.5799606768463251294 -0.31220638609180612066;0.83528608348691646412 0.33507859425628516714 -0.48515086121633144156 -0.44220905447806163613 -0.21230256655311424696 -0.021781390777237022438 -0.14763951136359038108 0.10849707487879978185 0.044957725248434610155 -0.074556976486897477696 -0.63934097299326775321 0.52461686309033994657 0.61001869995645086053 0.94648878683634818376 -0.51360413149921591014 -0.13221459105284164015 0.70505867544308042927;0.04223494264129176029 -0.4429346998206569741 -0.33421544514679807358 0.45276500297779231907 0.12522794916562196565 -0.61811653935210020272 -0.025290066657050563198 0.061982775239131447653 -0.28448503283420667476 -0.32181512456458960525 0.95085791447946310662 1.271630220205182793 0.00162240659152554801 -0.003132365835239060009 -0.22560616774112238203 -0.65600006178167313831 -0.20420381480939869823;0.69391165493396156361 -0.22913289079510704149 -0.28394710823894098173 0.52517785110769710233 0.39093927099502434608 0.63854544579417904515 0.27699739553671010039 0.028752566628419708866 -0.11371015849681538612 0.047892911477247591956 -0.15768118050001042607 -0.35620219937300967583 -0.020588172658067716708 0.41604885917715145327 -0.13840201867980891914 -0.11968647828077830231 -0.43607381669243527877;-0.44571037948346720059 0.19747056528356282668 0.21012669961238097938 -0.15748865231476869009 0.25219835259353901025 -0.0086289371990981456745 0.65347278259115659793 0.48413829251440321233 0.1382682617878329967 1.7999382339921254914 -0.31718185156312600492 0.013360874315344554303 -0.15889590796854355381 -0.0065588119471832019916 0.42595622092293605743 -0.11884763600207440271 0.030498601030978789161;0.24435401956247954081 0.19038348959930498361 -0.10292217005627696258 -0.94198727455330655278 -0.58624902243816678915 0.094424722131759036836 0.035145060069991004847 0.15817693741540575503 -0.55064024395487143337 1.0423786535541321729 -0.38951889918007825964 -0.43231075169661165036 -0.023610415184097982566 0.37250578135102518917 -0.54539224101077099505 0.019094203809260693744 -0.18729613594685468048;0.83656783459130568126 0.2421120264849516146 -0.34980407914143391013 -0.29608450888357856767 0.010779930291663054887 -0.36014268155221434986 0.25131016765814545577 0.38959231709858443971 -0.11054341236981042595 0.038015210947798243335 -1.1893400710953865307 -0.56119998786050862005 0.15792713077960285339 0.45501327962703241869 0.31198875080257354453 -0.050713065665541387506 -0.092549539111774825617;0.413480420116273506 0.15999105639923277833 0.32733717997506400765 -0.26694538187007721408 -0.55997305439584810216 -0.96775182453154606765 -0.030057818983047279032 -0.18080672182276891213 0.066781645432407069074 -0.51806320030851116254 -0.47171755183692604119 -0.5478752561673445598 0.16236375745164025042 -0.22797060538326471835 0.017315966457968953035 -0.11498494254598587427 -0.207923147688113652;-0.68467444594370296951 -0.25624829664728038248 -0.21899282597906680192 0.18490877615207731988 0.86707567300716603675 -0.28853259573573830643 -0.0079652704223160848696 -0.12884063015855190537 0.80497733293772844032 1.1275585986039222686 -1.3361560862696932883 0.81752913795627568661 0.61818963322352826761 -0.0706655169717981535 -0.53632259158415251932 0.25427925476576512809 0.093406054906089497347;-0.344046304826061633 -0.036674656634176357184 -0.47648033351744750741 -0.14888109468089374965 0.17284565078239999547 -0.4913187528142530236 -0.68081589284440857668 -0.24816187630542266285 -0.15322663200164640673 -0.70233737698886788969 -0.70637181454695929794 0.96303664886793693967 0.63719298623125741887 0.77365229833054649511 -0.17246728911476372215 -0.58507392479167963373 0.99894915991907007324;0.6179975873409104814 0.035541379472114331683 -0.42876142675433220885 0.63990340538718171182 0.31383954334279501319 -0.054549485736927950941 0.051755453089311349857 0.079364792289572300144 0.068601366960240384163 -0.086135813722413828719 -0.15813727968000010349 0.14904035538287380147 -0.19095050216550116251 -0.025743029249955529103 0.61288289973172249692 0.54823832849105313958 -1.1766662509262599823;0.1505325577801209791 0.0041109068719199903102 0.64738321642358620522 0.20419956673715086715 0.3553181665022117075 0.42724942144895017293 0.43374952918429338089 -0.41791415857904962161 -0.67029852739544759643 -0.81002336537613106593 -0.67344612477608400969 -0.46565325915372463017 0.47655146738821096974 -0.5430119968844031586 0.2726261302717543078 0.034117212418346851144 -0.053772093115635161142;-0.0168722136373712292 0.51653026564293225142 0.5923156307054590064 0.26032040032523051654 -0.055398798470610570444 0.58189694633362287757 0.31797852546124888429 -0.1455485687573130904 -0.29968198761278991293 0.71123947753698146812 -0.071555603652755261912 -0.53779517031391710358 -0.34422029743107107613 0.094190839898824679777 0.53536082553369568338 0.3622972765184267474 0.40354648810745852305;-0.43143505789599567724 0.60895411482439498752 0.38287300677900837353 1.1132224600915332502 -0.5775231749361795508 -0.34117504915473367832 -0.04057822018775718298 -0.31107381458283428488 -0.29062990593952753304 0.039610877257552745689 0.12353216638574678055 -0.41470977082707338734 -0.25248445343942643726 0.35795040455451637706 -0.30447884792536833443 0.76564756845293036047 0.82058468666937611768];

% Layer 2
b2 = [-0.53784649663367356531;0.36198266520706379179;0.33649221099766590815];
LW2_1 = [0.1685960978622024764 0.23364814886134466221 -0.17937601028085622956 -0.04859148575346041582 0.22407630906498657297 -0.21854473855348505174 -0.44778461189863089098 0.64754592174140390703 -0.20278817719286371113 1.3856257653036117006 -0.61897417607269245021 0.89681365561262649244 -0.67329226771074213165 0.0034771213342706668199 -0.081506595394351344375 -0.38609204418586595686 0.10805960032126202264 0.0087972861604457171236 0.096386366624770486444 -0.13308732246834384383 -0.42060182748301022659 0.43749884345273865049 0.2315326322865690345 -1.0048485007412424341 0.5284647031393693295 -0.054375028930038628305 0.016006930346576943303 -0.28069292114767663282 0.078205451365057493396 -0.09987255158292424051;0.18497264347311859201 0.065003697200427701386 0.41532121999549315161 -0.033643050946502890686 1.0282052198346340877 -0.65041730008949172337 0.38507579765986266196 -0.78061697562473120193 0.7268261414542503962 -0.44134970033287845848 0.83077056832975026968 0.6208845169570000877 0.82502135985880609148 0.98388861624530399297 -0.40887670599353304057 -0.46253108269327231072 -0.060088409047065236002 0.62285830611312686944 0.17474848037589810201 -0.58679393202348606451 0.94570418612430651173 -0.4461961151812876003 -1.6110178711456544232 0.83922138495085085719 -1.2187595094688044028 0.19636399856415748255 0.84241283901348440466 0.99343735225334117711 0.99823756945374664262 -0.44387247594365381032;1.4067196102509527122 -0.96312257711365156787 -1.6160027404323022981 -0.85107708809080651058 -1.0812519428136606603 0.64077131860538516506 0.19935113010369343023 -0.81569951186182854119 -0.43694867338667953138 -0.85803196484292110213 -0.52923695541485182847 -0.70617807577013780307 -0.56648407061576921961 -0.42090354687626729824 1.1400409731517400225 -0.27590413978251610017 -0.83796285416342031205 -1.0770613791262662051 -0.78634002906400435329 -0.64206046227878310617 -0.043762169713470543131 0.60777161662128886821 0.11207647937572398633 0.25951868606819411545 0.55217325868472133532 -0.28643332903106055731 2.2465041824657525638 -0.67083149331106817215 -0.91871206282422457345 -1.1969211071083156739];

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
