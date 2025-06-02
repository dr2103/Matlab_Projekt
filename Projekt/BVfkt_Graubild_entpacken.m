% Aufgabenteil d)
% Funktion, die aus einem Graubild (mit LSB-basiert verstecktem Binärbild) das Binärbild extrahiert.

function B_extrahiert = BVfkt_Graubild_entpacken(I_graubild_mit_info)
    % Eingabe: I_graubild_mit_info  – 2D uint8-Graustufenbild mit eingebettetem Binärbild (LSB)
    % Ausgabe: B_extrahiert         – 2D uint8-Binärbild (0 oder 255)

    % 1. Typ prüfen
    if ~isa(I_graubild_mit_info, 'uint8')
        error('Eingabe muss uint8 sein.');
    end

    % 2. LSB (Bit0) jedes Pixels auslesen
    bit_lsb = bitand(I_graubild_mit_info, 1);  % 0 oder 1

    % 3. In 0/255 umwandeln
    B_extrahiert = uint8(bit_lsb * 255);
end
