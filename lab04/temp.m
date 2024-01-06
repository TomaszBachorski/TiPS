clc, close all; clear all;

% load data
x = audioread('dtmf2.m4a');
% signal parameters
Fs = 48000; % sampling rate
sound(x,Fs); % you can listen to it
ts = 1/Fs; % sampling period
N = length(x);
% time vector
t = (0 : N - 1) * ts;
% plot the signal:
%plot(x);

% array with button values
buttons = ['1', '2', '3', 'A';
           '4', '5', '6', 'B';
           '7', '8', '9', 'C';
           '*', '0', '#', 'D'];
% lower frequencies vector
fLow = [697, 770, 852, 941];
% higher frequencies vector
fHigh = [1209, 1336, 1477, 1633];

% window length - adjust to get optimal results (use the power of 2)
Nw = 2048;
% distance between bands in the frequency spectrum:
delta_f = 1/(Nw*ts);
% frequency axes:
fa = [0:Nw-1]*delta_f;

idxLow = round(fLow/delta_f)+1;
idxHigh = round(fHigh/delta_f)+1;
wynik = " ";
% ------------------------------------
% put your additional variables here
indeksy_czestotliwosci = zeros(2,N-Nw+1);

% ------------------------------------

% sliding window of length Nw
for i = 24999 : N - Nw + 1
    % current signal fragment
    curx = x(i : i + Nw - 1);
    if max(curx) < 0.01
        wynik(end)= ' ';
        continue
    end

   % ------------------------------------
   % calculate Fourier transform of signal fragment 
   % and process it in order to verify if there exist frequencies of DTMF
   % if yes - remember the combination of frequencies related do one of the buttons
    widmo = abs((2/Nw)*fft(curx));
    prazkiLow = widmo(idxLow);
    prazkiHigh = widmo(idxHigh);
    [maxLow,idx_maxLow] = max(prazkiLow);
    if maxLow > 0.01
        [maxHigh,idx_maxHigh] = max(prazkiHigh);
        przycisk = buttons(idx_maxLow,idx_maxHigh);
        if wynik(end)~=przycisk                                                
           wynik(end)=string(przycisk);                  
           wynik(end+1)=string(przycisk);
       end
    end
   % ------------------------------------
end
wynik(end)=[];    
disp(wynik);



