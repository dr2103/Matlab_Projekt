% Liest ein Graubild ein und rundet alle Grauwerte auf den nächstniedrigeren geraden Wert.

% 1. Originales Graubild einlesen
I_orig = imread('stuttgart_grau.png');  

% 2. Alle Pixel auf den nächstniedrigeren geraden Wert runden
I_gerade = uint8(floor(double(I_orig) / 2) * 2);
imwrite(I_gerade, 'Graubild_gerade.png');

% 3. Histogramm: Original vs. gerade-Version
figure;
hold on;
histogram(I_orig(:), 0:255, 'FaceColor', [0.5 0.5 0.5], ...
          'EdgeColor', 'none', 'Normalization', 'probability');
histogram(I_gerade(:), 0:255, 'FaceColor', [0.0 0.7 0.0], ...
          'EdgeColor', 'none', 'Normalization', 'probability');
hold off;
xlim([-1 256]);
xlabel('Grauwert');
ylabel('Relative Häufigkeit');
title('Histogramm: Original vs. Gerade-Graubild');
legend('Original', 'Nur gerade Grauwerte');

% 4. Visueller Vergleich beider Bilder
figure;
subplot(1,2,1); imshow(I_orig);
title('Original „stuttgart\_grau.png“');
subplot(1,2,2); imshow(I_gerade);
title('Graubild nur gerade Grauwerte');
