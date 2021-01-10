function [  ] = test_odjEuler_and_odjrk4( )
    y0=1;
    a=0;
    b=3;
    n=30;
    f=@(x,y) -y-5*exp(-x)*sin(5*x);
    [x,y]=odj_euler(f,a,b,y0,n);
    figure(1);
    plot(x,y,'b--*');
    xlabel('x');
    ylabel('y');
    hold on
    fplot(@(x)exp(-x).*cos(5.*x),[0 3],'r-');
    legend('aprox rj','egzaktno rj');
    fun=zeros(n+1,1);
    for i=1:n+1
        fun(i)=exp(-(a+b*(i-1)/n))*cos(5*(a+b*(i-1)/n));
    end
    max(abs(y-fun))
    %% runge kutta
    [x,y]=odj_rk4(f,a,b,y0,n);
    figure(2);
    plot(x,y,'b--*');
    xlabel('x');
    ylabel('y');
    hold on
    fplot(@(x)exp(-x).*cos(5.*x),[0 3],'r-');
    legend('aprox rj','egzaktno rj');
    max(abs(y-fun))
end

