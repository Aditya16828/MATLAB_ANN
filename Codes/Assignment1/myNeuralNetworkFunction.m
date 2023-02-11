function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 11-Feb-2023 08:50:04.
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
b1 = [3.7020695359444801831;-2.8851691221472481885;0.20379004807480394224;-3.5094807835090922055;0.52181508277989729905;-2.3784541673979271437;0.85095164073283591222;-0.19113484270265121423;-0.017870795108667590634;-1.082165797023867837;1.8947448861612248283;-3.4164421849717445667;-4.0353345187645226488];
IW1_1 = [-2.7121625652967931153 1.5196341673596431843 0.52127911464574994138;4.407884315775759454 1.4768202475339589075 -0.60159578746695796525;-2.6026931622080349271 -0.078326433380210752633 -1.0272951746622192015;0.58976248928074892497 -0.1583342069432368826 2.6753170665404866213;-0.92696805699206230589 -2.2112798890000169294 2.3224554639812757806;2.6347452223015341843 1.4885986445796557387 -1.5287753617615980062;-1.0271204730304925867 5.372461177870079041 -3.0629690043303772207;1.4888678370460173284 -3.4111050973266818787 -1.2061890597372504352;-1.2285856095872851323 0.30017983599457376265 1.9287883426230751915;-0.62597215834443376004 2.356977716481564844 -4.3979217611312142466;3.2257095168314218192 3.6220792613281536099 -0.66285112935977807957;-1.7409282447718747999 2.0840836263186224286 -0.32068243574915511473;-1.3390294804471749579 -2.1130791492223051087 1.552163775975871296];

% Layer 2
b2 = -0.41705521810374635017;
LW2_1 = [0.20500033943434550765 0.064412901196612651344 -0.51791038110354548074 -0.50424741185636257068 -0.023725633039866519253 -0.040618707563696121454 -0.063932144300751878041 0.0054285179345324417743 0.3431086872429408019 -0.062202073443648468742 0.22272017183674122642 -0.69359473862271159295 0.88886678482628345144];

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
