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
signal = A * sawtooth(2*pi*f*T);

% fft
fourier_signal = 1/N*fft(signal); %1/N bo to wariant 1 z adasia
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


