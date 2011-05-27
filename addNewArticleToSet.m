%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function adds a new article and updates the statistics

function updatedSet = addNewArticleToSet(oldSet, newArticle)
    
    % Add the article
    newArticleRank = getNewsRank(newArticle, oldSet.weights);
    NewArticles = [oldSet.RankedArticles; newArticle newArticleRank];
    
    % Get new mean and standard deviation
    for i=1:1:length(oldSet.weights)
        m(i) = (oldSet.length*oldSet.m(i) + newArticle(i))/(oldSet.length + 1);
        sd(i) = sqrt((1/oldSet.length)*(newArticle(i)^2 + (oldSet.length - 1)*oldSet.sd(i)^2 ...
                    + oldSet.length*oldSet.m(i)^2 - (oldSet.length + 1)*m(i)^2));
    end
    
    updatedSet.RankedArticles = NewArticles;
    updatedSet.m = m;
    updatedSet.sd = sd;
    updatedSet.length = length(NewArticles(:,1));
    updatedSet.weights = oldSet.weights;
