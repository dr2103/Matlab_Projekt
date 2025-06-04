% Prüft, ob ein gegebenes Binärbild nur Werte 0 und 255 enthält, und zeigt ein Grauwerthistogramm zur Überprüfung.

% 1. Binärbild einlesen
B = imread('Binaerbild_1.png');  

% 2. Rein binär schwellwerten, falls Werte ≠ {0,255} enthalten
BW = imbinarize(B);         
B_rein = uint8(BW) * 255;   
imwrite(B_rein, 'Binaerbild_1_rein.png');

% 3. Das gereinigte Binärbild erneut einlesen 
B_wiedergeladen = imread('Binaerbild_1_rein.png');

% 4. Histogramm plotten
figure;
histogram(B_wiedergeladen(:), 0:255, 'FaceColor', [0.3 0.3 0.3], ...
          'EdgeColor', 'none', 'Normalization', 'count');
xlim([-1 256]);
xlabel('Pixelwert');
ylabel('Anzahl Pixel');
title('Histogramm des Binärbilds (sollte nur bei 0 und 255 belegt sein)');
