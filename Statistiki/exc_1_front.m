clear all 
close all

%%Draw the gaussians (likelihoods)
pY1=0.5; pY2=0.5; %Prior Probabilities
X=[-2:0.001:11]; %Horizontal axis
Y1=normpdf(X,3,1);
Y2=normpdf(X,7,1);
plot(X,Y1,X,Y2,'LineWidth',2)

%Draw the means
meanY1=3; 
line([meanY1 meanY1],[0,max(Y1)],'Linestyle','-','Color','b')
str1 = '\leftarrow \mu_1 = 3';
text(meanY1,0.1,str1,'Fontsize',13)
meanY2=7;
line([meanY2 meanY2],[0,max(Y2)],'Linestyle','-','Color','r')
str2 = '\leftarrow \mu_2 = 7';
text(meanY2,0.1,str2,'Fontsize',13)
grid on
axis([-2 11 -0.1 0.5])

%% Calculate the boundary given priors are equals
DiffY1Y2=Y1-Y2;
idx=find(DiffY1Y2<=0,1); %the first point where the difference becomes <=0.1
SP=X(idx) %Point where the boundary of the two classes is placed
ax=axis; %Take the axis of the diagram
line([SP SP],ax(3:4),'Linestyle','--','Color','k','LineWidth',2)