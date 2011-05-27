%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function updates the weights when an article is clicked

function updatedSet = articleClicked(oldSet, articleClicked)
    updatedSet = oldSet;
    
    learningRate = 0.1;

    % Update the weights
    for i=1:1:length(oldSet.weights)
        delw(i) = learningRate*(normalize(oldSet.RankedArticles(articleClicked, i), oldSet.m(i), oldSet.sd(i)));
    end
    
    updatedSet.weights = updatedSet.weights + delw;
    
    % Update the ranks
    updatedSet = updateSetRanks(updatedSet);