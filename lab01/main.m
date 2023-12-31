clear all; close all; clc;
f=4;
A=2.5;
t=[0:0.05:2];

%function 
y1 = A*sin(2*pi*f*t);
average = 0;
deviation = 0.1;

%noise function
noise = average + deviation*randn(1, length(t));
y2=y1+noise;

%plot
hold on;
xlabel('t');
ylabel('value');
plot(t,y1);
plot(t,y2);
title('sine plot');

clear all; clc; close all;

%loading signal
load("signal.mat");
t = t_and_s(:,1);
s1 = t_and_s(:,2);

s2 = f_scale(s1);
hold on;
plot(t,s1);
plot(t,s2)