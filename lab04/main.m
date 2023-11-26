clear all; close all; clc
%Cwiczenie 1
clc; clear all; close all;

A = 1; 
f = 2;
t_sym = 2;
t_prob = 1/100; % 10 ms
N = t_sym/t_prob; % ilosc probek
T = [0:N-1]*t_prob;
delta_f = 100/N;
F = [0:N-1]*delta_f;

%sygnal do pozniejszej rekonstrukcji
signal = A * square(2*pi*f*T);

% fft
fourier_signal = 1/N*fft(signal); %2/N bo to wariant 1 z adasia
amplitudes = abs(fourier_signal); %sqrt(im^2 + re^2)
phases = angle(fourier_signal); %przesuniecia fazowe

%Imaginary and rael
figure;
subplot(2,1,1);
plot(F, real(fourier_signal), 'b');
subplot(2,1,2);
plot(F, imag(fourier_signal), 'r');


% wybieranie n najwiekszych skladowych czestotliwosci
n=10;
[~, sorted_indices] = sort(amplitudes, 'descend');
selected_indices = sorted_indices(1:n);
reconstructed_signal = 0;

figure; hold on;
plot(T, signal);
stem(T, signal, '.'); % sprobkowany
for i = 1:length(selected_indices)
    harmonic = amplitudes(selected_indices(i)) * cos(2*pi*F(selected_indices(i))*T + phases(selected_indices(i)));
    reconstructed_signal = reconstructed_signal + harmonic;
    %plot(T, harmonic);
end

figure; hold on;
reconstructed_signal = reconstructed_signal;
plot(T, signal, Color='Black');
plot(T, reconstructed_signal, Color='Red');
%Wniosek: zwiekszajac ilosc hormonicznych coraz bardziej zblizamy sygnal do
%tego oryginalnego

%Cwiczenie 2
clear all; close all; clc;
f_s=1/20;
t_stop=2;
t=0:f_s:t_stop-f_s;
N = length(t);
f=2;
w=2*pi*f;
A=1;

phases = [0.1*pi 0.4*pi 1.5*pi];
figure;
%b
for i=1:3
    s=A*cos(w*t + phases(i));
    ft=fft(s);
    c=2*(ft/N);
    m=abs(c);
    pha = angle(c);
    df = 1/t_stop;
    fa = 0:N-1;
    fa = fa*df;
    subplot(3,2,2*i-1);
    plot(fa,m);
    subplot(3,2,2*i);
    plot(fa,pha);
end
% Przy zmianie przesuniecia fazowego zmiania sie argument transformaty

%c,d
figure;
f=[2,12,2.25];
for i=1:3
    w = 2*pi*f(i);
    s=A*cos(w*t);
    ft=fft(s);
    c=2*(ft/N);
    m=abs(c);
    pha = angle(c);
    df = 1/t_stop;
    fa = 0:N-1;
    fa = fa*df;
    subplot(3,2,2*i-1);
    plot(fa,m);
    subplot(3,2,2*i);
    plot(fa,pha);
end
%Patologia sie dzieje
f_s=1/20;
t_stop=1.75;
t=0:f_s:t_stop-f_s;
N = length(t);
f=2;
w=2*pi*f;
A=1;
s=A*cos(w*t);
ft=fft(s);
c=2*(ft/N);
m=abs(c);
pha = angle(c);
df = 1/t_stop;
fa = 0:N-1;
fa = fa*df;
figure;
subplot(2,1,1);
plot(fa,m);
subplot(2,1,2);
plot(fa,pha);
%W sumie nic sie nie zmienilo

