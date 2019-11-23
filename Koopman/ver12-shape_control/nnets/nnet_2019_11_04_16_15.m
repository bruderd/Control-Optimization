function [Y,Xf,Af] = nnet_2019_11_04_16_15(X,~,~)
%NNET_2019_11_04_16_15 neural network simulation function.
%
% Auto-generated by MATLAB, 04-Nov-2019 16:15:19.
% 
% [Y] = nnet_2019_11_04_16_15(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 12xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 2xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.422052480045585;-0.0810694971612877;-0.0325909944835713;-0.14794884079157;-0.154229249585579;-0.316564347638257;-0.270252360192543;-0.481499488784524;-0.0840371517314645;-3.04139158302519e-10;-1;-1];
x1_step1.gain = [2.57397534945819;6.80914870716471;2.63610052450986;4.53089322266911;6.02251701119546;2.7246687752405;6.61823413983504;2.69832726875525;6.3280989481063;6424315896.98854;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.8300437215340583652;-2.0463328829397480213;-0.9953087227721103547;1.1208284980340570414;1.5679404440501303331;-1.3804754242493424421;-1.8269316433040962977;-1.0732778362805803773;-1.5567784557007695589;-1.2314749780057734352;-1.4642822173486462756;1.2265614484120743732;-0.36141439964741511881;0.35438399917255608562;-1.305600416616051751;0.48162015567818600159;0.42735145607645907972;1.1101332670459571617;-1.1801009246765734595;0.80801242907759274203;1.5707018979684153059;1.6901969067864295315;-0.047571124966150075963;1.8274563367545584303;0.6895501907835791533;2.3323026304220482174;-3.2700252385498274066;-1.7282775163864445567;3.1796318970509167556;2.3401415230250699473];
IW1_1 = [0.84048641460403361592 0.17088490010047649448 -1.4134780544868756902 -0.56657733194491088913 0.50897800960014139005 0.040497923349895818823 -0.21098928258693666615 -0.822057075368767598 -0.45365024131686282338 -0.079948508266843534842 0.81314397243554059624 0.83484802976941452357;0.90519616719132944826 0.70018855857304451717 1.9469078783513569242 -2.1947043531229817326 0.12433207360428433219 -0.33094382103093161751 0.24354463545202678643 1.3106429517668118923 0.96453854449096787516 0.82897480471050899453 0.30711929127841608445 0.71970198117801975624;0.30984463754837088256 -0.84326272571799421041 0.11259557039836201597 -0.012000527991832408287 -0.57301993210252655242 -1.0021076351743170019 -2.1166635161019424771 -0.98259903096248413235 -0.931205641747643309 1.2766320865098417237 -1.8912180511461404997 -1.5194716841298681054;-2.236904995965077525 0.10152615537247518251 1.775458242297970779 -2.6199131458182645105 0.0042131374476406524554 -1.6177646201317514851 0.059288323761959083047 1.720217203634504477 0.42167259414303065457 -1.3460144684084918154 0.047293364517341368591 -1.7784212668321395245;0.13915496111899056109 -1.584590226071476371 -1.7816272776865913485 -1.7229678178913463427 0.58128690086291578965 1.2886571538413447158 0.30347431944043579133 1.3808813012343887916 1.6319430573864575074 0.10178482067501717911 -1.4636455083410933042 0.97253767131386859024;0.62298002587242562456 0.57068593165188941096 -0.18154141000468621003 -1.0646009003685086292 -0.20746588576438082518 0.37444679692725141296 1.0978365635347195894 -0.90640024056220047655 -1.8597379631381858456 -1.8222748726610709102 -2.0733135146499614976 0.83319227360852499142;-0.12597155700330711636 0.11239188168734365325 1.2615752909398241233 -1.637876897265882592 0.44178637436126394489 -1.9164555398474321102 1.9615406025283870228 0.29551612388711162582 -1.5010536154453233415 0.21744116038616928543 -0.54915826255695288083 -0.57259652345062050927;0.75576822092858919611 0.54497175130155450784 0.091611316949526760967 -1.2963073014621584456 -1.5542969585492931728 -2.1140322249075667038 0.523739654817422573 1.4995557775380676802 -2.5372310194742970779 -0.15326826201034873809 1.7146282001167147957 1.2844164314700630136;0.20671102257372298006 0.67518070360088000559 -0.7701022264862263933 1.8780571135758439283 2.3915016320578112996 1.4932372362060162274 0.64392663250364601257 1.1278750640653634196 0.093257133517658852284 2.2325895073184223172 -0.2819941062990255487 -2.1897906438856900024;-0.56093830966124580417 -0.34344542872310501735 2.1859508992895508861 1.3179982675720425256 -1.2712779366441055995 -1.3347847304749262953 -1.6953616668688296087 0.81094674135418542971 -1.1074550152973403616 -1.4016986453805990731 -0.91179776951106061844 1.0445484054863265477;0.9138218134816511462 0.72858456178371455714 -1.0504898032995189094 -0.58136327154346112422 -0.10640674156101971592 -0.015645360217772748268 0.13678384920745151332 0.10464834964723344901 0.042493196017553233612 0.24934117075469813818 -0.10041185274302989738 1.2427942231070319146;-1.232884361406251017 0.36146532772450784554 0.77548316048921761556 -2.1903674479047428036 -1.1589540863425329409 -2.9328554792577099519 0.13888636138956239607 1.0978040658831693666 0.59073392096464016898 -2.2125271738762481988 -1.8179731162415178058 -0.73420532769375279614;0.049725439511910461687 0.93459849000654504625 0.36816865117745722902 -2.0086059907445985573 -0.33364532165733157276 0.018292644728097856577 -0.04071576702868136971 1.0010395310529063284 1.9020284701652392378 0.73564602138056656155 -0.1519805580153585356 1.9875490979298118255;0.62254758093442374989 1.1394957062879325083 0.59932224226302721615 -0.7975800670493234934 0.60352761728177606315 -0.22360957106928008864 -0.19541452597081238052 0.23155284915088475417 2.0036919289664396615 -1.1204183040762996093 -0.79776178470776792917 0.66183859530130451088;-0.93759797874224259928 -1.0482484276477754825 -0.45846713333535565882 0.50097669791832855068 1.6621506399260252973 -0.34777150787101407392 0.33774661855479398698 1.7390253404546276439 0.67197203319709741809 -0.13997990869125034874 3.4347668608400878654 -1.0504795462146940821;0.3169556269721153785 -1.6282069785610355783 -1.3291807744995911555 -2.1036764574469724032 -0.69929157019544918583 -1.4544893310457933655 -1.1746853352132127224 -0.84933356583197350265 1.3219075697558897442 -3.1461056238850750866 -0.42847030360980709052 0.11988517016132846371;0.17788253664650935382 -0.68018228075943210076 -0.35174918736533716812 -0.39286707705634482668 0.45796933308412640651 -0.9727866253388579576 -0.51156404188802251376 0.61530515832888788008 1.0347872401877815651 0.9264411285466750412 -0.2045801647618356589 1.1347039613673466363;0.44287065293398020227 -0.69326066439245115358 -2.1611602031020469283 -2.2043525651101134599 1.1482553476905157375 1.8277332716308927196 2.6797199226074406297 -0.89979420659311482034 -1.3259646902996589102 0.93230581403556256337 0.1557064528477481169 0.50073030119775507885;-0.8817851804013880912 -0.44913711473837658605 0.6997351668157285598 0.35242871715656731713 -0.010925940375990057102 -0.90542447428747541149 -1.4931963139080930425 1.1243122340904563305 -0.50219828565381274821 -2.6949246993212057077 -0.38255413725616960186 -2.2546656395273219076;1.015460568137122932 -0.80641306552770630756 -1.8208093983246400605 -0.069810302965154696908 1.2828648540263141165 -0.4654563183066643961 0.065102859756708042482 -0.012559595658531784446 0.26402992779850675831 0.78182669822403416671 0.076607946737358156852 0.43511452254706045606;2.0050605745301028904 1.0786006306508195696 1.0073167225321362217 -1.5843443821801521665 -1.3733705390833816917 0.15706709044659125651 -0.8275979475853477707 -0.36599877250150020247 0.42078710764938570543 -2.6347983903147254026 -0.73437747098825945091 -0.99701631974697435545;-0.83335021344579662816 -1.113742097972249212 -1.461892255276928676 2.8629211912026062414 -0.030987201201506539561 4.0354311531545015157 -1.3676860519169840025 -0.52621614694682505853 -0.50327510260103336392 -0.63948314840874131981 0.13440732428068488669 -2.8412386501349167212;-0.40763202638988210724 -2.1681830220866564751 -1.815773170517205104 2.3701026616524956125 -0.49232382729548923583 3.6973618994949046801 -3.1172667306674677334 -1.0611766858541091807 -0.61589149339714510667 -0.68717596132808800302 -0.48150646104947325554 1.3309396773033450589;0.47380768079161938999 -2.8638441165154904233 -1.4325884437694220708 2.5729251067145550991 -1.7822406665911083579 0.50955768499986775488 1.5565800588463409859 -1.0038623695030808314 -2.6180799738757158934 -2.7296432149548133239 0.12994688216852046114 1.8926031357275014955;0.43421539421705190875 0.24544028123789751739 -0.71017153119973241981 -0.46323179062473146539 0.88222965401841624278 -0.11711267586545642816 0.86503463070550778991 -0.9721618589134546351 0.5178901977048875338 -0.84772346775764551019 0.79154927856323475943 -0.19212120479717609278;1.4471179348174914026 1.0153944333890503327 -1.0181785420697380129 2.3582055070705374433 1.8645968912278270135 0.0051308413323065543699 1.3207906258437844826 0.023189615113667835788 -0.53601506929851405747 -0.31398574283790392503 -0.0079105775575004713684 -0.64293220387997862542;-0.68194560202271436999 -3.0884478264108765622 0.21751513072219053058 0.087825147412605455988 -2.0432584115952501236 -1.849562775595440911 -1.0404653376616324056 0.83537080035128974398 -3.1483964419955112746 1.1492242042911497979 2.1767054781509163064 -0.27571136801071033373;0.26587980115947651427 -0.94785588551217903053 -0.81811906961053337817 -0.37624442236031085951 -0.61950698210522758824 0.28711766356742507433 -0.6689317994916739174 -0.47625469651082558142 -0.14876232339097356094 0.9440404322276431115 -0.63163071478764998279 0.78329504064672406116;1.866702070421309978 0.3013841087156777232 -0.69972620779445449113 0.70961084896717363524 0.39985250902217828184 0.26591556403434357669 -1.4717499008689511886 -2.5242190994697546458 0.84989982224307369929 -0.51054658991620893715 -0.058420856212630822846 -0.20301195179676079228;0.17176583788501387229 0.34149210415141934005 0.33212439432988399846 0.67608043512353233062 -0.57688648602360126372 -0.49228570940270172107 -0.75397948561546568325 -0.29569109913960928138 0.034571532889417638801 0.6352107177189713072 0.40293426263789738906 0.91366831081447685836];

