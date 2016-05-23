% [a,t]=prprob
% aa=a(:,1)
% reshape(aa,5,7)
% /*T pt caracterul a are 1.....0 */
%     Vector cu caractere de la 1 la 10: 1000 de linii si 10 coloane
% 12315
% 5 -> la linia 5 mergem pe coloana 5 si am pus 1,
% 1 -> la linia 4 punem 1 pe coloana 1
% 3 -> la linia 3 coloana 3 punem 1
% etc,*/
testSamples;
% net=newff([-1 2; 0 5],[3 1],{'tansig','purelin'},'traingd');
% 
% net.train(net,trainSamples,trainLabels);
% view(net);
% net(trainSamples);
labels = zeros(1000,10);
cine = unique(trainLabels);
for ind = 1:numel(cine),
    unde = find(trainLabels == cine(ind));
    labels(unde,cine(ind)) = 1;
end;

net=newff(minmax(trainSamples),[784,20,10],{'tansig','purelin','logsig'},'traingdx');
net=train(net,trainSamples(:,1:900),labels(1:900,:)');

out = sim(net,trainSamples(:,901:end));

disp(1);

% net=configure(net,trainSamples,trainLabels);
%  net.layers{2}.transferFcn = 'logsig'; 
%  net.trainParam.epochs = 6000; 
% net.trainParam.goal = 0.01;
% net.train(net,trainSamples,trainLabels);
% train(net,trainSamples,trainLabels)
% plotperform(tr);
Paula Alexa
5/19, 9:35am
Paula Alexa

Uite ce am acum:

% [a,t]=prprob
% aa=a(:,1)
% reshape(aa,5,7)
% /*T pt caracterul a are 1.....0 */
%     Vector cu caractere de la 1 la 10: 1000 de linii si 10 coloane
% 12315
% 5 -> la linia 5 mergem pe coloana 5 si am pus 1,
% 1 -> la linia 4 punem 1 pe coloana 1
% 3 -> la linia 3 coloana 3 punem 1
% etc,*/
testSamples;
% net=newff([-1 2; 0 5],[3 1],{'tansig','purelin'},'traingd');
% 
% net.train(net,trainSamples,trainLabels);
% view(net);
% net(trainSamples);
labels = zeros(1000,10);
cine = unique(trainLabels);
for ind = 1:numel(cine),
    unde = find(trainLabels == cine(ind));
    labels(unde,cine(ind)) = 1;
end;

% net=newff(minmax(trainSamples),[784,20,10],{'tansig','purelin','logsig'},'traingdx');
net=newff(minmax(trainSamples),[784,20,10],{'tansig','purelin','logsig'},'traingdx');
net=train(net,trainSamples(:,1:900),labels(1:900,:)');

out = sim(net,trainSamples(:,901:end));

disp(1);

% net=configure(net,trainSamples,trainLabels);
% net.layers{2}.transferFcn = 'logsig'; 
% net.trainParam.epochs = 6000; 
% net.trainParam.goal = 0.01;
% net.train(net,trainSamples,trainLabels);
% train(net,trainSamples,trainLabels)
% plotperform(tr);

[a,b] = max(out);
outt = trainLabels(901:1000);
numel(find(outt~=b')); %cate a gresit

[net,tr]=train(net,trainSamples(:,101:1000),labels(101:1000,:)');
plotperform(tr);

out = sim(net,trainSamples(:,1:100));

[a,b] = max(out);
outt = trainLabels(1:100);
numel(find(outt~=b')) %cate a gresit