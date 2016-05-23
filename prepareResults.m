function prepareResults( yind,docname )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
    [~,n] = size(yind);
    Id = (1:n).';
    Prediction = yind.';
    T = table(Id,Prediction);
    writetable(T,docname);
    
end

