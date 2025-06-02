% Datei: embedding_graubild.m
% Betetet das Binärbild B_rein in das gerade Graubild I_gerade ein, indem es +1 addiert,
% wo B_rein == 255.

% 1. Vorannahme: 'Binaerbild_1_rein.png' existiert (nur Werte 0/255)
B_rein = imread('Binaerbild_1_rein.png');

% 2. Graubild mit nur geraden Werten (aus Teil b) laden
I_gerade = imread('Graubild_gerade.png');

B_rein = imresize(B_rein, size(I_gerade), 'nearest');

disp(['Größe B_rein:    ', mat2str(size(B_rein))]);
disp(['Größe I_gerade:  ', mat2str(size(I_gerade))]);

% 3. Dimensionen prüfen
assert(all(size(B_rein) == size(I_gerade)), ...
       'Binärbild und Graubild müssen die gleiche Größe haben.');

% 4. Neue Kopie anlegen und bei weißen Binärpixeln +1 addieren
I_mit_info = I_gerade;
mask_weiss = (B_rein == 255);
I_mit_info(mask_weiss) = I_gerade(mask_weiss) + 1;

% 5. Ergebnis abspeichern
imwrite(I_mit_info, 'Graubild_mit_Info.png');

% 6. Histogramm: Gerade vs. mit Info
figure;
hold on;
histogram(I_gerade(:), 0:255, 'FaceColor', [0.0 0.5 0.0], ...
          'EdgeColor', 'none', 'Normalization', 'probability');
histogram(I_mit_info(:), 0:255, 'FaceColor', [0.8 0.1 0.1], ...
          'EdgeColor', 'none', 'Normalization', 'probability');
hold off;
xlim([-1 256]);
xlabel('Grauwert');
ylabel('Relative Häufigkeit');
title('Histogramm: Gerade-Graubild vs. Graubild mit Binär-Info');
legend('Gerade-Graubild', 'Mit Binär-Info');

% 7. Visueller Vergleich
figure;
subplot(1,2,1); imshow(I_gerade); title('Graubild\_gerade');
subplot(1,2,2); imshow(I_mit_info); title('Graubild\_mit\_Info');
