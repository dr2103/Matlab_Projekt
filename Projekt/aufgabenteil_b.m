% Graubild laden
grauBild = imread('stuttgart_grau.png');

% Sicherstellen, dass es ein Graustufenbild ist
if size(grauBild, 3) == 3
    grauBild = rgb2gray(grauBild);
end

% Neues Bild mit nur geraden Grau-Werten erstellen
grauBild_gerade = bitand(grauBild, uint8(254));  % maskiert das niederwertigste Bit

% Histogramme vergleichen
figure;

subplot(2,1,1);
imhist(grauBild);
title('Histogramm des Original-Graubilds');

subplot(2,1,2);
imhist(grauBild_gerade);
title('Histogramm des Graubild\_gerade (nur gerade Grauwerte)');

% Anzeige beider Bilder nebeneinander
figure;
subplot(1,2,1);
imshow(grauBild);
title('Originalbild');

subplot(1,2,2);
imshow(grauBild_gerade);
title('Graubild mit nur geraden Werten');
