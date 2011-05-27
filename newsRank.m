%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% newsRank Copyright 2011 Max Jaderberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function AS = newsRank()

% Define metrics which feed newsRank

% 1. Time since published (days)
% 2. Number of likes

% Define initial weights for these metrics
w = [-1 .5]; % more recent is better, don't care about likes

% Create a set of articles with these metrics
Articles = [0 0;    % just published, no likes
            1 10;   % one day old, 10 likes
            0.5 2;
            10 100;
            2 50;
            1.7 12;
            0.2 5;
            0.1 0;
            12 23;
            5 200;
            8 50];
        
% Need to normalize metrics
for i=1:1:length(w)
    m(i) = mean(Articles(:,i));
    sd(i) = std(Articles(:,i));
end

NormalizedArticles = normalizeSet(Articles, m, sd);
        
for i=1:1:length(Articles)
    RankedArticles(i,:) = [Articles(i,:) getNewsRank(NormalizedArticles(i,:), w)];
end

% Article Set
AS.RankedArticles = RankedArticles;
AS.m = m;
AS.sd = sd;
AS.length = length(Articles(:,1));
AS.weights = w;

% Sort based on rank (column 3)
sortrows(RankedArticles, -3)

