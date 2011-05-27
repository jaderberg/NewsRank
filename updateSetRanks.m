%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function updates the ranks of all articles in a set

function updatedSet = updateSetRanks(oldSet)
    updatedSet = oldSet;
    
    NormalizedArticles = normalizeSet(oldSet.RankedArticles(:,1:end-1), oldSet.m, oldSet.sd);
    
    for i=1:1:oldSet.length
        updatedSet.RankedArticles(i,3) = getNewsRank(NormalizedArticles(i,:), oldSet.weights);
    end