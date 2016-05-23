% Load data
load('trainData.mat')
[x,t] = prepareData(trainSamples,trainLabels);

% Choose a Training Function
trainFcn = 'trainscg';  

% Create a Pattern Recognition Network
hiddenLayerSize = [20,10];
net = patternnet(hiddenLayerSize);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
tind = vec2ind(t);
yind = vec2ind(y);
%percentErrors = sum(tind ~= yind)/numel(tind);
%cp = cvpartition(1000,'KFold',10)

view(net)


trainSetX = t(:, tr.trainInd)
trainSetY = y(:, tr.trainInd)
testSetX = t(:, tr.testInd)
testSetY = y(:, tr.testInd)
valSetX = t(:, tr.valInd)
valSetY = y(:, tr.valInd)

figure
plotconfusion(t,y,'Global');
figure
plotconfusion(trainSetX,trainSetY,'Train');
figure
plotconfusion(testSetX,testSetY,'Test');
figure
plotconfusion(valSetX,valSetY,'Validation');

load('testData-public.mat')
y2 = net(testSamples);
y2ind = vec2ind(y2);
prepareResults(y2ind,'testres3.csv');



