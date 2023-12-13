clc; close all; clear all;

% lista katalogow z danymi z krokomierza
dirs = {'Krokomierz1/', 'Krokomierz2/', 'Krokomierz3/'};

% wczytywanie danych, format wierszu w pliku: timestamp ax ay az
data = load(strcat(dirs{1}, 'data.log'));
% rzeczywisty dystans
realDist = load(strcat(dirs{1}, 'realDistance.txt'));

% parametry sygnalu
ts0 = 1e-9; % oryginalny okres próbkowania
% wektor czasu
t = data(:, 1)*ts0;
% aby czas zaczynal sie od 0
t = t - min(t);
Tl = max(t);
% odleglosci pomiedzy probkami na osi czasu
% jest to wielokrotnoœæ ts0
ts = Tl/(length(t) - 1);

% sygnal jako dlugosc wektora przyspieszenia
x = sqrt(data(:, 2).^2 + data(:, 3).^2 + data(:, 4).^2);
% wyswietlanie sygnalu
figure;
plot(t, x);

% zmienna, ktora nalezy zwiekszac wraz z wykrywaniem krokow
dist = 0;
% dlugosc okna - prosze dobrac optymalna wartosc
Nw = 64;
% distance between bands in the frequency spectrum:
delta_f = 1/(Nw*ts);
% frequency axes:
fa = [0:Nw-1]*delta_f;

% ------------------------------------
% miejsce na dodatkowe zmienne 



% koniec
% ------------------------------------

for i = 1 : length(x) - Nw + 1
  curx = x(i : i + Nw - 1);

  % ------------------------------------
  % tutaj powinien sie znalezc kod rozpoznajacy kroki



  % koniec
  % ------------------------------------

end

disp(['Obliczony dystans = ', num2str(dist)]);
disp(['Rzeczywisty dystans = ', num2str(realDist)]);


