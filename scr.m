%{
load('trainData.mat')
[x,t] = prepareData(trainSamples,trainLabels);
[m n] = size(x);
cp = cvpartition(n,'KFold',10)
S = 20;
TF = {'tansig','purelin'}
BTF = 'trainscg';
BLF = 'learngdm';
PF = 'crossentropy';
net = newff( x,t,S,TF,BTF,BLF,PF);
[net,tr] = train(net,x,t);
y = net(x);
e = gsubtract(t,y); 
%}

trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation
% Create a Pattern Recognition Network
hiddenLayerSize = 30;
net = patternnet(hiddenLayerSize);


%{
cvMCR = crossval('mcr',x,t,'predfun',classf,'partition',cp)
cfMat = crossval(train(net,x,t),X,y,'partition',cp);
cfMat = reshape(sum(cfMat),3,3)
%}


