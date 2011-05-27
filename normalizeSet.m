%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function normalises each column of a matrix

function normalizedSet = normalizeSet(articles, mu, sd)
    for i=1:1:length(articles(1,:))
        normalizedSet(:,i) = normalize(articles(:,i), mu(i), sd(i));
    end