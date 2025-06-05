% Vergleiche die Farbkanäle (R, G, B) vor dem Einbetten (nur gerade Werte) mit denen nach dem Einbetten (einzelne +1-Werte wegen Binärbilder)

figure('Name','Histogrammvergleich: Gerade vs. Mit Info','Units','normalized','Position',[0.1 0.1 0.8 0.8]);

for k = 1:3
    subplot(3,1,k);
    switch k
        case 1
            % Rotkanal
            histogram(R_even(:), 0:255, 'EdgeColor','r', 'LineWidth', 1.2, 'DisplayStyle','stairs'); hold on;
            histogram(R_inf(:),  0:255, 'FaceColor','k', 'EdgeAlpha', 0.6); hold off;
            title('Rotkanal: Gerade vs. mit Binär-Info');
        case 2
            histogram(G_even(:), 0:255, 'EdgeColor','g', 'LineWidth', 1.2, 'DisplayStyle','stairs'); hold on;
            histogram(G_inf(:),  0:255, 'FaceColor','k', 'EdgeAlpha', 0.6); hold off;
            title('Grünkanal: Gerade vs. mit Binär-Info');
        case 3
            histogram(B_even(:), 0:255, 'EdgeColor','b', 'LineWidth', 1.2, 'DisplayStyle','stairs'); hold on;
            histogram(B_inf(:),  0:255, 'FaceColor','k', 'EdgeAlpha', 0.6); hold off;
            title('Blaukanal: Gerade vs. mit Binär-Info');
    end
    xlim([-1 256]);
    xlabel('Intensität'); ylabel('Anzahl Pixel');
    legend('Nur gerade Werte', 'Mit LSB-Binärbild');
end
