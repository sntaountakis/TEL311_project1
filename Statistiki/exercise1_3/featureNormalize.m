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

% normalize each column independently
X_norm = X - (mu/sigma); 


% ============================================================

end