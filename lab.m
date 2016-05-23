%{
trainData=rand(5,200);
trainLabels=hardlim(x(1,:)-2*x(3,:)+3*x(4,:));
testData=rand(5,200);
 ind=crossvalind('Kfold',200,10);
 procent=[];
 for i=1:10
    trainData2=trainData(:,find(ind~=i));
    indi=randperm(180);
    trainndata=trainData(:,indi(1:144));
    trainLabels2=trainLabels(:,find(ind~=i));
    trainnlabels=trainLabels(:,indi(1:144));
    testData2=trainData(:,find(ind==i));
    testLabels2=trainLabels(:,find(ind==i));
    validdata=trainData(:,indi(145:180));
    validlabels=trainLabels(:,indi(145:180));
     net = newff(minmax(trainData2),[10,1],{'tansig','logsig'},'traingdm');
    net=train(net,trainData2,trainLabels2);
    y=sim(net,testData2);
    y=hardlim(y);
    er=numel(find(y~=testLabels2));
    procent(i)=er/numel(y);
 end 

ainData=rand(5,200);
trainLabels=hardlim(x(1,:)-2*x(3,:)+3*x(4,:));
testData=rand(5,200);
 ind=crossvalind('Kfold',200,10);
 procent=[];
 for i=1:10
    trainData2=trainData(:,find(ind~=i));
    trainLabels2=trainLabels(:,find(ind~=i));
    testData2=trainData(:,find(ind==i));
    testLabels2=trainLabels(:,find(ind==i));
     net = newff(minmax(trainData2),[10,1],{'tansig','logsig'},'trainoss');
    net=train(net,trainData2,trainLabels2);
    y=sim(net,testData2);
    y=hardlim(y);
    er=numel(find(y~=testLabels2));
    procent(i)=er/numel(y);
 end
 %}
 
trainData=rand(5,200);
trainLabels=hardlim(trainData(1,:)-2*trainData(3,:)+3*trainData(4,:));
testData=rand(5,200);
 ind=crossvalind('Kfold',200,10);
 procent=[];
 for i=1:10
    trainData2=trainData(:,find(ind~=i));
    
    indi=randperm(180);
    trainndata=trainData(:,indi(1:144));
    
    trainLabels2=trainLabels(:,find(ind~=i));
    
    trainnlabels=trainLabels(:,indi(1:144));
    
    testData2=trainData(:,find(ind==i));
    testLabels2=trainLabels(:,find(ind==i));
    
    validdata=trainData(:,indi(145:180));
    validlabels=trainLabels(:,indi(145:180));
    
    net = newff(trainData2,trainLabels2,[10],{'tansig'},'traingdm');
    net=train(net,trainData2,trainLabels2);
    y=sim(net,testData2);
    y=hardlim(y);
    er=numel(find(y~=testLabels2));
    procent(i)=er/numel(y);
 end
