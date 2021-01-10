function [ ] = grab_plijen_test()
    tol=1e-9;
    a=0;
    b=30;
    n=300;
    y0=[5000;100];
    [x,y]=odj_rk23v(@grab_plijen_funkcija,a,b,y0,tol);
    [x1,y1]=odj_rk4v(@grab_plijen_funkcija,a,b,y0,n);
    subplot(2,1,1)
    plot(x,y(1,:),'r-x');
    xlabel('Vrijeme(s)');
    ylabel('Plijen');
    hold on;
    plot(x1,y1(1,:),'b-o');
    hold off;
    subplot(2,1,2);
    plot(x,y(2,:),'r-x');
    xlabel('Vrijeme(s)');
    ylabel('Grabežljivci');
    hold on;
    plot(x1,y1(2,:),'b-o');
    hold off;
end

