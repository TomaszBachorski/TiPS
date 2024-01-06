close all;clc;clear all;
T=5;
f=1000;
Ts=T/f;
N=T/Ts;
os_t=[0:N-1]*Ts;

sigma=1.33;
N_fir=9;
alfa=(N_fir-1)/(2*sigma);
s1=randn(1,T/Ts);

aaa=figure;
subplot(3,1,1);
line(os_t,s1);

gauss_window=gausswin(N_fir, alfa);
gauss_window_0=gauss_window/(sum(gauss_window));
gauss_window=zeros(1,N);
gauss_window(1:N_fir) = gauss_window_0;
N_fir=N;
os_t_fir=[0:N_fir-1]*Ts;
figure;
line(os_t_fir,gauss_window);

os_f_syg = [0:N-1]*(1/T);
os_f_fir = [0:N_fir-1]*(1/(N_fir*Ts));


fft_s1 = fft(s1);
fft_fir = fft(gauss_window);

amp1_s1 = abs((2/N)*fft_s1);
amp1_fir = abs((2/N)*fft_fir);

figure;
subplot(2,1,1);
stem(os_f_syg,amp1_s1, 'Marker','none');
subplot(2,1,2);
stem(os_f_fir,amp1_fir, 'Marker','none');

s2=conv(s1,gauss_window, 'same');
figure(aaa);
subplot(3,1,2);
line(os_t,s2);

subplot(3,1,3)
fft_wynik = fft_s1.*fft_fir;
wynik=ifft(fft_wynik);
line(os_t, wynik);






