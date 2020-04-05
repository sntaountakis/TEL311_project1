function A = myLDA(Samples, Labels, NewDim)
% Input:    
%   Samples: The Data Samples 
%   Labels: The labels that correspond to the Samples
%   NewDim: The New Dimension of the Feature Vector after applying LDA

	%A=zeros(NumFeatures,NewDim);
    
	[NumSamples NumFeatures] = size(Samples);
    NumLabels = length(Labels);
    if(NumSamples ~= NumLabels) then
        fprintf('\nNumber of Samples are not the same with the Number of Labels.\n\n');
        exit
    end
    Classes = unique(Labels);
    NumClasses = length(Classes)  %The number of classes
    
    %Calculate the Global Mean
    m0=mean(Samples)
    global Sw Sb
    %For each class i
	%Find the necessary statistics
    Sw=zeros(4,4);
    Sb=zeros(4,4);
    for i=1:NumClasses
        %Calculate the Class Prior Probability
        fprintf('test');
        P(i)= length(Samples(Labels==i-1))/NumSamples;
        %Calculate the Class Mean 
        mu(i,:)=mean(Samples(Labels==i-1,:)) 
        %Calculate the Within Class Scatter Matrix
        Sw=Sw+P(i)*cov(Samples(Labels==i-1,:));
        Sb=Sb+P(i)*((mu(i,:)-m0)'*(mu(i,:)-m0)) 
        %test=P(i)*(mu(i,:)-m0)'*((mu(i,:)-m0))
    end

    
    %Calculate the Between Class Scatter Matrix
	
    
    %Eigen matrix EigMat=inv(Sw)*Sb
    EigMat = inv(Sw)*Sb
    
    %Perform Eigendecomposition
    [V,D]=eig(EigMat);
    S=diag(D);
    [S,ind]=sort(S,1,'descend'); %Sort eigenvalues
    U=V(:,ind);
    A=U(1:NewDim,:)
    
    %Select the NewDim eigenvectors corresponding to the top NewDim
    %eigenvalues (Assuming they are NewDim<=NumClasses-1)
	%% You need to return the following variable correctly.
	%A=zeros(NumFeatures,NewDim);  % Return the LDA projection vectors
