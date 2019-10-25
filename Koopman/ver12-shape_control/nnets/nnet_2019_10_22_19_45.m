function [Y,Xf,Af] = nnet_2019_10_22_19_45(X,~,~)
%NNET_2019_10_22_19_45 neural network simulation function.
%
% Auto-generated by MATLAB, 22-Oct-2019 19:45:44.
% 
% [Y] = nnet_2019_10_22_19_45(X,~,~) takes these arguments:
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
b1 = [1.2705729553627054251;-1.3839655962096382158;1.5343480433314544698;-0.63111135514070415553;-1.766320736286192572;0.46233192488267732534;-0.90787052020542913233;-0.82053909209413389281;-1.2022774217232308214;-0.338512941954862423;-0.43987884119671927241;-1.6575748152866744967;0.41604624874817958124;0.94123816018296724284;0.52368078664189410265;-0.25854203857144192336;0.16483223398222138223;-1.2026480953679568042;0.53852252183312299127;1.0930288417027458348;0.85485696429793955886;-0.97804623001316592923;-0.34896208995428218413;1.3396013767393459837;-0.46108786848534422109;1.9984613225183081031;-1.7585072359991891222;-0.45578638188339781756;-0.37622057220223215079;3.4821217756784319519];
IW1_1 = [0.57379086177943006142 -0.43300323802752671565 0.066511310835378478767 0.77926721728421310953 0.36742436419812007919 -0.59250026333996896888 0.30668976159426036832 0.25257324744511755465 0.02821298974872928772 0.31827394486126242557 0.21898844130413580578 0.065344823202625954006 0.11633535017552647239 0.098533007087448998274 0.3265826336573369737 -0.01022853462483762875 -0.83596073471177678726 -0.34572589357116423336 -0.2238330424380071404 0.63460969742148942707 0.2788556702692728817 0.75392323328620292067;0.20068301833070778528 -0.07303597427893639138 -0.22644645248293676643 -0.1025465911028358712 -0.05695169079578320942 -0.15559642081089322674 0.33525652312159365254 0.23144439144858167112 -0.50960098430079714404 0.22069766367827320375 0.3565097778585642474 0.26212812807191576692 -0.20218995406091092026 -0.24081720123634675623 -0.49757831571765104295 -0.64304787674298180544 -0.17731794979383749822 0.74724587941374642774 0.33492171250822966311 1.095281531100444905 -0.13465323834931350322 -0.34317318816351272126;0.012425194923930843807 -0.10618510496036753787 0.040059908219714168709 -0.10179728038534154033 -0.050682916239281075588 -0.55068977332474744468 0.38735772883326530236 0.13078546791526887705 -0.31645772434113700333 0.1545475170126968667 -0.028957153103097349467 0.073262676371464802161 0.073913376913011613611 0.30035110127821273984 0.6696117964054925098 -0.036244621452539524387 -0.78186809276428437254 -0.28581215058066367085 -1.2440483917323030827 0.61477664038945356584 -0.19127342506167288594 0.74642449646381070494;-0.26349963861541009225 0.15358831191894115054 0.27230899447417378223 0.31793747950020262438 0.11970030432884014304 -0.079393047652726631003 0.053289556198567934742 0.07627637495862818473 -0.082574240055104136671 -0.084327704718429652431 -0.26758657134582641834 0.29505468076692142887 0.095846073130565700993 -0.13024666379341498512 -0.6723983092342629142 0.11787920625679898512 0.85244576656069837028 -0.12746135706220310113 0.63231105989312286209 -0.19893795110170517382 -0.22598030168111662985 0.067496760032355551662;-1.0194559734655499472 2.2811799243337702592 -0.069239926552286307215 -0.35772200808970228136 -2.1078790429993721212 1.4814980293285642254 0.32030983728424006207 0.52536934592709250147 -0.98240110107299505326 0.11318658198532852155 -0.48247499479890598728 -1.0647920541435795805 1.0314148919087131606 -0.21928223921765852 -1.234673409022821966 1.5657831593142388371 2.3617025821824366716 -1.3857183346252373024 0.77158954759847397931 -1.6703895084211302091 -0.072495767538062666491 -1.9220574006819683976;-0.081138762976113526504 0.0115589670508189548 0.25764763847468874491 -0.12780884416222357269 -0.045625375093908210333 -0.051920969877358801037 -0.22975828879786500125 0.024086963026764544871 -0.0015183124482121682954 -0.3974094650181245747 -0.23478505483249195729 -0.32072093198030271477 0.048015564683036755789 0.030762980511410027706 0.8753829188733933675 0.38676551399439446088 -0.64872727628459625482 -1.0982144526818629071 -0.015604878914606639534 -1.0892530026700226742 0.028705879649578321805 0.37110393303787037045;0.41927991220588983756 -0.15128120780076981244 -0.22019806746967626743 0.027541057219600272726 0.78996310814496850661 0.17289914028643593724 0.5902518652974233504 -0.058107221545770415538 -0.1244804614339726917 0.34510344707797985242 0.25431770889351779097 -0.39678939021785830654 -0.02895926890337914214 0.2052408486256635245 -1.1503989886974821388 -0.22513377933452449753 1.4525273472466502245 0.038806635856571874976 1.0941001100172960125 0.31606593060079934965 0.58221017164124122534 0.87788859981766542706;0.52425144311619653603 0.89908101521311967197 -0.28904828504050444904 -0.2302202199135267302 0.28161503314246488783 1.3963488884688717295 0.24296232382474641787 -0.41607329666176895433 -0.26825434710726725474 0.25540537534123997077 -0.21772013142419996412 -0.77423280683023476545 -0.11062068640893531202 -0.17845812870178839882 -1.5228695060539632067 0.68898261111505332277 2.6735856530485171412 -1.0323323177171246368 1.3359481896529092904 -1.059235762382695345 1.2618106468891090444 -0.58667024586076055304;0.68432314052684362071 -0.086274481554412876805 0.031998886801430766191 0.68628006857748857783 0.72502474472309885734 0.28988966451598979779 -0.36736373377970166221 1.1669194487698020257 0.59602155726166816674 -0.91628080547045664961 0.22493285402302501397 0.31166437425201753975 0.15201749534440334166 0.35900569634355206095 0.65964872526433770972 0.16675040302266389003 0.41916910176140853572 -0.25188080992793915325 0.44718630636049011562 0.73469269603074593977 -0.13936172623168838203 -0.31361888431049461667;0.79052756311196470396 -0.414257504408912125 -0.77800343411795003234 -0.63351870084437300612 -0.46210811416049601963 -0.052225828366163705441 0.079240716991968968008 -0.16259291102106793181 -0.5690014734005582886 0.71127723180814639292 0.48690603221827372105 0.43092945330473164667 0.051230799188539177802 0.45052381211012304529 0.6679374972540484956 0.5527562080132787381 0.16857445359742570523 -0.012601248726677073339 -0.47921293349709132015 -0.081240705734308429897 0.15190026894089933562 0.042189390780408113357;-0.087465584700226209347 0.041722819135303408633 -0.044699662850879014198 0.042015374962100650313 -0.10674120550744958802 -0.096743241711839067509 0.12080593656389042312 -0.054394186559091235733 -0.16282234054246524924 0.18651250547546663339 -0.14537964090093410952 0.096698936978795640984 0.091779254932955162127 -0.1730413283425229487 -0.86455993797289887315 0.23044589494064834923 0.61788963771452043439 0.30436927572632355155 0.75690083519832651593 -0.21326691881251566563 -0.28228022067210134516 0.087032340957125670089;0.83595551881262353255 0.24390244363774599146 -0.2526387807767739857 1.4549580656017917502 0.14613446912321251259 0.26822968992329848659 -0.32154837793552087932 2.1285100267393328721 0.22874945248827191491 -0.33317772099224823856 1.09994649848133208 0.13329581522958552919 0.59891732105969874844 1.5814044261477639974 0.14649900540573559948 0.83939189277380077403 3.1235384107068693282 -1.2614712007117170334 1.4650410970126011012 -0.62841817642379926845 -0.56888724243120725177 0.11091164174267556519;-0.83413695866055304062 -0.14020456078905782493 0.40183035777284437096 0.20562401261148582909 -0.3204398601982500483 -0.28004594843216834565 0.047199756255637596858 -0.034865732105932710494 -0.50262341317706693555 -0.043443084645695448365 -0.76304229071691387354 -0.74356963441192447384 0.07948707175348700138 -0.4295905072596677976 0.82637380105850222201 0.67173376189200628694 1.1537215112936380912 -1.7752852878446325757 0.61631832386306883986 -1.3086617013569208368 -0.17087585041966388277 0.45173385869635546142;1.7961448222794065277 -0.20137980184888112922 -0.95260161496225959077 -0.34178221081556892091 1.1087904325316300103 1.1284374228525662076 -0.75135481676589277455 0.35103163613596177761 0.96348140232942780514 -1.0256688498188462066 0.040652843093119443718 1.0206336098038155669 0.39228135814566972295 -0.027402032711783680385 0.12682238068148798948 0.16460989156846425607 0.54222326521237995678 3.0109443286111576832 0.56492119118988648463 1.0406405925252315559 -0.27299016771847883778 -0.37425370006275565649;-0.68133262126688598492 0.11974078225273457332 -0.010248131060767731726 0.3059016566689914951 -0.69347640516636244179 -1.0232746639413783374 -0.86918642190654171742 0.093154918222669927386 -0.79609380424393116904 -0.61259066177069987358 -0.947711503477865147 -0.56150721122541680241 -0.41322139887863779117 0.20810908813523271155 1.1185397696431262915 1.9115963807575357958 -1.7718614302643249658 -2.4528984020119275478 -1.0443692455019664145 -1.7972137335374924749 -0.89020632272322697265 -1.0430168007585569612;0.821860103984661583 0.11183984677354019688 -0.29448638142530064732 -0.2285818533058709412 0.35047576306000033375 0.34983222314927092667 -0.1720318719571379551 0.10498492356566449524 0.6756478914081289755 -0.13392280328050970573 0.82925186704163522666 0.6025876205356140991 -0.061326750135363698735 0.62673580513961701932 -0.9433724178954276951 -0.64885419585152304123 -0.86236900536350247215 1.7852168000574202278 -0.55979571565773222908 0.87068463162653719767 0.15549366001511633062 -0.30200394176844969074;0.044486486332724499426 0.046031788177650502514 -0.15348569894788827161 0.04999492788111181002 -0.12900340829562181866 0.11405960341046432471 0.11143418076770902903 0.035144323831539397984 -0.01165086178353661947 0.21390862907402807824 0.27207724913872721739 -0.23583529872111391734 0.059505541660959684891 0.03290128511426351765 -0.47511946639399782466 -0.38366135494977904319 0.83240311492394336579 0.67851880016283871999 0.23318315457564123272 0.21848434755979917465 0.0062038524568449370314 0.051580996187569908007;0.25769789867320069821 0.14942736849290264023 0.041561317069719320993 -0.86039837088992188185 -0.01086673357249977323 0.21925427842840850001 0.17368706476426856722 -0.41691395276725318197 0.058259809925857740376 0.15330451929786634291 -0.14102969558814784645 0.10636008807271786492 -0.29132880614593104074 0.0049489520188913324605 -0.36359290258608389923 0.81765850888728797141 0.6631497048711874065 -0.26571574320878460496 0.2390904700355036272 0.28218717778575264088 -0.075866200071293382612 -0.12163750200291806314;-0.70588217300344080485 0.19857869343799741668 -0.039624130168912231886 0.24366016929335929109 -0.72459088072015098714 -0.82763199198404802104 -0.86806254652581282816 0.05485735200597448985 -0.80299133900329533464 -0.64513074345312582114 -0.93443536954234807101 -0.49798014561407422107 -0.39768954870769995802 0.2044449395057818808 1.2035522865799186398 1.8473718233502369745 -1.3679353614113096693 -2.5188584462607761516 -1.8275862527029658189 -1.4777023111041007741 -0.54730441160568699122 -1.2151932741156832307;-0.14398658581437512316 -0.43477369813744665139 -0.12829061418681364515 -0.10649194354511584693 -0.20628781434506032744 -0.44414896059638869774 -0.21552873179009773841 -0.064683329451363819063 -0.023824442324742140659 -0.058798352902670401876 -0.38996269851940468243 -0.022942999112458638267 -0.054935644595394558798 0.015304704617855609261 -0.0070727869206011657888 0.41303223700751384717 0.32490510143821821343 -0.69969372794131445836 -0.36749843469408022267 -0.50085745470941001045 -0.60568489444979345393 0.26579148982902806031;-0.47744842215934485408 -0.93699620968288055423 0.35259265678298190583 0.22010711815610570219 -0.24461443031992338715 -1.395616056069611588 -0.20349803079575318199 0.43646915978434264183 0.30329845810498240466 -0.23182112368691254467 0.25188523803036644289 0.78302889427511701559 0.12923100953280802772 0.16508282826538020482 1.6409738746300661649 -0.61814022864167561533 -2.5942162271817674757 1.1058704162781027858 -1.8149297612370731692 0.74002379413389463014 -1.0740540633360322609 0.82816594167125190395;-1.8343993949422376932 0.21501980658281730219 0.99245019220472485699 0.50955878618214933695 -1.1203264129181771391 -1.1997454507018339154 0.74176601661925001263 -0.24026371462801002221 -1.0203568190276772754 0.94596406168340740894 -0.048561746619035131567 -1.1241515911066994882 -0.43805688557725497301 0.026749969776226005524 0.07953390111773588067 -0.21976011381844340331 -1.0737555245781693625 -2.5611530180819772617 -0.1902452763576074346 -1.7556654312797634887 0.14832939435746633761 0.61367954671384083998;-0.037033384401635872918 -0.094772357314543434481 -0.11417242011191812423 0.034139110603896093143 -0.11812845060209936632 -0.07199632153703301729 0.042152786829332225538 0.052140982985081969769 -0.12330192984758449326 0.08390741536430371128 -0.0083001545575983881609 0.068490656669868907325 0.051535501312463587176 -0.1049615931672707031 -0.53127816897680046893 -0.18395878909984120231 0.48575526358640164215 0.42598555259616921465 0.33402813784043289269 0.22158963959036417912 -0.17029083922293714037 -0.087097787318481389995;-0.14837067182734253734 -0.3832372167940555352 0.082897953936622054139 -0.029521952546385638733 -0.11352859505262759277 -0.51098828989192568439 -0.14748241140872503374 -0.028841012780927911818 -0.006990329134695934081 -0.11726593715796024275 -0.32047609140545502138 -0.055034063760179163793 -0.0079233784996811575801 0.026736775572457231742 0.074701145143342778665 0.44659394979646593882 -0.29860329203990132463 -0.54251477956535631986 0.22628107352709259104 -0.62729718905411813168 -0.87142715058421760244 0.10479222757805503607;0.084112171814253205993 0.11531468706518413492 -0.34926776741731591081 0.21120515036209205895 -0.19858056480984559444 -0.076781051210435977139 0.15651496971068501463 -0.07793233091553478098 -0.13531587164064187712 0.49582839832555364312 0.086783908148002242289 -0.0024906712533263896704 0.055336769778935181174 -0.058050206266195392146 -0.5906839676989941168 0.27332999421604486923 -0.15831425440246379988 0.38797981664227992882 0.55639646179877688681 0.2485680125110434624 -0.21607049837816560967 -0.069820490065339163577;0.054970680591785822666 0.072935711323710739062 -0.30313043109215270787 -0.61488551993403650631 -0.49254567926038833603 -0.35886936123849261238 0.47027513538075432775 -0.78303592959631929116 -0.90841651696254410719 0.65923173639866095019 -0.3190835862151955582 0.093684510901817799611 -0.24946534721638785603 -0.92630229047096890316 0.30396089327301811789 -0.75692222899139827152 -0.90963481876957419381 1.014131706061430549 -1.460599534052607229 0.41296703756645664063 0.51848480820984876871 -0.11802091328078961885;0.28468318101428130573 0.42349603904016008826 0.080271992253707832865 -0.24288885561540146663 0.14548862260735614949 0.57985542918646848509 -0.074705975976161007046 -0.33921071541375363845 0.027058434139111655486 0.26489414268736016789 -0.050759762341267097852 -0.37397213706439391689 -0.30436945265750042777 -0.19035471464098890904 -0.63967883745475728752 0.69540069706254070692 1.0659053106225095942 -1.3022361000762343597 1.0124612096636218528 -0.39410358498020975349 0.70590824962823062183 -0.014997680031071634194;0.052473824580004491125 -0.29666258909000686739 -0.11105556916107464649 0.074617704223651409867 0.34964735222765563893 -0.11929284933915584865 0.21866086908661075405 -0.20490793244461974476 0.41491202854051656423 0.3093103916338646453 0.54221697609579155852 0.094890664719430806162 -0.018261986275439338889 -0.088988076816446090578 -0.34929932883514902553 -0.86914823474096092326 0.7979436744234297274 1.0618881945969806946 -0.15652549989482894555 1.1251152314921897268 -0.31461544757480547352 0.45636919808208187277;-0.80496444011463574864 0.24352688817125059395 0.73352721664271236524 0.17229695711886078291 0.37831438612543583089 0.097806975934325704469 -0.040065083459359170093 -0.1685375759849519206 0.53736823669233435563 -0.52308108231387395737 -0.4771925087679589339 -0.32798754814147101921 0.0052833286561375404633 -0.33207535576433416802 -0.76863688908443783543 -0.18099685612287766401 -0.069747912241601275896 0.017943492809382465686 -0.051955977153497881482 -0.067039230359222032329 0.026488704985257051361 0.027014585015971412374;-0.9619658049785684284 -0.71352853091715828793 1.1548715266114166766 -0.96144209859988438716 0.86119803510989179074 -0.050665240901626662495 0.42359150823873947811 0.24317965808407254746 -0.067666927717077593463 -0.21607240423324614031 0.17991000314559826845 1.7913574153845528425 0.28337119533348231748 0.67119284934549294785 -2.185939395909613836 2.8904142183553682699 0.45643263441320169882 -0.19443574684637576766 0.085481597565342792855 -0.02539112498829568243 -0.00066423800173598000415 -0.020251030613104844397];

