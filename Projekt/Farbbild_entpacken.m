% Aufgabenteil k)
% Liest das in der Aufgabenstellung bereitgestellte Farbfoto „stuttgart123.png“
% ein und extrahiert die drei dort versteckten Binärbilder.

% 1. „stuttgart123.png“ einlesen
I_st123 = imread('stuttgart123.png');

% 2. Anzeige des Farbbilds
figure;
imshow(I_st123);
title('Original Farbbild „stuttgart123.png“');

% 3. Extrahieren der drei versteckten Binärbilder
[B1_s, B2_s, B3_s] = BVfkt_Farbbild_entpacken(I_st123);

% 4. Darstellung der extrahierten Binärbilder nebeneinander
figure('Name','Extraktion aus Farbbild','Units','normalized','Position',[0.1 0.1 0.8 0.8]);
subplot(2,2,1); imshow(B1_s); title('Extrahiert Binaerbild 1 aus stuttgart123');
subplot(2,2,2); imshow(B2_s); title('Extrahiert Binaerbild 2 aus stuttgart123');
subplot(2,2,3); imshow(B3_s); title('Extrahiert Binaerbild 3 aus stuttgart123');

% 5. Speichern der extrahierten Binärbilder
imwrite(B1_s, 'stuttgart123_Binaer1.png');
imwrite(B2_s, 'stuttgart123_Binaer2.png');
imwrite(B3_s, 'stuttgart123_Binaer3.png');
