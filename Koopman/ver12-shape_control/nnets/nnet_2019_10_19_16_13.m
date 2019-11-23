function [Y,Xf,Af] = nnet_2019_10_19_16_13(X,~,~)
%NNET_2019_10_19_16_13 neural network simulation function.
%
% Auto-generated by MATLAB, 19-Oct-2019 16:13:27.
% 
% [Y] = nnet_2019_10_19_16_13(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 22xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-2.68923562185917;-2.55976352764815;-1.66744595493019;-1.41306720234763;-1.72853430470702;-1.68470124822749;-1.54419012603737;-1.19832180182087;-0.920880750180581;-1.33378768429983;-0.903705148758009;-0.769375356764508;-0.921590452260902;-0.517525552348087;-1;-1;-1;-1;-1;-1;-1;-1];
x1_step1.gain = [0.444678794681692;0.407242452141652;0.618934520080224;0.719788700875025;0.575604345071666;0.566071618910878;0.7594132340494;0.84999063747477;0.721977894496726;0.767034792829403;0.984427608258322;1.50655381729089;1.08895222470763;2.05283111042465;1;1;1;1;1;1;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.4876799057555238903;-4.4735097631979954258;0.72948693509708273375;-0.53416432811685266024;-0.40664631207957202541;0.45344285724814725747;0.89013181499486593307;-1.4008332703777073291;-0.64513542144486635266;-1.1684924129963247807;0.17420249007664173613;-0.10391110552491823749;-0.26731214929346297504;-0.053664223201563471255;-0.21860291474216922425;-0.11596528363172985132;-0.24199277464335311461;0.27958012960998745999;2.4019379842542876169;2.2614292316902298019;5.7231115029249277626;-1.1472829066152929745;0.49740274766040615262;0.90167144803979826229;6.0539088956756375026;5.5860514038148529892;-0.47918739784268621351;-3.8411774063104697774;2.6331332129082785087;-4.7857265325962687896];
IW1_1 = [0.16865356441739076665 -0.24241788823059448599 0.051630809149120611423 0.40854921807212191132 0.25579390683789793304 -0.040052923784694702269 0.045148332590706816148 1.137486466879720215 -0.30056193831587191267 -0.54205402161223092961 -0.057626798183618918592 0.089400352274630806582 0.065881011317230911417 -0.14169596217218860534 1.8110586617950013011 0.014385554393571007431 0.011591604860918362785 -0.25885778571885559307 -0.37705436215612586626 0.011699192068370974432 0.074872956917001590171 -0.013097926855420778669;-0.69664640929235666089 -2.5123986618685627548 -0.75127220548473849782 0.83165678321869884737 -0.64272383024707813171 -0.24048825871192952564 -1.6208486496921687969 -1.123020454977013971 0.68212650036101385442 -0.27658316335733645897 0.49765331847066851534 -0.041866644585019763269 1.2650710085315581832 -0.34757195942115581833 -0.8292505812766951534 -0.4945651877961680376 2.2054710803470660707 0.62215526078501037777 0.26608691011004753646 0.63054610620499851326 -1.9170852790131440724 -0.46764592832229956443;-0.1798673548030782221 0.38159204577916966405 0.47267317130791824953 0.20849187849007727591 0.02899430100105674854 0.12702458082008627471 0.25274180838975318641 0.22932887722728326207 0.28129761528373686819 -0.38847464159462163913 -0.24479433044865039903 -0.22137983330031518747 0.068456475835702565447 0.073881638384298606304 -0.45751893652993602668 0.24039307633002887643 0.83437959866052324731 0.0095108929152792620609 0.53788707542951241791 -0.2583325235360048322 0.45091945808725381051 0.38561940279855938529;0.69543086205541981837 0.25653953544810553788 -0.19118551872979336337 -0.38431614885672799042 0.15537815164240748045 0.13025113407549884781 -0.091262030094855992046 -0.47758802303687009072 0.37463885014757769554 -0.024270217741875994844 0.10312900642303811372 0.16214578859523234855 0.017898641855847063215 0.15301523549377979427 -0.16024456991347249546 0.0063613348892819767885 -0.12654480942666360144 0.86160313395925658408 -0.6655971414107294537 0.5050030085161435478 0.2493599041782346426 -0.17431854641124364114;-0.65418629671257400027 -1.3333467857136240831 -0.50419053292947046963 0.31798992041691276356 -0.94046308848772941502 -0.99288631254121606506 -0.64747039073215362226 0.25418623252034383553 -0.35908765287846688974 -0.053062345781292208358 0.054320608420002428063 -0.078949154451945197097 -0.33783680141122790497 0.088442620453177231421 1.409510688152593838 0.46988026296933743664 -2.0971750526722781061 -0.65865177644914107979 -1.933706336320211383 -0.5598807618917069906 -0.55335468312571134408 -0.66687155368327455385;0.57923195579755992757 1.2857699734116270207 0.18852453853922787608 -0.37813088832909996784 0.85158839288372700782 1.1194676769700846464 0.64160001023039492374 -0.25566912999953639307 0.27221300639924023157 0.02243401664800977191 -0.1403730258071466952 0.22419609452754657442 0.44043605712664996021 -0.11659304907797354844 -1.1925864918530200143 -0.84173133320269988289 1.8539824335480048489 1.1027157828269489315 1.5432234080002080745 0.9370945170869471319 0.87094610354174684108 0.19345900800317780699;-0.25070561136565783222 -0.23219729039883685306 -0.26212770540610003112 -1.3570474923182807014 -0.51543374434992239586 -0.30585455199353034361 0.37881458565785391945 -1.6427854232848211335 -0.16379000722028533299 0.42015171455919569921 -0.1280625268698473429 -0.28712401159950567964 -0.37303871475715044692 0.098370922328791410294 0.29098573071934108469 0.78741579872000144746 -1.5103946873685658581 0.034567878161862783393 -1.1817660256851072464 0.47425551311160019097 0.39950564678444494549 -0.088168250521723487423;-0.39324138598274965828 -0.14914695776627293067 -0.11076892108571126383 -0.071767484504887887886 -0.0014689667945385074047 0.369914437555016129 -0.27058943348616032454 0.043541218030012873719 -0.10925763165904139873 -0.052765326205390719605 0.0065176713620968274032 0.17160737724469249388 -0.21483696115634154378 0.033471049488728712995 -0.11111867279105869244 -0.59485320284024301163 0.036970342936623053209 0.8079883029892942492 0.11994173405435765156 0.35089711745867946391 0.16302127050852935342 -0.29518471043456068204;0.064264817620827655031 -0.45328923511187463324 0.074179105483535123788 -0.12711028878541766329 0.096934395700834230514 -0.31059728830205241001 0.10928122768304715517 -0.14449721651604571782 -0.025892856424780907182 0.33638706551106561937 0.24046584854149508081 -0.11755555996181246692 -0.040010894680820953406 -0.013699271147019777273 0.33326952372867785224 -0.0044241646512078736109 -0.67748487506981558415 -0.31240855004891265878 -0.25541787104807350817 0.29185152525021390568 -0.36098087892499602924 -0.19996670404221933426;0.097544267477766247176 -0.17083973874045715879 0.11800298854166071938 0.45264962922965218395 0.33685867624944970666 0.013088527645196645216 0.0094216973385217138437 1.0519451289944841132 -0.14793044284043546654 -0.59636218469744539661 -0.09830340913889427934 0.091367475285928409501 0.067438127909386719194 -0.14583508544399187423 1.5477291216253563633 -0.10992157872003525954 -0.0099556688034024218292 -0.55671736722775988504 -0.23832012436152416601 0.4935204678080883367 0.033008416786352044736 -0.17243768776015905297;-1.0624982943739555985 -0.20388440954895700741 0.8859827904134380816 -0.059205692124209043092 0.34105182421577806551 -0.093261041608694403293 -0.081293813664716885192 0.29221550471279711392 0.23707321514775314686 -0.93349353480613994627 -0.44404445540622350386 -0.25975470947610834749 -0.11015681197068385999 -0.26470573318778978233 0.889264763117941337 0.13811968464512933141 -0.22347911431850620012 -0.12384476987674340742 0.12817569686984120469 -0.0073286638746558503688 -0.057164243204602060988 -0.015128685781921242387;0.65945364753574775563 0.22124090180376884684 -0.89481345544582457929 0.28326721096263207667 -0.32452154476746841727 -0.1100870074568717355 0.35187523355097038991 -0.088104768484839057763 -0.40697664006313444274 1.0023799850457566496 0.46592752481182664326 0.47771768354621169106 0.0086137247400479670378 -0.097378101223347224291 0.46581177704799991979 -0.43513021428419695891 0.42293790252839819077 1.7422817481530030737 -0.12285872944973405541 1.4177757815186693424 0.1119205913490924631 -0.50603801001219483879;-0.85246476345329980084 -0.13644774937565193329 0.67529106734827215597 0.12997168995929780921 0.22682392062212897166 -0.1635257721300028555 -0.038987678079631271633 0.33243499483114297144 0.060343253438094726637 -0.67921747961161271778 -0.32983252804335105868 -0.20300081843591188946 -0.085544945314521628199 -0.25183371276987176479 0.80406106523749065751 0.23138691433359875882 -0.096150394936854968742 -0.26166298495288781156 -0.06618638716206563799 0.24591780000790144922 0.024008628645024076426 -0.094274193829209151918;-1.1249984153352299288 0.31389148842641628745 0.5490111152601627742 1.2310860916854939884 0.28667943839845644316 -0.20648025506336101231 -0.49717281862243933865 1.0716933686404024328 0.47649439395915049733 -1.0931162205434987733 -0.053698773843202034228 -0.32878237083936823204 0.080629220484728661433 0.42477858128149903472 1.5348462576906762855 0.38170840816760781555 -0.72152364677430502748 0.0019227064483726273754 0.0025456975712690099387 -0.79438890146012530735 -0.0088879008959614098917 0.24470965582877199362;1.5890785065069621407 0.90133546207534565031 -0.44825165364556285308 1.5630527970382035452 0.80052532222691497044 0.48785129045420116967 -1.1184325800436378806 1.0558802689801725094 1.4142823976230891603 -0.64695423312607491795 0.53275638820180015731 0.16018842246642331362 0.53517213274198260908 0.81981155142532635693 -0.77785557993323362069 -0.91879870060320401048 1.6081366244641051022 -0.30299591354340665861 0.64676656049936276371 -0.58578407430126933075 -0.26488970755611224162 0.13710230659921285312;-0.77770568140343110386 -0.91139221075027987418 -0.36805286075667692502 0.27431205025887939186 -0.5346430021598030935 -1.0317278097749669197 -0.83904815621617490073 0.18089384870196206778 -0.11642860755131230477 -0.076189830102722524985 0.16842197290577379243 -0.2244849327255113991 -0.22335978421515209624 -0.092532634399398489 1.1870527383041662439 0.60359225558353646335 -1.7364197157957996787 -0.59160381466649114568 -1.7417071010076474735 -0.75947724499428215239 -0.41737303668793307443 -0.62285625043496795072;0.37321535401434846602 0.11702168342971386306 0.1008225434397644199 -0.57518038755774469895 0.2072633924825358076 0.19536066099546187114 -0.1575985850996355353 -0.51629395214072426601 0.54297008059259999069 -0.22831586060192179954 0.020052278052251081703 0.059169681348176544899 0.076016899034623150455 0.21960531902146643302 -0.53417985089534780752 -0.066473048338887910647 0.2909790889414306525 1.0619663093481948035 -0.37524602772458781619 0.581988030042863147 0.14234910106084749937 -0.19776334888808697055;0.7073625333397164372 0.92534002036163920391 0.089572857848002271353 -0.34418404618522224769 0.54095474551131594865 1.1168195458456748881 0.76149196786306028173 -0.24233979593918503204 0.11538494906506926996 0.064256801355844578305 -0.21356346266950074209 0.34336182343941706874 0.30913401852995109342 -0.013106159997924957117 -1.0675586009278725808 -0.95773080966977208739 1.8832990265111244632 1.1728682067022426772 1.0819991680760601138 0.96952688616064142124 0.89166919005123679298 0.18395914668131974068;-1.4278507808105735943 -1.0626954937949639746 1.5407205554656084878 -2.7125294642944735024 0.40641256226590466438 0.045280752367721589791 0.0060605070855871967517 -2.0419252190709578088 0.59713442794782523038 -0.49923342904038325862 -0.89786461091655922484 0.22972736940254953608 -0.20249901425716163028 -0.22477288766271050213 -0.88337517316539360124 0.69302300747920453361 -0.8321984239887513235 -1.0820723482337843979 -0.59595407801820854399 0.16490234210145082727 0.24513177922630538519 0.059665547334632827725;-0.67504683638727258632 -0.07421596407596030287 0.58053081587382104889 -0.40903153850510709511 0.09423804302212934747 0.10491933892176730225 -0.12896409334592207063 -0.58135156360425710442 0.45749486722178217546 -0.26249059097770210958 -0.52613085997918773717 -0.334141521409570319 0.11470970800302963954 -0.040889289707237409799 0.15947180233956420592 -0.5298980967802924269 0.60857190275219863462 -0.56863655793813649986 -0.11898874061574578331 -0.18545471236643967794 0.019462566444382371766 0.068538022710494431178;0.65182465083723506449 -1.0526749602093272706 -1.0416640141336301895 0.44998226635611204838 -2.1749091995327072269 0.3390603068857919733 0.20483610042962260844 -0.25339750476027234072 0.24733456101184936315 0.20525968753068937755 -1.1813487446384292046 0.74468130443276292496 0.1607217438711329438 0.20927301582447679906 -1.9031597354804818956 -1.1881973625517407989 2.6468769156786282615 1.6208300587196429188 1.3407898192682510263 0.50575299918361504847 -2.1530081016587114817 -1.7124148476016227693;0.10640969887040363506 0.19643007588447844447 0.30156197231128806235 -0.68932681607386248057 0.072199854772452998208 -0.028053326872459812685 -0.30609188435230405556 -0.61448133994751075182 0.32177847991234453939 -0.27089913345594396343 0.13780323233553581908 -0.50640430038329387052 -0.010857565895255926261 0.45274309534086909501 -0.44484438906086176679 0.53471596712001490115 -0.80390868047871677504 -0.99148051880998422369 -0.63603765519066080003 -0.60558663277790691915 0.20866198647379718967 0.27606791325988055963;-1.4988262810859114271 -0.58517784291252683548 0.66673524659746097321 0.56815630628346014408 -0.15430225497426153236 -0.20565829986867489865 0.061433264836060021141 0.89459983238220608381 -0.49621135658737430818 -0.30893877376601741602 -0.52522921466268979174 -0.19728296031621794793 0.099238069956986349474 -0.30079670781184697503 -0.45312421277901671068 -0.095350905185571085965 1.1107776472672883372 -1.1099594905352654362 0.89300673013412223966 -0.9251901089465087713 -0.37674763011517525824 0.32798167004411971082;-0.23867512740475607669 -0.2654793093876910981 0.34266727657551571129 -0.46888742308415404247 0.14599849531569122907 0.03941387786127076992 0.15821742390947815537 0.0020500171090250124406 -0.1831083220176792925 -0.08561968860740755416 0.17453207998088637876 -0.26025755879425888084 -0.14673728617144307651 0.13692887128412614683 0.5446816360927613232 -0.21283394960597745715 -0.99387189530521424796 0.42455439471435518772 -0.55605989546717904393 -0.10609856790620995903 0.35656885812094674115 0.43185488539147615095;-0.01094001427322956535 -0.24966344995777697835 -0.32978943646404135226 0.098116159389313950534 -2.1351329395319953441 0.12017165056664094736 0.31836925805823046431 -0.037937020924966341484 0.36406220193431892973 -0.26079339831828740603 -1.3950908876238004019 0.73079396270751584286 -0.012097727249304131986 0.096274035777005662062 -2.179920125872920611 -1.5513458352505782312 2.9967585627630697331 2.5105885143267743231 1.8533176633483121609 1.2100289423131975752 -2.3461695285467083494 -1.3169165286466288922;0.82448455409108478698 0.29466435689042441703 -0.22478655451768506102 -0.64474573184548855664 -0.68790421216170305474 -0.61231462453613028085 1.6404166127901533834 0.30585115263091261495 -1.6732277220728510869 0.24065841972142087979 -0.7553363893121769479 0.69693420177341292021 0.76811526613366842842 0.42489491424041048173 2.035014996180610769 0.19195763914948002493 -3.9447642383158463275 -0.84328180686680809242 -1.7739599998765167577 -0.23613368772263815254 2.1512948514874636885 1.0086053286907397109;-0.24163222094764003067 0.57906912677201038964 0.074854908995547392303 -0.10104826917273562747 -0.22139454873644903721 0.29012146545859912594 -0.2131079088931114307 0.75063396541700555531 -0.33125341425801568818 -0.50469568286288279957 -0.26827412849465770428 0.15642125003582063592 -0.091211840695620521879 -0.14539084446355957092 -0.059801792807403150731 0.05812941679522373728 0.28959992167505854699 0.15157287955719678241 0.26607387790532843752 -0.16857105121291257599 0.39231995469570624113 0.37444717242494673926;-1.9514975168474499867 1.433071506834034059 1.6640922779452953506 3.1109739244384138068 0.96737244036296432537 0.81779730056417088147 -1.1567564975929962579 2.0368459433551433513 1.8598819226114928771 -1.0917187045154033154 1.0208765842786713396 -2.0434888446375421012 0.15588718919225655335 0.81310564673798946256 -3.2957116555886845077 -0.82020546779617775623 3.5989741006466808848 -1.8225723918543235147 2.292558437273926053 -1.2124164442304574685 -0.68674618858132918664 0.45530641728981408045;0.061668175639540412369 0.050786669557799993258 -0.16658186341124603391 0.17457837123178199246 -0.013437727768621232638 -0.14852209143804703806 0.19165287996714169827 0.1155528021984197351 -0.29254599280818943674 0.29508121278143800703 0.098834459077410008465 0.67300911117976947029 0.053864206176222291511 -0.015868648853150792155 0.60199234639743848252 -1.1056127367857804256 -0.87346442957854097955 0.12197216587164537438 -0.83290533544752298756 -0.59369460890259739827 0.27671236195522463941 0.23288498433287882494;4.1510526623151751124 0.70578911581196790426 -0.69340248627963219086 -0.75096487712118364932 1.6875520770676566418 -0.12508285427137116885 -1.4353095556096162611 -1.5594925416216800507 1.9809270153977664997 -0.62333838093397619939 2.7002772344927632453 1.4556730710096488224 -0.35823291593556638723 2.090579609965678376 -1.7308943318117899768 2.0171872261987835451 0.95785703779377728839 -2.2016856450682262825 -0.20220079812914387718 -1.9394786864081714484 -0.064228744073821231186 0.48990868036720769396];

