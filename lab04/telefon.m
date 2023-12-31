clc, close all; clear all;
[s,fs] = audioread('dtmf2.m4a');
x = s(:,1);
% sound(x,fs);
ts = 1/fs; 
N = length(s);
t = (0 : N - 1) * ts;
subplot(2,1,1);
plot(x);
subplot(2,1,2);
plot(t,x);

% array with button values 
buttons = ['1', '2', '3', 'A';
           '4', '5', '6', 'B';
           '7', '8', '9', 'C';
           '*', '0', '#', 'D'];
betterButtons = [
               ['1', '2', '3', 'A'],
               ['4', '5', '6', 'B'],
               ['7', '8', '9', 'C'],
               ['*', '0', '#', 'D']
];

% lower frequencies vector
fLow = [697, 770, 852, 941];
% higher frequencies vector
fHigh = [1209, 1336, 1477, 1633];

% processing single signal fragmet:
% window length - adjust to get optimal results (use the power of 2)
Nw = 2^11;
% distance between bands in the frequency spectrum:
delta_f = 1/(Nw*ts);
% frequency axes:
fa = [0:Nw-1]*delta_f;

l = floor(length(s)/Nw);

finalVec = [];
for i=1:l-1
    x_start = Nw*i;
    x_stop = x_start+Nw-1;
    xFra = x(x_start:x_stop);
    %sound(xFra,fs);
    %figure; plot(xFra);
    magnit = abs((2/Nw)*fft(xFra));
    %[v,i] = findpeaks(xFra, 'MinPeakDistance',50)
    %[~,idx] = max(magnit)
    %ceil(fa(idx))
    
    %finding frequencies
    if (max(magnit)<0.01)
        continue;
    end
    [~,idx] = findpeaks(magnit, 'MinPeakHeight',0.01);
    if (isempty(idx)==true) 
        continue; 
    end;
    freqs = ceil(fa(idx));
    freqs(freqs>1700) = 0;
    freqs = freqs(find(freqs~=0));
    %spliting low and high freq
    lFreqs = freqs(freqs<1000);
    hFreqs = freqs(freqs>1000);
    if (isempty(lFreqs)==true || isempty(hFreqs)==true)
        continue;
    end
    flFreq = bestValue(lFreqs, fLow);
    hlFreq = bestValue(hFreqs, fHigh);
    idxLow = find(fLow==flFreq);
    idxHigh = find(fHigh==hlFreq);
    % 1   9   6   3   1   1   9   6   3   2   
    % 1   6   3   2   9   9   9   9   #   9   6   3   2
    button = betterButtons(idxLow, idxHigh)
end
%fa(fa<650)=0;
%figure;
%stem(fa,magnit,'Marker','.');




