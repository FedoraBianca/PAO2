T1 = readtable('testres.csv');
T2 = readtable('testres3.csv');
labels1 = T1{2:5000,2};
labels2 = T2{2:5000,2};
dif=sum(tind ~= yind);