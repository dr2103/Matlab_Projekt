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
