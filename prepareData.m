function [ x,t ] = prepareData( trainSamples, trainLabels )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
    x = trainSamples;
    [n,~] = size(trainLabels);
    t = zeros(10,n);
    for i = 1:n
       t(trainLabels(i),i) = 1;
    end
 

end

