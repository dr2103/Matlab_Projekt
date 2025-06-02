% Datei: pruefe_binaerbild.m
% Prüft, ob ein gegebenes Binärbild nur Werte 0 und 255 enthält, und zeigt ein Histogramm.

% 1. Binärbild einlesen
B = imread('Binaerbild_1.png');  % ersetze ggf. durch deinen Dateinamen

% 2. (Optional) Rein binär schwellwerten, falls Werte ≠ {0,255} enthalten
BW = imbinarize(B);         % führt Schwellwertung (logisch) durch
B_rein = uint8(BW) * 255;   % skaliert logisches Bild auf 0/255
imwrite(B_rein, 'Binaerbild_1_rein.png');

% 3. Das gereinigte Binärbild erneut einlesen (zeigt, dass nach Speichern nur 0 und 255 vorhanden sind)
B_wiedergeladen = imread('Binaerbild_1_rein.png');

% 4. Histogramm plotten
figure;
histogram(B_wiedergeladen(:), 0:255, 'FaceColor', [0.3 0.3 0.3], ...
          'EdgeColor', 'none', 'Normalization', 'count');
xlim([-1 256]);
xlabel('Pixelwert');
ylabel('Anzahl Pixel');
title('Histogramm des Binärbilds (sollte nur bei 0 und 255 belegt sein)');
