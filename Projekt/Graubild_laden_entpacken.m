% Aufgabenteil d)
% Skript, das ein Graubild mit verstecktem Binärbild lädt und das Binärbild extrahiert.

% 1. Graubild mit eingebetteter Info laden
I_mit_info = imread('Graubild_mit_Info.png');

% 2. Extrahieren
B_neu = BVfkt_Graubild_entpacken(I_mit_info);

% 3. Anzeige des extrahierten Binärbilds
figure;
imshow(B_neu);
title('Extrahiertes Binärbild aus Graubild\_mit\_Info');

% 4. Optionaler Vergleich mit Original
orig = imread('Binaerbild_1_rein.png');
diff = orig - B_neu;
assert(all(diff(:) == 0), 'Die extrahierten Pixel weichen vom Original ab!');
