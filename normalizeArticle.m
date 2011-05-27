%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function normalises each metric in a row

function article = normalizeArticle(article, m, sd)
    for i=1:1:length(m)
        article(i) = normalize(article(i), m(i), sd(i));
    end