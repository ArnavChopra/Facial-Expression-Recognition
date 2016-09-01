% function using (Mahalanobis distance) to extract features from image and recognize expression
function [expression]=detectMaha(imgTest,happyFeaturesF,surpriseFeaturesF,neutralFeaturesF,disgustFeaturesF)

% Extracting features from image
testFeatures=extractFeatures(imgTest);

% Finding distance between testFeatures and features of all facial expressions

% finding distance measure between happyFeatures and testFeatures
diffFeatures=calcMaha(happyFeaturesF,testFeatures);
happySumDiffFeatures=sum(diffFeatures);

% finding distance measure between surpriseFeatures and testFeatures
diffFeatures=calcMaha(surpriseFeaturesF,testFeatures);
surpriseSumDiffFeatures=sum(diffFeatures);

% finding distance measure between neutralFeatures and testFeatures
diffFeatures=calcMaha(neutralFeaturesF,testFeatures);
neutralSumDiffFeatures=sum(diffFeatures);

% finding minimum sumDiffFeatures distance
%minSumDiffDist=min(happySumDiffFeatures,surpriseSumDiffFeatures,neutralSumDiffFeatures,disgustSumDiffFeatures);
minSumDiffDist=999999;

if(happySumDiffFeatures<=minSumDiffDist)
    minSumDiffDist=happySumDiffFeatures;
end
if(surpriseSumDiffFeatures<=minSumDiffDist)
    minSumDiffDist=surpriseSumDiffFeatures;
end
if(neutralSumDiffFeatures<=minSumDiffDist)
    minSumDiffDist=neutralSumDiffFeatures;
end

% finding the expression for minSumDiffDist distance for an image
if(happySumDiffFeatures==minSumDiffDist)
    expression='happy';
elseif(surpriseSumDiffFeatures==minSumDiffDist)
    expression='surprise';
elseif(neutralSumDiffFeatures==minSumDiffDist)
    expression='neutral';
end

end