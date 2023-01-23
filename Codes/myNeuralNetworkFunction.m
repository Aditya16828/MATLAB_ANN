function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 23-Jan-2023 23:02:17.
% 
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 13xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [22;118.5;29.5;31.1;79.3;69.4;85;47.2;33;19.1;24.8;21;15.8];
x1_step1.gain = [0.0338983050847458;0.00817494379726139;0.0414507772020725;0.099502487562189;0.0351493848857645;0.0254129606099111;0.0318979266347687;0.0498753117206983;0.124223602484472;0.135135135135135;0.099009900990099;0.143884892086331;0.357142857142857];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.9709029025926372292;-1.4528576432248840877;-1.1912596715213052967;1.5962940227995208176;-1.2069496912437269742;-1.9955326748803385861;0.087693735698157915248;1.4694766648820885013;-1.0837970110301837767;1.4181511356779441524;1.0769638620929518069;-1.2534645196496922992;-0.46362079038454778734;1.7443349044098406253;-0.071439860417612410792;-2.3270705815827388285;0.23245298670513314665;-0.40311621079314130522;0.80964016210943501317;1.2274585513639824086;-0.34511557893794475582;2.9195916658374598818;-0.09705085400669319351;0.46158211556987516211;0.41269168686373602917;0.76826196583506700666;0.13428158425570962953;-0.27604027370329942137;1.8672707917999877836;0.09625886332777688903;1.1347970836968455099;1.2864136382770336997;-0.82894320731368753563;1.6540800105513480123;-1.2284461603852494527;-2.5061240797455903717;0.75792005327598033215;1.4618001061341665547;-2.0656719851223366291;-1.8338965260179578287;0.78800406784326204601;2.2817910585732801287;1.3898045992960095241];
IW1_1 = [-0.22100479261781336149 0.21865633958492675104 0.5511043237144703788 0.19573230890685466843 0.78717929972157052454 0.29701628082967107547 -0.9878628244546701076 -1.5656743161958395216 -0.73481146282770204436 -0.35964303373816230991 -0.64852538818236260543 -0.31807840456705305243 -0.61126225847868054242;0.55872270740396090538 0.4095701840850466402 0.10180608773789018295 0.61530933448523128515 0.30662993443231179036 0.8107549197825858478 0.62382723590639577171 -0.019508521139788334575 0.51330432313556362267 0.15076018066026747322 -1.2481264050579645719 0.73429174180008993655 -1.0580488364965765502;-0.047415025539480987193 0.3109232605506809799 0.53697656760802880971 -0.30921853063976678655 2.386127658350934766 -1.1102148501225281851 1.9859254965358958955 0.069651808075890331295 -0.62556773539985288668 0.57248868485130588457 -0.16011677877265176329 1.042816842454097559 -2.3834166800009315423;-0.4041253426018969197 0.35294194401955908402 -0.19188994568241152239 -0.40244423525717321066 0.79088421268832931332 -0.99447045769809538918 -0.44732463811438183399 -0.35837510931835725447 0.99970310531771255924 -1.4100954219960128988 1.4923808099874169564 0.61090284084746027116 -1.2633043405150925498;1.9815980642468127293 -0.99112248217934839634 1.1957601115880263087 -0.40616697325520911832 0.36002633901923458692 -0.38108363199906358787 1.1532824638576066878 0.46736809222298003608 1.1908052175808545581 -0.47348625851550801835 0.48190838878549957514 1.0960009257088743073 -0.72158492971554255568;0.3411431040678186144 0.6177299351284994966 -0.75975175567091735029 0.72819743677919346325 0.13031544699657710007 -0.86451200798537586323 -0.16291523776084254616 -0.15756943746380019933 0.48769014969577145768 0.52825743795807356129 0.79508673033999699431 -0.0014062280807890861767 0.31407498347750789636;1.2090051769105016888 0.96161570295414910969 -0.14742890131827746103 1.71157319815023512 1.6235195345124573407 1.8634067841532897525 -0.53487658742174404303 0.70420775857520079288 0.3447916115416601035 -0.26165305559516249811 -0.17609161234860329359 1.2433501716897881195 -2.3369770158525393633;1.9238602633871304537 -0.3986903762992488609 -0.15641832146265061132 0.99902265777304366523 1.5980972888739193305 -0.5548630952562780827 1.64354804387407194 -1.4687704326789421394 -0.12259988413162470344 -0.8436058778837713934 1.0284376546955742437 3.0894087743754754527 0.40248672838391319484;0.48212253510318220373 0.29498340660899208254 1.1766023639173417425 0.56695143954047499957 0.45782433726328047863 0.5645007198184524011 0.97651134453937937785 0.43384323960989690239 -0.097065337355045341883 0.76124834161163712487 -1.1724543269251539446 0.7359854008197095343 -0.87434227852373858081;-0.61863705032874616307 4.1329761187614275642 -1.5621701857949439329 -0.31195149036003844145 -0.1948337833970698596 0.57986797514065546721 -1.8270446169926353175 -2.3441716625603157276 -0.46031973180346663632 -2.1859077352257179072 0.56066544956398900457 -0.1016224341674624998 0.15837762799956139892;1.8100004674849090591 -1.9147737846803021267 -0.20670891134536661937 2.0821744078608999118 1.6169845889505576331 -0.85466761341837760302 1.4356643432070228528 -0.93351757777311994424 -1.0693074987442947599 1.0207791815837130578 -1.7903773264563134227 -0.013642618195477271975 -0.38854662235774994894;0.14770133484007361147 0.35367233562014388504 -0.80649591751342797341 -0.71294458783103409338 -0.87251010342753720916 -0.60357419470352202673 0.64652352464438567203 0.46606502505945074377 -0.89955843991193706888 0.39539122526106712519 -0.065755519430744494014 0.42552330675518090786 -0.50189728472511419;-0.092537640697432269055 -0.92363905884416408476 -0.27188581938730255194 -2.058873818406196321 -0.083818562522471301568 -2.0122198427946118571 -1.027128267310140286 -0.12565089803528767254 -0.25224303283746651871 0.021627092906919581639 -0.50714386855390169995 0.81662405948801775057 2.0127334398299980833;1.1367524841892691079 -1.0893999169947556904 0.75126459732879147246 -0.37102818623997757541 -1.5126262004456623167 -0.76369271467096311312 -0.81180749322251588573 0.89138360047233144989 0.26741455217437892777 -0.37495918862457655596 -0.25491638264091731614 -0.55279691632041327853 -1.0570546969112823987;0.77678887251281103499 -0.72916076508891747299 1.0619608284672281684 -1.1584133862779197877 0.21002813014764556976 -1.4492288584156345355 -0.19592369542827808848 -0.63292474666476228329 0.63363129503127690878 0.488920488647161533 0.6127719005937564134 0.23017182222821805371 -0.58032489649755936156;0.83480580757887379306 -0.043114761378860000374 0.626377305975871157 -3.8081000026771976152 -2.4455326064837668021 1.4032476952117689528 -2.974129635922134085 3.9754945731228841233 0.79657367175377602475 0.83843390982324916827 -2.6707569604409768793 -1.1677906610790937947 1.3205871303504239656;0.19896545461363160379 0.37400321840924199979 0.34176162584516578402 0.46220869518345480964 0.1578129618900023512 0.98875910323939508739 -0.57482312770374488498 0.38599168934409355813 0.64676284642520720514 1.1457705942201672489 1.2239979588587532877 -0.90922320195859007708 0.093148210691430005648;0.63068281881184085069 0.92231072710949679738 -0.63113944917886688479 -0.16923834331899079153 2.071237363715579427 -1.428253423887871687 2.199914836975618293 -1.0731858802844214118 0.45169696788649044139 -1.8829103634919344135 -1.1746415314319584855 -0.70831786774527927264 0.19869242330282615994;-2.4459421607699609602 0.37927300743115616166 0.070551038310732644421 0.23159940725689415197 1.9065846410897242524 0.081628610209265733966 0.11528110963181009696 -0.9902838955321627834 -1.7584102531083998233 1.5453569950992041004 -1.4976314409045163867 0.36804100019872765248 1.0102681950639769148;-0.51901365995989745539 0.37157241967728782406 -2.3596671139710632126 -0.84232519077880985137 -1.7420418695773811635 2.802417713925899001 -0.71990362351687053888 -0.43594520110886081365 0.83023939720224448902 -0.11209496143110965483 -0.89864179211877492914 -0.35924730752326555772 -0.42747315168341748493;-0.82853807494026887603 0.30114660877271770545 1.7684609592040136938 -1.5752300653928716923 0.95548604682860360793 1.2979336303427728705 0.58841428073772406027 0.51173159789637301387 -0.11881314390461375496 -0.88367515792415352038 0.17209002452744637246 -1.0503928191219664701 1.8952036541611161358;0.16111470581673245639 0.57006959652315636333 -2.1676193112270039087 2.3731040017959408317 2.843682034493284938 0.25526349315600649348 0.8763472418100690664 -0.59180494298869512626 0.77661071127174796658 0.43030557649043266188 -2.0493783109404892784 0.25369261211214660934 -1.4854873063727864757;0.96615515425124554039 0.49219523488630256836 0.15590062769229784401 0.16345656218707454999 -0.29940050921529853811 -0.3813447559395819475 0.58542594089627741916 0.11721258180951829586 -0.39550454811778090747 -1.1292024286034330061 1.9316485120409596643 -0.98303598728267571616 -0.46825640613188806993;-0.86079721010843446294 2.8925068507144993113 -0.19834438375814736344 0.99069047897525952528 -0.1952312483368021101 0.65938937632303507019 -1.5320117761614235885 1.3844932497339068611 -0.27489483303700190664 -0.65028970800855745438 0.21885204991373108374 1.1282067914381443963 -0.76602810228098849876;-0.40145751315190075781 -1.261465087022752174 0.30706438144951447855 0.11295719476524485048 -0.99360901919428246121 -0.0089226579138278541703 0.63150439312092943034 1.4857666920995429294 0.18268069309412016121 -0.22208345456163319787 -0.50393001277532156745 1.2056403515119780145 -0.19612261229481706137;0.3513580419942645694 0.016659117864942278586 0.42129670719377998456 -0.79226238769835877207 0.18430504002963515875 0.6684139343020231161 0.25140535463974078567 1.4698902048978510493 -0.20169932139429616602 -0.23906059187710518299 -0.58467238420253409004 -0.15221057084709949114 -1.3237188680514326844;0.71879776077493251485 1.4708105554250894276 0.94416904473779139639 0.70797604070620534511 1.2050801063828469051 1.0236865570225130995 1.3747280659304550454 1.497973534813368035 -0.019390282767441327505 0.48052831294319148236 0.10088519483485815231 1.330815365002054218 1.0090878409928130122;-0.63139364845672163451 -0.61704180809071340619 -3.0326258421240024354 0.098744077134659200001 -0.2689140757115486835 0.74315567017600037136 -2.8244168901978308206 -0.63366909839256801984 1.2026729742189266048 -0.23123300329143417486 -1.2635949593073605435 0.30849769349741346103 -0.08542722375947398028;-0.38358682063854732114 -0.44796118102581522491 2.0201217240149973442 2.1075812239037552409 -0.83021158904771097387 0.8175176193460601537 -0.29306633580388391502 -0.91465918329047946056 -1.4375048076102325822 -1.0172627861670362481 2.1035734818884641584 -0.12560520570631414361 -2.9185781957147063359;0.4738614464174780716 2.0834938993894382975 0.16873613310247290165 0.56654021336056614722 -1.1997254276083195723 -1.4253130703153460423 0.60511979296738416245 2.7171357199106913605 1.6262621349155705897 1.2945182472868621559 -1.5678609377161571992 0.4530678898554243994 -0.60463823458019749779;0.23912716532076747078 0.46930931644931278557 -2.1732960556130440644 0.40870006065737268797 0.73386271279668935374 1.209641066314929958 0.53656137512172541459 0.15019016825794198611 1.3639087975228652017 1.5630659405949278717 0.63842531185921236325 1.4714612450898565399 0.75291488468895717556;-0.036586765605074858532 0.7286561042607996308 0.35037084469386658991 -1.3932880620100249747 0.68850951017892891848 0.32566809384603606636 0.31429359566877640431 1.8865407134448914928 1.4981616265653305842 0.34048352268537729337 -0.72861632250901831043 1.5709660478968250352 0.70267854041168309465;-1.6770154296264381255 0.47413771610414057189 0.2903468118731744041 -2.4560185540298182794 -0.8777310075274609158 -0.8202736856831580603 0.024481314238304477393 1.298426216927539123 -2.3816355856574364935 -0.43481322599709898435 0.84886450317396844323 1.0721728478642091886 -2.6617734706470073114;1.6586334459934530816 1.9543230517731755569 1.2707576952345331911 0.10902001024752043523 0.41841350999938742294 0.12713385421421954935 -0.2342814232473325875 1.8646620790634282905 2.7897958348803362227 -1.0868113656109630316 3.5867890075332526933 -0.52267792574098026481 -0.37241265903897002865;0.31772022533562349622 0.51995296079885722218 0.2601514217666771045 1.8119402797424364326 0.7685770155043653018 0.48048812995314260643 0.10261520834223586407 0.76869768553496853336 0.80978185175432981779 1.1430661592942370497 0.70246691349947210092 -0.48711574646204064409 0.67936070373976087389;-0.15557386990792337889 -0.5102671594164326363 1.299528290074897896 -2.5248366491043436888 0.51766817596845493554 1.5475818815417790031 0.6015059449816448911 -0.39082248283729154048 0.95843614507488883447 1.1547894564722422928 -4.5898081971965032366 0.90336377661130706773 0.10980692735609171029;-0.43991721084913321116 1.0750870640769578657 0.14335242584944601907 -0.61064222821822855547 -0.18352258439259933054 0.33928981452528084173 2.5021334796328491556 0.58556412814376335163 -1.4752494325951794885 -1.7420536655977445495 1.8036564523279747796 -0.71217340647809768139 -0.90761361452788102966;0.66506039585164167249 2.1974370420460020981 -0.60989810503661190388 -0.44324827652023857105 0.80343670106271924958 -2.8385963841208390335 1.6593552634373418542 -0.082380162540552900885 0.35809924532439363354 -2.3033702056532803226 0.27918631793250964224 -0.49548331073211582254 0.039747566798552437517;-1.4035987038193502574 0.37884439917146139898 0.42868892823290810634 -0.73212066200722980547 1.017535084748914187 0.18926197881048686944 -0.17793676395685822933 0.66274643264746735394 0.60998081458557373846 0.34801865729480063738 0.71725637759331417609 1.2554796581754172902 -0.2088849678690674061;1.5053222274607322984 -0.018667171321518218063 1.5894804072040185083 1.4679277219766371232 0.77180749035780782386 -0.046171746972369906437 -1.3300976844641902996 1.0375621845841562774 -0.21144944409676441621 -0.3589067412545510205 -0.68388197506733916509 -0.56052611269362950797 0.038958827547857011186;1.0391289681081139484 0.34340123941042000055 2.5494787742527833529 -0.16127040395588057575 1.2492194051696079438 1.4811277193919740736 -0.36997247551682449496 1.5385347142169720769 -0.21776135472379223867 -0.8816642297212969881 -1.1280530891037583441 0.13903555221225288863 -0.36865073595091724101;0.77799541105105041172 2.1369237780585725872 0.73640335654564692547 -0.63391981875601355334 -0.45934050807126430849 1.0112775499630441978 0.40569422576505020928 0.10568078451439455456 0.12842834656416657335 -0.55467863671282091609 -2.1567984744695039012 -0.19572444020141030463 0.53758853917619719986;-0.0056991813217381337431 0.32922361132660316052 0.24500113281523228093 -0.19052805023129110173 -0.76424104581950580428 0.56171829535473816186 0.33817147525194829472 -0.38499706836726865777 0.94659284393419773629 0.21110628648278340069 0.65932177353632348549 -1.4536488477617639514 -0.49353015555894319544];

% Layer 2
b2 = 0.77169095213502769681;
LW2_1 = [-0.96176169325562199663 -0.78246809691936736186 1.4456177713576505717 -0.79149335089703565238 0.26017280731424385909 0.30178702494663794953 -0.0036262708449993075188 0.17766906867056192487 -0.62689108819025396446 2.0923858429673933834 -0.22651767145345197418 0.73055180105168304738 1.1937215248844019744 0.60708358701046472028 -0.79040391806734366931 0.62514693724225367522 0.089477446899523388479 0.34575442458895799813 0.1495700890224647972 -0.41693207790905867371 -0.082171640381466806713 0.53766677508358373672 0.027907830573552172559 -0.62352502942158471999 0.48018833461705046073 -0.098474294398468095735 0.31994547880347801172 -0.14306315286284393418 1.3057013478353078906 2.1206070602225248756 -0.077968928030297632303 0.070833400758957804078 0.10440540383977957306 0.17658793390816274194 0.31487392138638509165 -0.3178980267338071819 0.32339701791365849104 -1.7697880005030681705 -1.0351242983981614465 -0.159504200886358527 0.8457572449569313866 -0.80789693588829969428 0.49079714275497549059];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.0421052631578947;
y1_step1.xoffset = 0;

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
