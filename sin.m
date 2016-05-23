x = -1:0.05:1;
t = sin(2*pi*x)+0.1*randn(size(x));
net1 = newff(minmax(x),[5,1]);
net1.trainFcn = 'trainbr'; %Bayesian regularization backpropagation - seteaza implicit functia erorii cu 'msereg'
net1.layers{2}.transferFcn = 'purelin';
net1.trainParam.epochs = 1000;
net1.trainParam.goal = 0.00001;
[net1,antrenare] = train(net1,x,t);
z = sim(net1,x);
plotperform(antrenare);
figure, hold on;
plot(x,t,'r');
plot(x,z,'b');
