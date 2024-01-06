clc; close all; clear all;
Ts = 0.01;
t_stop = 3;
f = 2;
t = 0:Ts:t_stop;
w = 2*pi*f;
A = 2;
n = 0.5*randn(size(t));
s = A*sin(w*t);
sn = s+n;
N = length(t);

% x = -floor(N/2):floor(N/2);
sigma = 2;
alpha = (N-1)/(2*sigma);
f_mask = gausswin(N,alpha);
plot(f_mask);
% f_mask = f_mask/sum(f_mask);
figure;
plot(t,s,t,sn);
sf = conv(sn,f_mask,'same');
figure;
plot(t,s,t,sf);
% =====
m_s  = abs((2/N)*fft(s));
m_sn = abs((2/N)*fft(sn));
m_f = abs((2/N)*fft(f_mask));
m_sf = abs((2/N)*fft(sf));
df = 1/t_stop;
fa = (0:N-1)*df;

figure;
subplot(4,1,1);
stem(fa,m_s,'Marker','.');
subplot(4,1,2);
stem(fa,m_sn,'Marker','.');
subplot(4,1,3);
stem(fa,m_f,'Marker','.');
subplot(4,1,4);
stem(fa,m_sf,'Marker','.');

