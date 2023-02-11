function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 09-Feb-2023 19:56:23.
% 
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 3xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [100;1;10];
x1_step1.gain = [0.025;1;0.04];
x1_step1.ymin = -1;

% Layer 1
b1 = [4.64077807943261611;4.4967522420719188148;-4.2684490033493540651;-4.301435570628695082;3.4171975090382171736;3.3656942893087782309;2.9947685898005467209;2.938681359697459694;-2.5339445785356566887;-2.7195070411170352287;-2.6919774172244608224;-2.1626684360001933172;1.8543009898181870287;1.8497947114804085267;1.2525596985067302125;-1.0761705113229871333;-0.35119920153030270704;0.6491875887071230089;0.17910978811991848381;-0.049529861653754087003;0.13483360284657783246;-0.42287820056589575657;0.57175405955557023763;0.670728292128556558;-1.1201244005848858265;1.3596218432105202645;1.9391755573496893827;1.9198046501622174631;-1.9956438708167509866;2.5228619605332358589;2.4775666420904336462;-2.8874682389395061044;-3.0105472748677684081;-3.3148863972527435884;-3.677036450588603067;-3.7680936528282789055;4.0967950919200042392;-4.1820990320357713799;-4.4379761327271740612;4.8736359089935277211];
IW1_1 = [-1.8107159000229529067 -0.90457428576795761987 4.5571786495855670651;-1.7993823453891877318 4.1055180528550216934 -1.764320911090248245;1.8813798690616478915 1.6586261754838493854 -4.1478616560738714725;2.5499229572630350837 -3.7385277368815024168 0.86269505453224148983;-0.44116302562084674932 1.0023106010307725189 4.92289028828225117;-1.771062414051180145 3.379003479955868805 -3.1604941455786121907;-3.2734582248936945348 1.3201741270581832666 -3.3887209743568713627;-1.4904905810860917814 -3.0929491635457440069 -3.4659339338637571437;2.4326563794906266303 4.2907312106892492309 -0.99028263154287654579;3.4369936976265029749 -1.5298704137334464548 2.9931059477706676297;2.9469303592997215802 -3.387732520995486496 2.7963265904668346273;3.8715240889881421538 1.4032557637490108426 2.070063473129061915;-1.2695194621845518057 -3.045716848280668021 -3.3778648301612821392;-3.4516904047651992826 1.3959941167258218542 2.9543159888526235868;-3.3009049884740040426 -3.4337967393139616767 0.81227716748467815311;2.8542374800287286796 3.7524635278737248356 0.46683989370636325145;2.1562553051610420241 -2.279670437712607356 -3.6537236727646291712;-4.8101956759443833533 -0.99592343063066568476 1.1103595872742249018;-0.30915209291187667473 4.089239141504950048 2.4013899975247996466;-0.81745685759449915331 3.3872556945014946628 3.2679345883759793878;0.033263717483596591529 -4.3073137690412730549 -2.0741784964216565257;-2.0419176743901013005 3.8139704527194853156 -2.0744813263181414165;3.0452584562309321647 -2.5701031114582968407 -2.8531566012874813865;0.53351902715134458255 0.55524121013772198552 4.6729339791164923312;-0.27413928770407880453 -3.5922692813909065102 -3.1659242849457940316;3.59709648523363823 -0.86884067785893892566 3.0156722247059590813;3.2044662033227160336 -2.0167990340965418206 2.6565788257355205104;2.5832404363541860981 1.8691249878385691741 -3.6000825279199673012;-1.0967261584334295765 4.5458687330489455647 1.2243325669523228427;2.369653390642944224 -1.7898775989369015704 3.6307778666219965302;1.1675115295304849816 -4.2696757802490470368 1.7165744948340142528;-3.4853564682722839585 1.0625112510011709421 -3.0640982294339678127;-0.49968527383160749045 4.4902198383532123671 -1.8317040938787398918;-3.232320108759467292 0.32646681730826287993 -3.5174757795772397806;-0.64199859161199768209 -3.3937551918678185991 3.2155350854494768598;-2.3216495922276703112 -2.9200292001312297963 3.1579481611212147918;1.7587427407677274083 2.8126590907403983266 3.3985638549766781225;-2.5296847743628378957 -3.8052166931200828159 -1.7215117298174105187;-2.5943777081378192051 -3.0475630937608517712 -2.8384589011417924453;4.1187621610629161495 -1.7466832853958960126 1.3688796493113040142];

% Layer 2
b2 = 0.20953533846933175555;
LW2_1 = [0.54408650223203813834 0.37644244119153968953 -0.35144867025752329903 0.89480900743284297327 -0.58659287602929000016 -0.90089897958099951492 0.43972304776644494106 0.13068488829964550191 0.89417483008152165436 -0.44382423821000277497 -1.1141588487603362179 1.1777725625271533438 0.37468803771947678527 -0.41581142173301938181 0.44055722290442039801 -0.091402504349122309923 -0.56773623878175427659 -0.79352961747653527613 0.43134069533599883606 0.45325716698958851136 -0.11077996117077526517 -0.83792952824197419748 0.39686831201580752282 0.34921201372132598673 0.32737748020090540191 -0.11003779030328718347 -0.20022919366480534942 -0.96399996395074305511 -0.28895345164973823548 -0.27741774497810622879 0.526153862264872485 0.53184446229739812395 0.10432005393256556236 0.099315149098450877796 -0.11187016333540396318 -0.79499853420340049759 -0.22744755008067069069 -0.74198832954003846041 -0.72099911019522666678 -0.9572882250636504109];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.02255299954894;
y1_step1.xoffset = 5.9;

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
