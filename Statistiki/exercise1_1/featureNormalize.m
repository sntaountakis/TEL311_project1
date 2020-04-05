function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% mean of each column (feature)

mu = mean(X);

%Variance of each column. 


X_var = var(X);

% standart deviation of each column


sigma = sqrt(X_var);
%{
%Setup Threshold for detecting outliers for each column. 
sdWeight=1; 
Thresh(1) = sdWeight*sigma(1); 
Thresh(2) = sdWeight*sigma(2); 

%Values above threshold. 
idx(:,1) = find( mu(1)+Thresh(1) | (x<mu(1) - Thresh(1)));
idx(:,2) = find( mu(2)+Thresh(2) | (x<mu(2) - Thresh(2)));

%Get the outliers
outliers(:,1) = X(idx(:,1),1); 
outliers(:,2) = X(idx(:,2),2); 

%The dataset without outliers
X(idx(:,1),1)=[];
X(idx(:,2),2)=[];
%}

% normalize each column independently


X_norm = X - (mu/sigma); 

% ============================================================

end
