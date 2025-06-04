% Aufgabenteil d)
% Funktion, die aus einem Graubild (mit LSB-basiert verstecktem Binärbild) das Binärbild extrahiert.

function B_extrahiert = BVfkt_Graubild_entpacken(I_graubild_mit_info)

    % 1. LSB (Bit0) jedes Pixels auslesen
    bit_lsb = bitand(I_graubild_mit_info, 1);  % 0 oder 1

    % 2. In 0/255 umwandeln
    B_extrahiert = uint8(bit_lsb * 255);
end