% Layer 2
b2 = [1.0541631486536426898;-1.9041774331084064809;1.3794797708118571311];
LW2_1 = [-3.4145921725429078109 -0.033586255612917191582 -0.012647421010393251201 -0.55384987881957092881 0.034920745252726162478 0.10803730920102498636 -7.1820083215559118138e-05 -0.037895123130087401964 0.067911324322256425012 3.6583088528519471794 -2.1034759093899926263 0.00012797159893617607112 2.1666805193833020837 0.19387242541749491465 -0.033667168943618160093 -0.036026002877481713704 0.27387343815325049246 -0.10865911554060674049 0.054572556482545810097 -0.76410744882177372705 0.01954280028254264806 -0.0033670431916200385322 -0.14730481157555033733 -0.073590603500485018973 0.061908398712673742836 0.080592310395111527166 0.021057966069553023941 -0.01946021288664563989 -0.20288961691450863034 -0.035304632725093210155;0.96016884908187405401 0.15343511477125140741 -0.047314945009027789546 7.5933105630945210152 -0.030170375502747901614 -0.049623943850797248845 0.97901899677816817125 0.19317639940274886068 -0.094102783311781540432 -1.2492769165240535933 -0.67232652554059257888 -1.1370024806333780543 1.8304990279815198662 -0.70898116641341346611 0.87557382413694606615 0.023432526717466210103 -3.7750566974224488703 0.045572349667205649948 -1.4486754406042485765 4.9515086221146384915 -0.25322801543188372397 -1.0482429127526387003 1.8200788986461218233 0.055650557338550281361 0.4272427448794129945 0.15849222826071790449 0.043160994801615976124 -0.45594371283688678309 -4.7289282591477235229 -3.7391545812279431971;-0.015311608875520646422 -4.9902497151783800078 2.2755156820540793916 -1.134634613884714982 -3.9889682900474059402 -5.5512735452014947413 0.20109350425417360508 1.8513583200458616496 4.0775882029423664576 1.0312418827580605019 2.1806720196590507754 0.20064926058314325186 -3.6311026091267248894 0.51231459936335865812 -0.20348015306132730129 3.7245195752283524193 0.90378182596304890151 5.1954152415610579396 0.38766984882996241568 -2.6011319306219715664 -3.5649100208926349787 0.24513386835082509596 -0.042720942809792272765 -1.4464235883275897709 6.602048300363293265 -5.7904353808793596059 1.3524867875694195352 0.016436227543646587251 1.5855967226549130267 -0.10298921796079178737];

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