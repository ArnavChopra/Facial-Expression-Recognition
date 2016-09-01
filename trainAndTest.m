% This function performs training and testing of image to find facial expression
% This function is called using "testImgs.m" function

function [answer]=trainAndTest(imgTest)

% Number of zeros indicates total facial metrics
happyFeatF=[0 0 0 0 0];
surpriseFeatF=[0 0 0 0 0];
neutralFeatF=[0 0 0 0 0];

% "trained.mat" file uses pre-determined value to test images
% To recompute the training data, simply remove the "trained.mat" file from folder
% create new training file if distance measure is changed to euclidean distance

if exist('trained.mat','file')
    existFile=1;
    
    %happyFeatF=load('trained.mat','happyFeatF');
    load('trained.mat','happyFeatF');
    load('trained.mat','surpriseFeatF');
    load('trained.mat','neutralFeatF');
    
    % load('trained.mat','disgustFeatF');
else
    % training needed

    happyFeatF=trainHappy();
    surpriseFeatF=trainSurprise();
    neutralFeatF=trainNeutral();
    save('trained.mat','happyFeatF','surpriseFeatF','neutralFeatF');
end

% testing image using Mahalanobis distance 
answer=detectMaha(imgTest,happyFeatF,surpriseFeatF,neutralFeatF);

% display final answer i.e. expression recognized for test images
answerOP=[imgTest,': Expression recognized is ',answer];
figure('Name',answer,'NumberTitle','off'),
imshow(imgTest);
disp(answerOP)



