%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This funciton calculates the newsRank for an article

function rank = getNewsRank(Article, w)
    rank = Article*w';
    % now put through a sigmoid function
    rank = 1/(1+exp(-rank));