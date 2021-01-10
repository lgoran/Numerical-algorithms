function [  ] = meh_sustav_test( )
    a=0;
    b=1.5;
    tol=1e-5;
    y0=[0;0];
    [x,y]=odj_rk23v(@meh_sustav_funkcija,a,b,y0,tol);
    subplot(2,1,1);
    plot(x,y(1,:),'r--*');
    title('Graf položaja');
    xlabel('Vrijeme');
    ylabel('Položaj');
    %max(y(1))
    subplot(2,1,2);
    plot(x,y(2,:),'b--o');
    title('Graf brzine');
    xlabel('Vrijeme');
    ylabel('Brzina');
end

