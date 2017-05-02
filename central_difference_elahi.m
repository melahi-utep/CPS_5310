% 30/30
%CPS 5310 Homework 7
%Title: Central Difference
%Author: Mirza Mohammad Maqbule Elahi
%Date: 04-19-2017

%%
clear all;
close all;
clc;

%%%%%%%Input Data for Population%%%%%%
years = 0:2:48; %years 1900-1920
H = [.3 .85 14.8 .6 .9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 .5 1 .5 5.8 3.6 2.3 3]; %H for population of Hare
L = [.3 1.8 4.3 6.2 1 .8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 .8 1 2 5.8 4 1]; %L for population of Lynx

%%%%%%%Central Difference%%%%%%%
for s = 2:24 %excluding the first and last value because of central difference
    y1(s-1) = (1/H(s))*((H(s-1)-H(s+1))/(years(s-1)-years(s+1)));
    x1(s-1) = L(s);
    
    y2= (1/L(s))*((L(s-1)-L(s+1))/(years(s-1)-years(s+1)));
    x2 = H(s);
    
end

%%%%%%%%Polynomial curve fitting%%%%%%%%%
p1 = polyfit(y1,x1,1);
p2 = polyfit(y2,x2,1);

p = [p1(1) p1(2) p2(1) p2(2)];

fprintf(' a=%3.4f\n b=%3.4f\n c=%3.4f\n r=%3.4f\n',p(1),p(2),p(3),p(4));

[t,y]=ode45(@(t,y) lv_rhs(t,y,p),years,[H(1);L(1)]);

plot(years,H,'r',years,L,'g',t,y,'k') 

xlabel('x, y')
ylabel('(1/x)(dx/dt), (1/y)(dy/dt)')
legend('Hare','Lynx','location','Northeast')
    
    
    
