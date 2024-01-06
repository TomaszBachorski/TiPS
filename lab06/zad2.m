poly1 = rand(1, 100000) - 0.5;
poly2 = rand(1, 100000) - 0.5;

tic;
result_fast = fastPolynomialMultiplication(poly1, poly2);
time_fast = toc;

tic;
result_conv = conv(poly1, poly2);
time_conv = toc;

disp('Sa takie same?');
disp(isequal(round(result_fast, 6), round(result_conv, 6)));

disp('Szybkie mnozenie:');
disp(time_fast);

disp('Mnozenie przez splot:');
disp(time_conv);

function result = fastPolynomialMultiplication(poly1, poly2)
    n = length(poly1);
    m = length(poly2);
    N = 2^nextpow2(n + m - 1);
    poly1 = [poly1, zeros(1, N - n)];
    poly2 = [poly2, zeros(1, N - m)];
    fftPoly1 = fft(poly1);
    fftPoly2 = fft(poly2);
    fftResult = fftPoly1 .* fftPoly2;
    
    result = ifft(fftResult);
end
