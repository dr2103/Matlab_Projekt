% ==========================
% Aufgabe e): Binärbilder 2 und 3 vorbereiten
% ==========================

% 1. Zielgröße bestimmen (z. B. von Farbbild)
I_farbbild = imread('stuttgart.jpg');      % oder 'stuttgart123.png'
zielgroesse = size(I_farbbild(:,:,1));     % nur Höhe und Breite

% --------------------------------------------------------
% 2. Binaerbild_2 aus "warning.png"
% --------------------------------------------------------
I_warn = imread('warning.png');            % Warnsymbol-Bild
if size(I_warn, 3) == 3                     % Falls RGB → Graubild
    I_warn_gray = rgb2gray(I_warn);
else
    I_warn_gray = I_warn;
end

BW2 = imbinarize(I_warn_gray);             % binär (logisch 0/1)
Binaerbild_2 = uint8(BW2) * 255;            % skaliert auf 0/255

% Auf Zielgröße anpassen
Binaerbild_2 = imresize(Binaerbild_2, zielgroesse, 'nearest');

% Speichern
imwrite(Binaerbild_2, 'Binaerbild_2.png');

% Histogramm anzeigen
figure;
histogram(Binaerbild_2(:), 0:255, 'FaceColor', [1 0.6 0], 'EdgeColor', 'none');
xlim([-1 256]);
title('Histogramm Binaerbild\_2 (warning.png)');
xlabel('Pixelwert'); ylabel('Anzahl Pixel');

% --------------------------------------------------------
% 3. Binaerbild_3 aus "QRCode.png"
% --------------------------------------------------------
I_qr = imread('QRCode.png');               % QR-Code-Bild
if size(I_qr, 3) == 3                       % Falls RGB → Graubild
    I_qr_gray = rgb2gray(I_qr);
else
    I_qr_gray = I_qr;
end

BW3 = imbinarize(I_qr_gray);               % binär (logisch)
Binaerbild_3 = uint8(BW3) * 255;           % skaliert auf 0/255

% Auf Zielgröße anpassen
Binaerbild_3 = imresize(Binaerbild_3, zielgroesse, 'nearest');

% Speichern
imwrite(Binaerbild_3, 'Binaerbild_3.png');

% Histogramm anzeigen
figure;
histogram(Binaerbild_3(:), 0:255, 'FaceColor', [0.2 0.4 1], 'EdgeColor', 'none');
xlim([-1 256]);
title('Histogramm Binaerbild\_3 (QRCode.png)');
xlabel('Pixelwert'); ylabel('Anzahl Pixel');

% --------------------------------------------------------
% 4. Ausgabe zur Kontrolle
% --------------------------------------------------------
disp('✅ Binaerbild_2.png und Binaerbild_3.png erfolgreich erstellt.');
disp(['→ Bildgröße: ', num2str(zielgroesse(1)), ' × ', num2str(zielgroesse(2))]);
