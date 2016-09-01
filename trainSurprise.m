% training function for surprise images 

function [surpriseFeatures]=trainSurprise() 

surpriseFeatures=[0 0 0 0 0];

% Total number of Surprise images used to generate training data
surpriseImgSize=27;

% Generating feature vectors for standard Surprise images from JAFFE Database
features=extractFeatures('KA.SU2.37.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end
features=extractFeatures('KA.SU3.38.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KA.SU1.36.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end


features=extractFeatures('KL.SU1.164.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KL.SU2.165.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KL.SU3.166.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KM.SU1.14.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KM.SU2.15.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KM.SU3.16.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KR.SU1.80.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KR.SU2.81.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('KR.SU3.82.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('MK.SU1.122.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('MK.SU2.123.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('NA.SU2.209.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('NA.SU3.210.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end
features=extractFeatures('NA.SU2.209.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('NA.SU1.208.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end


features=extractFeatures('TM.SU1.187.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('TM.SU3.189.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('TM.SU2.188.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end
features=extractFeatures('UY.SU1.143.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('UY.SU2.144.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('UY.SU3.145.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end


features=extractFeatures('YM.SU2.59.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('YM.SU3.60.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end

features=extractFeatures('YM.SU1.58.tiff');
for featI=1:size(features,2)
    surpriseFeatures(featI)=surpriseFeatures(featI)+features(featI);
end



% Calculating average of feature vector
surpriseFeatures=surpriseFeatures./surpriseImgSize;


end
