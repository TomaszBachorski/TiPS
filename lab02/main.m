clc; clear all; close all;
% Cwiczenie 1
f=5;
t=0:0.00001:2;
A=5.12;

y1 = A*sawtooth(2*t*pi*f);
y2 = pi*sawtooth(2*t*pi*f);

shape_coef(y1)
shape_coef(y2)
% latwo zauwazyc ze wspolczynink ksztaltu nie zalezy od amplitudy
f=10;
y3 = A*sawtooth(2*t*pi*f);
shape_coef(y3)
% latwo zauwazyc ze wspolczynnik ksztaltu przy zmianie czestotliwoœci nie
% zmienia sie
%y3 = pi*square(2*t*pi*f);

hold on;

xlabel('t');
plot(t,y1);
plot(t,y2);
plot(t,y3);

%Cwiczenie 2
clear all; close all; clc;
%Taka metode mozemy zastosowac dla sygnalow sinusoidalnych i prostokatnych.
%Jedyna roznica wtedy bedzie wartosc wspolczynnika (np. dla sinusoidy wynosi on 1,1107).

%Cwiczenie 3
clear all; close all; clc;

R=0.01;
U=load('u.dat');

P=power2(U)/R

N=length(U);
a = 0.1*N - mod(N, 1); %precaution
for i = 1 : N-a
    % a a x x x x x x x x
    % x a a x x x x x x x
    % x x a a x x x x x x ...
    v=U(:,i:(a+i)-1);
    Pp_temp = power2(v);
    Partial_energy(i)=Pp_temp/R;
end
max(Partial_energy) %maximum

% Cwiczenie 4
clear all; close all; clc;

%setting environment
average = -4.2;
standard_deviation = 2.3;
N = 10;
n = average+standard_deviation*randn(1, N);

n_average = sum(n)/N
%n_average = mean(n);

n_deviation = sqrt(sum((n-n_average).^2)/(N-1))
%n_deviation = std(n);

hold on;
histogram(n,10, 'Normalization', 'pdf'); 
%Argument 'Normalization' pozwala na wyswietlanie osi y jako skali prawdopodobienstwa, wpp bedzie to ilosc wystapien
xlabel('Wartosc probki');

%histogram(n,10);
%ylabel('Ilosc wystapien');
ylabel('Prawdopodobienstwo');

x = linspace(min(n), max(n)); %dodatkowy argument pozwala na zmiane czestosci probkowania funkcji(10-zilustruje)
pdf = normpdf(x, n_average, n_deviation); % pdf - probability density function
plot(x, pdf, 'r');

title('Histogram proby danych i PDF rozkladu normalnego');
legend('Histogram znormalizowany', 'PDF');
%Zwiekszenie probkowania poskutkuje ladniejszym gaussem c:
%Odchylenie standardowe i wartosc srednia bedzie o wiele bardziej zblizona
%do tych zadanyc przez nas

%Cwiczenie 5
clear all; close all; clc
lotek = dlmread("lotto.csv");
max_value = 49; % ilosc liczb w totku

numbers = lotek(:, 5:end); %end z angielskiego koniec
numbers = numbers(:);

histogram(numbers, max_value, 'Normalization', 'pdf');
xlabel('Wylosowana liczba');
ylabel('Prawdopodobienstwo');

title('Histogram wynikow losowan lotka');












