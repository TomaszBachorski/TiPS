liczba=load('spotsMod.csv');
liczba(:,1) = [];
liczba=liczba';
liczba=liczba(:);
[liczba_autocorr,lags] = xcorr(liczba,'unbiased');
liczba_autocorr(lags<0) = [];
lags(lags<0) = [];

x=(1/20)*ones(1,20);

filtr_liczba_autocorr = filter(x,1,liczba_autocorr);

[peak,peak_idx] = findpeaks(filtr_liczba_autocorr);



for k = 1:size(peak_idx) - 1
    odlegosc(k) = peak_idx(k+1)-peak_idx(k);
end


plot(lags,liczba_autocorr);
hold on
plot(lags,filtr_liczba_autocorr);
plot(peak_idx,20);
hold off

T = mean(odlegosc)
