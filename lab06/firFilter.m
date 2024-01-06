% cz�stotliwo�� pr�bkowania
fs = 48000;
% czas pr�bkowania
ts = 1/fs;
% czas trwania
T = 3;
% wektor czasu
t = 0 : ts : T - ts;

% cz�stotliwo�� generowanego sygna�u
% prosz� przetestowa� dzia�anie filtru
% dla r�nych cz�stotliwo�ci
f = 5000;
% wygenerowany sygna�
y = sin(2*pi*f*t);

% aby wczyta� pr�bki z pliku audio nale�y odkomentowa� poni�sz� lini�
% [y, fs] = audioread('muzyka.mp3');
% y = y(:, 1)';
% ts = 1/fs;

% warto�ci wsp�czynnik�w filtra - nale�y zast�pi� w�asnymi
x = zeros(1, 50);

% filtracja sygna�u
z = filterSig(y, x);

% fft sygna�u wej�ciowego
subplot(3, 1, 1);
Ny = length(y);
Y = fft(y);
ky = 0 : Ny - 1;
fvy = ky / (Ny * ts);
plot(fvy, abs(Y));
axis([0 fvy(end) 0 max(abs(Y))*1.1]);

% fft wsp�czynnik�w filtra
subplot(3, 1, 2);
Nx = length(x);
X = fft(x);
kx = 0 : Nx - 1;
fvx = kx / (Nx * ts);
plot(fvx, abs(X));
axis([0 fvx(end) 0 1.2]);

% fft sygna�u wyj�ciowego
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
% sygna� wej�ciowy
disp('Odtwarzanie sygna�u wej�ciowego');
p = audioplayer(y, fs);
% odtwarzanie od sekundy ts do te
play(p, [tstart * fs + 1, tend * fs]);
% pauza na te-ts sekund, aby umo�liwi� odtwarzanie
pause(tend-tstart);

% sygna� wyj�ciowy
disp('Odtwarzanie sygna�u wyj�ciowego');
p = audioplayer(z, fs);
% odtwarzanie od sekundy ts do te
play(p, [tstart * fs + 1, tend * fs]);
% pauza na te-ts sekund, aby umo�liwi� odtwarzanie
pause(tend-tstart);
