% function used to extract facial features & calculates feature point distance

function [outputFeatures]=extractFeatures(imgEF) 

%{ to read input image %}
imgOF = imread(imgEF);

%{ converting to double format %}
doubleImg = im2double(imgOF);

%figure, imshow(doubleImg), title('Original'); 

% to smooth image
smoothImg=medfilt2(doubleImg);

I=smoothImg;

% to detect face (default i.e. FaceCART)
faceDetector = vision.CascadeObjectDetector;
facePart = step(faceDetector,I);

% fHt is same as fWt
fWt=facePart(3);
fHt=facePart(4);

face=imcrop(I,facePart);
%figure, imshow(face),title('Face Only');

I=face;

%To detect Eye pair
EyeDetect = vision.CascadeObjectDetector('EyePairBig','MergeThreshold',10);
eyePair=step(EyeDetect,I);

% eye pair width and height
tempEWt=eyePair(3);
tempEHt=eyePair(4);

x=eyePair(1);
y=eyePair(2);
wd=eyePair(3);
ht=eyePair(4);

eyeL=face( 1:floor(y+ht), floor(x+(wd)/2):size(face,2) );
eyeR=face( 1:floor(y+ht), 1:floor(x+(wd)/2) );
  
%To detect Right Eye
rightEyeDetector = vision.CascadeObjectDetector('RightEyeCART');
eyeRight=step(rightEyeDetector,eyeR);

tempEyeHtR=eyeRight(4);
tempEyeWtR=eyeRight(3);

%figure,subplot(1,2,1), imshow(eyeR), title('Detected Right Eye');hold on
%rectangle('Position',eyeRight,'LineWidth',2,'LineStyle','-','EdgeColor','g');

%To detect Left Eye
leftEyeDetector = vision.CascadeObjectDetector('LeftEyeCART');
eyeLeft=step(leftEyeDetector,eyeL);

%subplot(1,2,2), imshow(eyeL), title('Detected Left Eye');hold on
%rectangle('Position',eyeLeft,'LineWidth',2,'LineStyle','-','EdgeColor','b');

tempEyeHtL=eyeLeft(4);
tempEyeWtL=eyeLeft(3);

% Eye related feature distance
eHtL=tempEyeHtL-tempEHt;
eHtR=tempEyeHtR-tempEHt;
eGap=tempEWt-(tempEyeWtL+tempEyeWtR);

faceWOEye=face((y+ht):size(face,1),1:size(face,2));

% to detect nose
noseDetector = vision.CascadeObjectDetector('Nose');
nosePart=step(noseDetector,faceWOEye);

if(isempty(nosePart)==1) 
    noseRem=faceWOEye; 
else      
    xN=nosePart(1);
    yN=nosePart(2);
    wdN=nosePart(3);
    htN=nosePart(4);
   % htN=htN-2;
    noseRem=faceWOEye(htN:size(faceWOEye,1), (1:size(faceWOEye,2)));
end

% smooth new image
noseRem=medfilt2(noseRem);

%To detect Mouth
MouthDetector = vision.CascadeObjectDetector('Mouth','MergeThreshold',10);
mouthPart=step(MouthDetector,noseRem);
% Check if mouth detected using Viola Jones Algorithm
if(isempty(mouthPart)~=1)
    %figure,imshow(noseRem),title('Mouth'); hold on
    %for i = 1:size(mouthPart,1)
    %rectangle('Position',mouthPart(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','g');
    %end
    mWt=mouthPart(3);
    mHt=mouthPart(4);
end 

% Check if mouth not detected using Viola Jones Algorithm
% Perform gray thresh, edge detection
if(isempty(mouthPart)==1)
    level = graythresh(noseRem);
    BW = im2bw(noseRem,level-0.1);
    %figure, imshow(BW),title('BW Thresh'),
    grayImg=BW;
    %{ to find edge %}
    noseRem=edge(grayImg,'prewitt');   
    [centers,radii,metric]=imfindcircles(noseRem,[10 200]);
    if(size(radii,2)>0)
        %viscircles(centers(1),radii(1));
        mWt=ceil(radii(1)+radii(1));
        mHt=floor(radii(1)+radii(1));
    end
end

outputFeatures=[(mWt/fHt) (mHt/fHt) (eHtL/fHt) (eHtR/fHt) (eGap/fHt)];

end
