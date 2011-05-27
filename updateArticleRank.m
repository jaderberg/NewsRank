%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function updates the set with the updated rank of the article

function updatedSet = updateArticleRank(oldSet, articleUpdated)
    updatedSet = oldSet;
    
    updatedSet.RankedArticles(articleUpdated, end) = getNewsRank(normalizeArticle(updatedSet.RankedArticles(articleUpdated, 1:end-1), updatedSet.m, updatedSet.sd), updatedSet.weights);