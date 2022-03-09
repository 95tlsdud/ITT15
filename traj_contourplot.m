n = 30;
for i = 1:1:n
    for j = 1:1:n
        a = grid_matrix(i,j);
        figure(22)
        if a == 1
            plot(x(i), y(j), 'r.','MarkerSize',15)
        elseif a == 0
            plot(x(i), y(j), 'k.','MarkerSize',15)
        hold on
        end

    end
end

plot(X_out(1), X_out(2), 'bx','MarkerSize',10,'LineWidth', 2)
hold off
xlabel('Phase shift of House 1'); ylabel('Phase shift of House 2');
    ylab = get(gca,'YLabel');
    set(ylab,'Rotation',0);
    set(gca,'XTick',[-pi 0 pi 2*pi]);
    set(gca,'XTickLabel',{'-\pi','0','\pi', '2\pi'});
    set(gca,'YTick',[-pi 0 pi 2*pi]);
    set(gca,'YTickLabel',{'-\pi','0','\pi', '2\pi'});
    set(ylab,'Rotation',90);
xlim([-pi-0.3, 2*pi+0.3]); ylim([-pi-0.3, 2*pi+0.3]);

hold on