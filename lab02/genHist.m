function [outHist] = genHist(image)    
    outHist = [];

    % Kanaly
    red_channel = image(:, :, 1);
    green_channel = image(:, :, 2);
    blue_channel = image(:, :, 3);

    % Liczna koszykow
    numBins = 16;


    % https://uk.mathworks.com/help/matlab/ref/histcounts.html
    % Do zliczania w koszyki
    red_hist = histcounts(red_channel, numBins, 'BinLimits', [0, 255]);
    green_hist = histcounts(green_channel, numBins, 'BinLimits', [0, 255]);
    blue_hist = histcounts(blue_channel, numBins, 'BinLimits', [0, 255]);

    % 
    outHist = [red_hist, green_hist, blue_hist];
end