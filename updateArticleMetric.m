%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function updates the article set when a metric has changed for and
% article.

function updatedSet = updateArticleMetric(oldSet, articleUpdated, metricUpdated, newVal)
    updatedSet = oldSet;
    
    oldVal = oldSet.RankedArticles(articleUpdated, metricUpdated)
    delVal = newVal - oldVal;
    
    % update the associated article's metric
    updatedSet.RankedArticles(articleUpdated, metricUpdated) = newVal;
    
    % compute new mean and standard deviation for that metric
    updatedSet.m(metricUpdated) = oldSet.m(metricUpdated) + delVal/oldSet.length;
    updatedSet.sd(metricUpdated) = sqrt(oldSet.sd(metricUpdated)^2 + (2*delVal*(oldVal-oldSet.m(metricUpdated)))/(oldSet.length-1) + delVal^2/oldSet.length);
    