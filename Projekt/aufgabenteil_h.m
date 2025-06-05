% Histogrammvergleich: Original vs. Mit LSB-Info

% 1. Originalfarbbild laden und Kanäle extrahieren
I_orig = imread('stuttgart.jpg');
R_orig = I_orig(:,:,1);
G_orig = I_orig(:,:,2);
B_orig = I_orig(:,:,3);

% 2. Histogrammvergleich
figure('Name','Histogrammvergleich: Original vs. Mit Info', ...
       'Units','normalized','Position',[0.1 0.1 0.8 0.8]);

for k = 1:3
    subplot(3,1,k);
    switch k
        case 1
            histogram(R_orig(:), 0:255, 'EdgeColor','r', 'LineWidth', 1.2, 'DisplayStyle','stairs'); hold on;
            histogram(R_inf(:),  0:255, 'FaceColor','k', 'EdgeAlpha', 0.6); hold off;
            title('Rotkanal: Original vs. Mit Info');
        case 2
            histogram(G_orig(:), 0:255, 'EdgeColor','g', 'LineWidth', 1.2, 'DisplayStyle','stairs'); hold on;
            histogram(G_inf(:),  0:255, 'FaceColor','k', 'EdgeAlpha', 0.6); hold off;
            title('Grünkanal: Original vs. Mit Info');
        case 3
            histogram(B_orig(:), 0:255, 'EdgeColor','b', 'LineWidth', 1.2, 'DisplayStyle','stairs'); hold on;
            histogram(B_inf(:),  0:255, 'FaceColor','k', 'EdgeAlpha', 0.6); hold off;
            title('Blaukanal: Original vs. Mit Info');
    end
    xlim([-1 256]);
    xlabel('Intensität'); ylabel('Anzahl Pixel');
    legend('Original', 'Mit eingebetteter Info');
end

% 3. Bildvergleich: visuell
figure('Name','Bildvergleich Original vs. LSB-Modifiziert', ...
       'Units','normalized','Position',[0.1 0.1 0.6 0.5]);
subplot(1,2,1); imshow(I_orig);        title('Original Farbbild');
subplot(1,2,2); imshow(I_with_info);   title('Farbbild mit LSB-Info');