% Layer 2
b2 = [0.29329259935456741815;-3.2941402540394384424;1.0028610196964229395];
LW2_1 = [0.022467144795013209435 0.33955448539088362025 0.0055298311763047666018 0.25241583181030774474 0.012039266725000948022 0.031998143257588901323 -0.023891377952061684797 0.048295938685665167067 0.52194417887278432566 -0.94201136530780227307 0.47239079353558804941 0.020425220181588127355 0.055626364730550055537 -0.11117987012138989822 0.045216167052237396518 0.16439659075548834766 0.044243195930033063501 -0.54032682245227792173 -0.029513536625554257636 0.11161002112688207799 0.039617731486254692541 -0.10885665762879256913 -1.2511251172600021953 -0.078427661036751375456 0.5425460091326448353 0.1771394259160986584 -0.026275908271656860798 -0.034855092605003364092 -1.4358885585860068357 -0.89541497210916276561;0.0097996785911395913049 -2.0438666971354604307 -0.013415003867359944281 -4.533873574201687795 -0.022144792694261703631 -2.5990849155326967157 -0.035724700057296825129 -0.19852962845236415967 -1.7353244166878170063 -0.76581279125959278442 7.2973095186465757322 0.53039340189341133147 -2.9640492278436032514 4.1159070908139758771 -0.040095415442757492697 -2.7634712652633375285 -0.49279695139375395696 -0.69195342700850359652 0.027621641203125862213 0.10753713159703290336 -0.18338386113304538938 3.9714290378927570302 -2.9109124030625799229 -0.049911600558836116681 -4.9712963561046148442 -1.6325467992763778025 0.048291512068045161499 -0.011940002695827039991 -0.70707862594731274442 0.21589179950511824813;1.4297141776588608852 2.8490027685149934555 -1.6073011589713503966 2.1336943768722931303 0.18732272961086235408 -0.44506146289788811599 -0.60032451527125796353 -4.0914621556043382355 0.57577751278063871165 0.085666868487067643345 0.069995395150377878735 0.053971417770019791682 -0.080722695906066135874 0.19113924026166462244 -3.6179626392720134476 0.11791549375751750328 3.902384627020222041 1.6096983870524375071 3.8074516854709572478 6.3365537097140114398 -3.9100775550006616754 0.21288751297108571281 -8.05662352707570939 -7.083913309676593606 0.36962692903219568352 1.1299212446434927504 -1.6898150071117277182 -0.95988711843992946537 0.86516356760876600429 -0.043385068220904030034];

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
