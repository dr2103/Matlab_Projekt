% Aufgabenteil i)
% Funktion, die aus einem Farbbild (mit LSB-basiert versteckten Binärbildern in R, G, B)
% die drei Binärbilder extrahiert.

function [B1, B2, B3] = BVfkt_Farbbild_entpacken(I_mit_info)
    % Eingabe: I_mit_info  – M×N×3 uint8 Farbbild, in dem in jedem Farbkanal
    %                       (LSB) ein Binärbild versteckt wurde.
    % Ausgabe: B1, B2, B3  – M×N uint8 Binärbilder (0 oder 255).

    % 1. Größe prüfen
    if size(I_mit_info,3) ~= 3
        error('Eingabe muss ein Farbbild M×N×3 sein.');
    end

    % 2. Die drei Kanäle extrahieren
    R2 = I_mit_info(:,:,1);
    G2 = I_mit_info(:,:,2);
    B2 = I_mit_info(:,:,3);

    % 3. LSB auslesen (bitand(...,1)) → Werte 0 oder 1
    b1 = bitand(R2, 1);  % Rotkanal
    b2 = bitand(G2, 1);  % Grünkanal
    b3 = bitand(B2, 1);  % Blaukanal

    % 4. Auf 0/255 skalieren
    B1 = uint8(b1 * 255);
    B2 = uint8(b2 * 255);
    B3 = uint8(b3 * 255);
end
