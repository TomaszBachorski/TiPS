function [outHist] = genHist(image)
%GENHIST Generuje histogram dla podanego obrazu.
% Obraz jest macierza h x w x 3 o wartosciach w zakresie 0 - 255.
% Wynikowy histogram powinien byc wektorem wierszowym o stalej dlugosci.

    % Zastap ponizszy kod tak, aby obliczal histogram dla obrazu RGB.
    % Prosze dobrac odpowiednia dlugosc wektora outHist.
    outHist = zeros(1,16);
    numBins = 16; 
    channelRanges = 256;  

    outHist = zeros(1, numBins);

    grayImage = rgb2gray(image);

    for i = 1:numBins
        binStart = (i - 1) * (channelRanges / numBins);
        binEnd = i * (channelRanges / numBins);

        pixelsInBin = sum(sum(grayImage >= binStart & grayImage < binEnd));

        outHist(i) = pixelsInBin;
    end
end