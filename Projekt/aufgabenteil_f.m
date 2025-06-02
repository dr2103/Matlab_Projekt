% Datei: embedding_farbbild.m
% Liest ein Farbbild, „evenisiert“ die Farbkanäle (nur gerade Werte), hinterlegt
% je ein Binärbild in R, G, B (LSB), und speichert das Ergebnis.

% 1. Originales Farbbild laden
I_color = imread('stuttgart.jpg');  % z.B. 512×512×3

% 2. Farbkanäle extrahieren
R = I_color(:,:,1);
G = I_color(:,:,2);
B = I_color(:,:,3);

% 3. „Evenisieren“: Alle Kanäle auf gerade Werte runden
R_even = uint8(floor(double(R) / 2) * 2);
G_even = uint8(floor(double(G) / 2) * 2);
B_even = uint8(floor(double(B) / 2) * 2);

% 4. Histogramm vor dem Einbetten (nur gerade Werte sichtbar)
figure;
hold on;
histogram(R_even(:), 0:255, 'FaceColor','r','EdgeColor','none','Normalization','probability');
histogram(G_even(:), 0:255, 'FaceColor','g','EdgeColor','none','Normalization','probability');
histogram(B_even(:), 0:255, 'FaceColor','b','EdgeColor','none','Normalization','probability');
hold off;
xlim([-1 256]);
xlabel('Intensität'); ylabel('Rel. Häufigkeit');
title('Histogramme von R_{even}, G_{even}, B_{even} (nur gerade Werte)');
legend('R-even','G-even','B-even');

% 5. Drei Binärbilder laden (Größe muss zu I_color passen)
BW1 = imread('Binaerbild_1_rein.png');
BW2 = imread('Binaerbild_2.png');
BW3 = imread('Binaerbild_3.png');
BW1 = imresize(BW1, size(R), 'nearest');
assert(all(size(BW1) == size(R)), 'Binaerbild_1 passt nicht zur Farbbild-Größe.');
assert(all(size(BW2) == size(R)), 'Binaerbild_2 passt nicht zur Farbbild-Größe.');
assert(all(size(BW3) == size(R)), 'Binaerbild_3 passt nicht zur Farbbild-Größe.');

% 6. Logische Masken: 1 dort, wo Binärbild weiß (255) ist
mask1 = (BW1 == 255);
mask2 = (BW2 == 255);
mask3 = (BW3 == 255);

% 7. Binärbilder in die LSBs einbetten: +1 bei allen maskierten Positionen
R_inf = R_even; R_inf(mask1) = R_even(mask1) + 1;
G_inf = G_even; G_inf(mask2) = G_even(mask2) + 1;
B_inf = B_even; B_inf(mask3) = B_even(mask3) + 1;

% 8. Neues Farbbild mit eingebetteten Infos erstellen
I_with_info = cat(3, R_inf, G_inf, B_inf);
imwrite(I_with_info, 'Farbbild_mit_Info.png');

% 9. Histogramm nach dem Einbetten
figure;
hold on;
histogram(R_inf(:), 0:255, 'FaceColor','r','EdgeColor','none','Normalization','probability');
histogram(G_inf(:), 0:255, 'FaceColor','g','EdgeColor','none','Normalization','probability');
histogram(B_inf(:), 0:255, 'FaceColor','b','EdgeColor','none','Normalization','probability');
hold off;
xlim([-1 256]);
xlabel('Intensität'); ylabel('Rel. Häufigkeit');
title('Histogramme von R_{inf}, G_{inf}, B_{inf} (nach Einbetten)');
legend('R\_mit\_Info','G\_mit\_Info','B\_mit\_Info');

% 10. Visueller Vergleich: Original vs. mit Info
figure;
subplot(1,2,1); imshow(I_color); title('Original „stuttgart.png“');
subplot(1,2,2); imshow(I_with_info); title('Farbbild\_mit\_Info');
