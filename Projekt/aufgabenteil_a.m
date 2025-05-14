% Bild einlesen
binBild = imread('Binaerbild_1.png');  % oder .bmp/.jpg je nach Datei

% Falls RGB, in Graustufenbild umwandeln
if size(binBild, 3) == 3
    binBild = rgb2gray(binBild);
end

% Histogramm erzeugen
figure;
imhist(binBild);
title('Grauwerthistogramm des Binärbildes');

% Überprüfung: Einzigartige Werte im Bild anzeigen
einzigartigeWerte = unique(binBild);
disp('Im Bild vorhandene Pixelwerte:');
disp(einzigartigeWerte);

