function [U, S] = myPCA(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = myPCA(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.


% ====================== YOUR CODE GOES HERE ======================
% Apply PCA by computing the eigenvectors and eigenvalues of the covariance matrix. 
%

%Calculate Covariance Matrix
covMatrix = (1/m)*X'*X;

%Calculate eigenvalues and eigenVectors
[V,D]=eig(covMatrix);
S=diag(D);
[S,ind]=sort(S,1,'descend'); %Sort eigenvalues
U=V(:,ind);



% =========================================================================

end