% Layer 2
b2 = [-0.15044292745135859346;0.11904215655921009109];
LW2_1 = [-0.82464393313300510258 0.35633254258832619543 -0.040165327981035919835 0.1125432600079079859 -0.0085401580194998227141 -0.026772088386401111937 -0.0077422119860307602249 -0.041821683400776001049 0.0084732351474691748605 -0.021639477572195760235 1.3106461357608043539 0.0018899167135062230199 -0.1913344152046496105 0.042170917240456011477 0.013060356507902789666 -0.10301152384881535895 -0.041192822040355764335 0.019167132243106309308 0.050143393155322582566 0.018145443126139831902 0.025221053817186304957 0.085616095107359041494 0.078050794667463146981 0.017260487611120627766 0.55258515966885246584 0.023069597134524083559 0.0079072593564384341391 -0.26126718635706475125 0.37314797995625353932 -0.33349880507240697858;-0.17260339416561723547 -2.9898923524539431362 2.8415547383564709882 2.2654813997540603765 2.2566552563804855858 1.7030712307438644615 -4.3285154866102990567 3.2041012703471150047 0.9825377866559624751 -2.0485147101943073089 0.35988865627526311908 -3.1425549007133053436 -3.0088164056274080416 1.2956991233842221067 -1.9228585447457404722 3.437492674621527744 -0.85202010962706264952 -1.735191216430832517 2.3555307202198005889 -1.2514539773350592533 -0.84653125095468728656 -2.3284710446817764584 -2.6935846869589239461 -1.7068078170846157082 0.0074000316567099377885 3.166803539839725179 0.42105074834164080144 -0.71904523148773835661 -2.3804864305442507977 -0.68924627641985825033];

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