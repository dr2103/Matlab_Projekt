% Aufgabenteil j)
% Testet die Funktion BVfkt_Farbbild_entpacken an dem selbst erzeugten
% ‚Farbbild_mit_Info.png‘ und vergleicht mit den Original-Binärbildern.

% 1. „Farbbild_mit_Info“ einlesen
Ib_info = imread('Farbbild_mit_Info.png');

% 2. Extraktion der drei Binärbilder
[B1_ex, B2_ex, B3_ex] = BVfkt_Farbbild_entpacken(Ib_info);

% 3. Anzeige der extrahierten Binärbilder
figure;
subplot(1,3,1); imshow(B1_ex); title('Extrahiertes Binärbild 1 (Rotkanal)');
subplot(1,3,2); imshow(B2_ex); title('Extrahiertes Binärbild 2 (Grünkanal)');
subplot(1,3,3); imshow(B3_ex); title('Extrahiertes Binärbild 3 (Blaukanal)');

% 4. Optionaler Direktvergleich mit den Original-Binärbildern
orig1 = imread('Binaerbild_1_rein.png');
orig2 = imread('Binaerbild_2.png');
orig3 = imread('Binaerbild_3.png');

figure;
subplot(3,2,1); imshow(orig1); title('Original Binaerbild\_1');
subplot(3,2,2); imshow(B1_ex); title('Extrahiert Binaerbild\_1');
subplot(3,2,3); imshow(orig2); title('Original Binaerbild\_2');
subplot(3,2,4); imshow(B2_ex); title('Extrahiert Binaerbild\_2');
subplot(3,2,5); imshow(orig3); title('Original Binaerbild\_3');
subplot(3,2,6); imshow(B3_ex); title('Extrahiert Binaerbild\_3');

% 5. Prüfen, ob jeweils exakt identisch
assert(all(all(orig1 == B1_ex)), 'Binaerbild_1 stimmt nicht überein!');
assert(all(all(orig2 == B2_ex)), 'Binaerbild_2 stimmt nicht überein!');
assert(all(all(orig3 == B3_ex)), 'Binaerbild_3 stimmt nicht überein!');
disp('Alle extrahierten Binärbilder stimmen mit den Originalen überein.');
