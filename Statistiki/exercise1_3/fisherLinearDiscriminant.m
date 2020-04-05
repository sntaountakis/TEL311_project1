function v = fisherLinearDiscriminant(X1, X2)

    m1 = size(X1, 1);
    m2 = size(X2, 1);

    mu1 = mean(X1)
    mu2 = mean(X2)

    % scatter matrix of X1 and X2
    %S1 = (X1 - m1)*(X1-m1)'
    %S2 = (X2 - m2)*(X2-m2)'
    
    S1=cov(X1);
    S2=cov(X2);
    
    % Within class scatter matrix
    
    P(1)=m1/(m1+m2)
    P(2)=m2/(m1+m2)
    Sw=0;
    Sw=Sw+P(1)*S1;
    Sw=Sw+P(2)*S2;
    
    w=inv(Sw)*(mu1-mu2)';
    v= w/norm(w); %Vector of unit norm
    
    
       
