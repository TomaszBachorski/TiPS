% czêstotliwoœæ próbkowania
fs = 48000;
% czas próbkowania
ts = 1/fs;
% czas trwania
T = 3;
% wektor czasu
t = 0 : ts : T - ts;

% czêstotliwoœæ generowanego sygna³u
% proszê przetestowaæ dzia³anie filtru
% dla ró¿nych czêstotliwoœci
f = 5000;
% wygenerowany sygna³
y = sin(2*pi*f*t);

% aby wczytaæ próbki z pliku audio nale¿y odkomentowaæ poni¿sz¹ liniê
% [y, fs] = audioread('muzyka.mp3');
% y = y(:, 1)';
% ts = 1/fs;

% wartoœci wspó³czynników filtra - nale¿y zast¹piæ w³asnymi
x = zeros(1, 50);

% filtracja sygna³u
z = filterSig(y, x);

% fft sygna³u wejœciowego
subplot(3, 1, 1);
Ny = length(y);
Y = fft(y);
ky = 0 : Ny - 1;
fvy = ky / (Ny * ts);
plot(fvy, abs(Y));
axis([0 fvy(end) 0 max(abs(Y))*1.1]);

% fft wspó³czynników filtra
subplot(3, 1, 2);
Nx = length(x);
X = fft(x);
kx = 0 : Nx - 1;
fvx = kx / (Nx * ts);
plot(fvx, abs(X));
axis([0 fvx(end) 0 1.2]);

% fft sygna³u wyjœciowego
subplot(3, 1, 3);
Nz = length(z);
Z = fft(z);
kz = 0 : Nz - 1;
fvz = kz / (Nz * ts);
plot(fvz, abs(Z));
axis([0 fvy(end) 0 max(abs(Y))*1.1]);

% odtwarzanie od sekundy 0 do 3
tstart = 0;
tend = 3;
% sygna³ wejœciowy
disp('Odtwarzanie sygna³u wejœciowego');
p = audioplayer(y, fs);
% odtwarzanie od sekundy ts do te
play(p, [tstart * fs + 1, tend * fs]);
% pauza na te-ts sekund, aby umo¿liwiæ odtwarzanie
pause(tend-tstart);

% sygna³ wyjœciowy
disp('Odtwarzanie sygna³u wyjœciowego');
p = audioplayer(z, fs);
% odtwarzanie od sekundy ts do te
play(p, [tstart * fs + 1, tend * fs]);
% pauza na te-ts sekund, aby umo¿liwiæ odtwarzanie
pause(tend-tstart);
