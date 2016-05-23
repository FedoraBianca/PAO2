% Load data
load('trainData.mat')
load('testData-public.mat')
[x,t] = prepareData(trainSamples,trainLabels);

%{ 
%PR = minmax(x);
%k = 20
%f = {'tansig','purelin'}
%BTF = 'trainlm';
%BLF = 'traingdm';
%PF = 'mse';
%net = newff( PR, k, f, BTF, BLF, PF);

P  - RxQ1 matrix of Q1 representative R-element input vectors.
T  - SNxQ2 matrix of Q2 representative SN-element target vectors.
Si  - Sizes of N-1 hidden layers, S1 to S(N-1), default = [].
 (Output layer size SN is determined from T.) and returns an N layer feed-forward backprop network.
TFi - Transfer function of ith layer. Default is 'tansig' for hidden layers, and 'purelin' for output layer.
BTF - Backprop network training function, default = 'trainlm'.
BLF - Backprop weight/bias learning function, default = 'learngdm'.
PF  - Performance function, default = 'mse'.
IPF - Row cell array of input processing functions. Default is {'fixunknowns','remconstantrows','mapminmax'}.
OPF - Row cell array of output processing functions.Default is {'remconstantrows','mapminmax'}.
DDF - Data division function, default = 'dividerand';
     and returns an N layer feed-forward backprop network.
 
     The transfer functions TF{i} can be any differentiable transfer
     function such as TANSIG, LOGSIG, or PURELIN.
 
     The training function BTF can be any of the backprop training
     functions such as TRAINLM, TRAINBFG, TRAINRP, TRAINGD, etc.
 
     *WARNING*: TRAINLM is the default training function because it
     is very fast, but it requires a lot of memory to run.  If you get
     an "out-of-memory" error when training try doing one of these:
 
     (1) Slow TRAINLM training, but reduce memory requirements, by
         setting NET.efficiency.memoryReduction to 2 or more. (See HELP TRAINLM.)
     (2) Use TRAINBFG, which is slower but more memory efficient than TRAINLM.
     (3) Use TRAINRP which is slower but more memory efficient than TRAINBFG.
 
     The learning function BLF can be either of the backpropagation
     learning functions such as LEARNGD, or LEARNGDM.
 
     The performance function can be any of the differentiable performance
     functions such as MSE or MSEREG.
 
   Examples
 
     [inputs,targets] = simplefitdata;
     net = newff(inputs,targets,20);
     net = train(net,inputs,targets);
     outputs = net(inputs);
     errors = outputs - targets;
     perf = perform(net,outputs,targets)
 
   Algorithm
 
     Feed-forward networks consist of Nl layers using the DOTPROD
     weight function, NETSUM net input function, and the specified
     transfer functions.
 
     The first layer has weights coming from the input.  Each subsequent
     layer has a weight coming from the previous layer.  All layers
     have biases.  The last layer is the network output.
 
     Each layer's weights and biases are initialized with INITNW.
 
     Adaption is done with TRAINS which updates weights with the
     specified learning function. Training is done with the specified
     training function. Performance is measured according to the specified
     performance function. 

%P = x; %T = t;
S = 20;
TF = {'tansig','purelin'}
BTF = 'trainbr';
BLF = 'learngdm';
PF = 'msereg';
net.trainParam.show = 10;
net.trainParam.epochs = 500;
net = newff( x,t,S,TF,BTF,BLF,PF);
[net,tr] = train(net,x,t)


%}

net = newff(x,t,20);
net = train(net,x,t);
