clear all; 
close all;

S1 = [1.2 -0.4; -0.4 1.2];
S2 = [1.2 0.4; 0.4 1.2];

mu1=[3 3];
mu2=[6 6];

DT=0.01;
x1=[-4:DT:10]; %Horizontal axis
x2=[-4:DT:10];
[X1,X2]=meshgrid(x1,x2);


figure(1)
Y1=mvnpdf([X1(:) X2(:)],mu1,S1);
Y1R=reshape(Y1,length(x2),length(x1));
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999])
grid on



DT=0.01;
x1=[-2:DT:12]; %Horizontal axis
x2=[-2:DT:12];
[X1,X2]=meshgrid(x1,x2);

figure(2)
Y2=mvnpdf([X1(:) X2(:)],mu2,S2);
Y2R=reshape(Y2,length(x2),length(x1));
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999])
grid on

%---- C ---- C ---- C ---- C ----

syms x y 

figure(3)
%P(w1)=P(w2)=0.5
y=22.32/x;
ezplot(y,[-4 12 -4 12]);
hndl=get(gca,'Children');
set(hndl,'LineWidth',2,'Color',[0 0 0]);
hold on;
Y1=mvnpdf([X1(:) X2(:)],mu1,S1);
Y1R=reshape(Y1,length(x2),length(x1));
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999], 'LineColor','r')


Y2=mvnpdf([X1(:) X2(:)],mu2,S2);
Y2R=reshape(Y2,length(x2),length(x1));
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999], 'LineColor','b');
grid on

figure(4)
syms x y
Pw1=0.5;
Pw2=1-Pw1;
eqn = log(Pw1)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y+0.62*x*y+22.32)) == log(Pw2)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y-0.62*x*y+44.64));  
solvey=solve(eqn,y)
solvex=solve(eqn,x)
plt1=ezplot(solvey(1),[-4 12 -4 12]);
%hndl=get(gca,'Children');
set(plt1,'LineWidth',2,'Color',[0 0 0]);
hold on;

Pw1=0.25;
Pw2=1-Pw1;
eqn = log(Pw1)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y+0.62*x*y+22.32)) == log(Pw2)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y-0.62*x*y+44.64));  
solvey=solve(eqn,y)
solvex=solve(eqn,x)
plt2=ezplot(solvey(1),[-4 12 -4 12]);
%hnd2=get(gca,'Children');
set(plt2,'LineWidth',2,'Color',[0 1 0.2]);

Pw1=0.75;
Pw2=1-Pw1;
eqn = log(Pw1)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y+0.62*x*y+22.32)) == log(Pw2)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y-0.62*x*y+44.64));  
solvey=solve(eqn,y)
solvex=solve(eqn,x)
plt3=ezplot(solvey(1),[-4 12 -4 12]);
%hnd3=get(gca,'Children');
set(plt3,'LineWidth',2,'Color',[0.5 0 0.7]);

Pw1=0.9;
Pw2=1-Pw1;
eqn = log(Pw1)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y+0.62*x*y+22.32)) == log(Pw2)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y-0.62*x*y+44.64));  
solvey=solve(eqn,y)
solvex=solve(eqn,x)
plt4=ezplot(solvey(1),[-4 12 -4 12]);
%hnd4=get(gca,'Children');
set(plt4,'LineWidth',2,'Color',[1 0 0.3]);

Pw1=0.1;
Pw2=1-Pw1;
eqn = log(Pw1)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y+0.62*x*y+22.32)) == log(Pw2)+(-1.96-(1/2)*(0.93*x^2-7.44*x+0.93*y^2-7.44*y-0.62*x*y+44.64));  
solvey=solve(eqn,y)
solvex=solve(eqn,x)
plt5=ezplot(solvey(1),[-4 12 -4 12]);
%hnd5=get(gca,'Children');
set(plt5,'LineWidth',2,'Color',[0 0.3 1]);
legend('Pw1=0.5','Pw1=0.25','Pw1=0.75','Pw1=0.9','Pw1=0.1')
Y1=mvnpdf([X1(:) X2(:)],mu1,S1);
Y1R=reshape(Y1,length(x2),length(x1));
contour(x1,x2,Y1R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999], 'LineColor','r')


Y2=mvnpdf([X1(:) X2(:)],mu2,S2);
Y2R=reshape(Y2,length(x2),length(x1));
contour(x1,x2,Y2R,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999], 'LineColor','b');
grid on
hold off; 