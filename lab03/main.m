clc; close all; clear all;
%Caly ten kod to sa rozwiazania zadan z domieszka kodow z zajec, wiec

%Cwiczenie 1
%Sygnaly krotkie
speed_of_sound = 340;
rx=load('rx_short.dat');
tx=load('tx_short.dat');
figure; plot(tx);
figure; plot(rx);
%pierwszy odebrany drugi transmitowany
[tx_rx, lags] = xcorr(rx,tx);
figure;
plot(lags, tx_rx);
tx_rx(lags<0) = [];
lags(lags<0) = [];
[c_max,max_idx] = max(tx_rx);
distance_of_single_period = ((max_idx/2)/1000000)*speed_of_sound %0.3402 metra

clear all; close all; clc;
%Sygnaly dlugie

speed_of_sound = 340;
Tp=10^-6;
rx = load('rx_long.dat');
tx = load('tx_long.dat');
figure; plot(rx);
figure; plot(tx);

[tx_rx,lags] = xcorr(rx,tx);
tx_rx(lags<0) = [];
lags(lags<0) = [];
figure;
plot(lags,tx_rx);
%200 - minimalna wysokosc peaku
%10000 - minimalny dystans pomiedzy
[v,x] = findpeaks(tx_rx, 'MinPeakHeight',200, 'MinPeakDistance',5000);
findpeaks(tx_rx, 'MinPeakHeight',200, 'MinPeakDistance',5000);
%Odleglosci w probkach
x=mod(x,10000) %10k probek jest w jednym okresie
distance = Tp*(x/2)*speed_of_sound %przez dwa bo tam i spowrotem, oraz kazdy sygnal zostal nadany w roznym czasie
%Odleglosc w metrach
%Wynik wyglada sensownie bo w sumie im dalsza probka tym dluzej ten sygnal
%musial isc wiec dystans powinien byc coraz wiekszy

clear all; close all; clc;
%Cwiczenie 2
ssss = load('signals.dat');

f=2;
Tp=0.001;
t=0:Tp:5-Tp;
s0 = sin(2*pi*f*t);
for i=1:4
    s1 = ssss(i,:);
    plot(t,s0,t,s1);
    [s1c,lags] = xcorr(s0,s1);
    %figure; plot(lags,s1c);
    %przesuniecie znalezione matematycznie
    idx = find(s1c==max(s1c));
    time_shift_samples(i) = lags(idx);

    %A(i)=2*s1c(idx)/(5000) to nielegalne
    %A(i)=mean(abs(s1))*pi/2; to też nielegalne
end
(time_shift_samples*2*pi*f*Tp)*(180/pi)
A
%A*1/2*1/N sum(cos(alfa))
%1/2 *A*sin(alfa)
% phi = 4.3200   19.4400   45.3600  169.9200
% A = 0.1127    0.5662    1.2599    3.4287 
% roznice wynikaja z wykorzystanych metod numerycznych
clear all; close all; clc;
%Cwiczenie 3
sun=load('spotsMod.csv');
sun=sun(:,2:13);
sun=sun';
sun_vector=sun(:);
save('plamy_wektor.mat', 'sun_vector');

[sun_cor, lags] = xcorr(sun_vector);
figure;
plot(lags,sun_cor);
findpeaks(sun_cor,'MinPeakDistance',85);
[v, x] = findpeaks(sun_cor,'MinPeakDistance',85)

for i=1:length(x)-1
    breaks(i) = x(i+1)-x(i);
end
%average between peaks
mean(breaks)