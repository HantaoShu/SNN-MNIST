% read binary files for mnist
% yyq, 2016-07-30

% read train labels
fid = fopen('train-labels.idx1-ubyte', 'rb');
trainLabels = fread(fid, inf, 'uint8', 'l');
trainLabels = trainLabels(9:end);
fclose(fid);
% read test labels
fid = fopen('t10k-labels.idx1-ubyte', 'rb');
testLabels = fread(fid, inf, 'uint8', 'l');
testLabels = testLabels(9:end);
fclose(fid);
% read train images
fid = fopen('train-images.idx3-ubyte', 'rb');
trainImages = fread(fid, inf, 'uint8', 'l');
trainImages = trainImages(17:end);
fclose(fid);
trainData = reshape(trainImages, 784, size(trainImages,1) / 784)';
% read train images
fid = fopen('t10k-images.idx3-ubyte', 'rb');
testImages = fread(fid, inf, 'uint8', 'l');
testImages = testImages(17:end);
fclose(fid);
testData = reshape(testImages, 784, size(testImages,1) / 784)';

clear testImages;
clear trainImages;

% poisson noise can be added
% t = uint8(random('Poisson', 1, size(trainData)));