function [ ] = kredit_raz(A,n)
    u=[1;0;0;0;0;0;0;0];
    for k=1:n
        u=A*u;
        u=u/norm(u);
        plot(1:8,u);
        axis([0.5 8.5 0 1])
        xlabel('Stanje');
        ylabel('Gustoca');
        title(['Iteracija broj ' sprintf('%d',k)]);
        set(gca,'XTick',1:8);
        set(gca,'XTickLabel', { 'AAA', 'AA', 'A','BBB', 'BB', 'B', 'CCC', 'D'});
        grid on
        pause(0.2);
    end
    eig(A)
end

