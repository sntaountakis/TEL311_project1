function [X_rec] = recoverDataLDA(Z, v)

% You need to return the following variables correctly.
X_rec = zeros(size(Z, 1), length(v));

% ====================== YOUR CODE HERE ======================

X_rec=[Z;Z].*((v/(v'*v))*ones(1,length(Z)));
X_rec = X_rec'

% =============================================================

end
