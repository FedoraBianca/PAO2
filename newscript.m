% Load data
load('trainData.mat')
load('testData-public.mat')
[x,t] = prepareData(trainSamples,trainLabels); 
% x intreaga multime de train % t intreaga multime de labels pt. train

net = newff(x,t,30,{'tansig','softmax'},'trainoss');
net.performFcn = 'msereg';


% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x); %pe linii am valori le la -1 la 1 
% calculez eroarea ca diferenta dintre t si y chiar daca t are doar o
% valoare de 1 pe coloane si in rest 0
tind = vec2ind(t);
yind = vec2ind(y);
%percentErrors = sum(tind ~= yind)/numel(tind);

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