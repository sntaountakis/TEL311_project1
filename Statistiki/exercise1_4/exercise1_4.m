data_file = './data/mnist.mat';

data = load(data_file);

images = zeros(size(data.trainX, 1), 28, 28);
labels = zeros(size(data.trainY, 1), 1);

for i = 1:size(data.trainX, 1)
    img = data.trainX(i, :);
    images(i, :, :) = reshape(img, 28, 28)';
    labels(i) = data.trainY(i);
end

digit_C1_indices = find(labels == 1); % digit 1
digit_C2_indices = find(labels == 2); % digit 2

digit_C1_images = images(digit_C1_indices, :, :);
digit_C2_images = images(digit_C2_indices, :, :);


aRatios=zeros(length(images),1); 

% Compute the aspect ratios of all images and store the value of the i-th image in aRatios(i)

for i=1:length(images)
    aRatios(i,1)=computeAspectRatio(images(i,:,:));
    if aRatios(i,1) == 0 
        fprintf('Index %d', i)
    end
end

minAspectRatio = min(aRatios(:,1)); 
maxAspectRatio = max(aRatios(:,1));

aRatiosC1=aRatios(digit_C1_indices,1);
aRatiosC2=aRatios(digit_C2_indices,1);

%min and max aspect Ratio of C1 and C2 images. 
minAspectRatioC1 = min(aRatiosC1(:,1));
maxAspectRatioC1 = max(aRatiosC1(:,1));

minAspectRatioC2 = min(aRatiosC2(:,1)) ;
maxAspectRatioC2 = max(aRatiosC2(:,1));

minAspectRatio=min(minAspectRatioC1,minAspectRatioC2)
minAspectRatio=min(maxAspectRatioC1,maxAspectRatioC2)

numBins = 3;

binEnds = linspace(minAspectRatio, maxAspectRatio, numBins+1);

C1_bins = zeros(numBins, 1);
C2_bins = zeros(numBins, 1);
all_bins = zeros(numBins, 1);

% Use the findBin function to get the counts for the histogram
for i=1:length(digit_C1_indices)
    index_C1=findBin(aRatios(digit_C1_indices(i)), binEnds); 
    C1_bins(index_C1,1)=C1_bins(index_C1,1) + 1;
end
for i=1:length(digit_C2_indices)
    index_C2=findBin(aRatios(digit_C2_indices(i)), binEnds); 
    C2_bins(index_C2,1)=C2_bins(index_C2,1) + 1;
end

all_bins = C1_bins+C2_bins

%Histograms of images. 
[h_C1, b_C1] = hist(digit_C1_indices, all_bins);
[h_C2, b_C2] = hist(digit_C2_indices, all_bins);

bar(b_C1,h_C1,2,'FaceColor',[0.2 0.2 0.5]);
hold on;
bar(b_C2,h_C2,2,'FaceColor',[0.3 0.7 0.3]);
hold off; 
grid on;


% Prior Probabilities
%PC1=(all_bins(1,1)/sum(all_bins))*100
%PC2=(all_bins(2,1)/sum(all_bins))*100
total_samples=length(digit_C1_images)+length(digit_C2_images);

% Prior Probabilities
PC1=(length(digit_C1_images)/total_samples) 
PC2=(length(digit_C2_images)/total_samples)


% Likelihoods
PgivenC1 = (C1_bins/length(digit_C1_images))
PgivenC2 = (C2_bins/length(digit_C2_images))


% Evidence 
Pevidence = all_bins/(length(digit_C2_images)+length(digit_C1_images))


% Posterior Probabilities
PC1givenL = (PgivenC1(1)*PC1)/Pevidence(1)
PC2givenL = (PgivenC2(1)*PC2)/Pevidence(1)

