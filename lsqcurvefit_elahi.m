%CPS 5310 Homework 7
%Title: Least Square Curve Fit
%Author: Mirza Mohammad Maqbule Elahi
%Date: 04-19-2017

%%
clear all;
clc;
close all;


%%%%%%%Input Data for Population%%%%%%
years = 0:2:48; %years 1862-1920
H = [.3 .85 14.8 .6 .9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 .5 1 .5 5.8 3.6 2.3 3]; %H for population of Hare
L = [.3 1.8 4.3 6.2 1 .8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 .8 1 2 5.8 4 1]; %L for population of Lynx


p0 = [0.4; 0.5; 0.01; 0.6]; 
[p,error]=lsqcurvefit(@lv_rhs,p0,years,[H(1);L(1)]);


fprintf(' a=%3.4f\n b=%3.4f\n c=%3.4f\n r=%3.4f\n',p(1),p(2),p(3),p(4));
