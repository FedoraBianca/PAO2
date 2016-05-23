load('trainData.mat');
load('testData-public.mat');
for i=1:1000
    trainLabels2(trainLabels(i),i)=1;
end
net=newff(minmax(trainSamples),[10,10],{'tansig','tansig'},'traingdm');
nr(1)=1000;
i=1;
j=0;
while j==0
    i=i+1;
    nr(i)=0;
    ind=crossvalind('Kfold',200,1000);
    net=train(net,trainSamples(:,ind),trainLabels2(:,ind));
    values=sim(net,trainSamples);
    for t=1:1000
        for j=1:10
            if values(j,t)==max(values(:,t))
                val(t)=j;
            end
        end
    end
    for k=1:1000
        if val(k)~=trainLabels(k)
            nr(i)=nr(i)+1;
        end
    end
    j=0;
    if nr(i)&gt;=nr(i-1)
        j=1;
    end
end
values=sim(net,testSamples);
for t=1:5000
    for j=1:10
        if values(j,t)==max(values(:,t))
            val(t)=j;
        end
    end
end
file=fopen('rezultate.txt','w');
for i=1:5000
    fprintf(file,'%d\r\n',val(i));
end