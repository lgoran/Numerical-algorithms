function [ ] = test_odjrk23_and_odjrk2( )
    y0=0;
    a=0;
    b=4;
    tol=1e-5;
    [x,y]=odj_rk23(@test_odjrk23_fja,a,b,y0,tol);
    n=max(size(y));
    figure(1);
    plot(x,y,'b--*');
    xlabel('x');
    ylabel('y');
    hold on
    fplot(@test_odjrk23_prava_fja,[0 4],'r-');
    legend('aprox rj','egzaktno rj');
    fun=zeros(n,1);
    for i=1:n
        fun(i)=test_odjrk23_prava_fja(x(i));
    end
    fun=fun';
    max(abs(y-fun))
    %% runge kutta
    [x,y]=odj_rk2(@test_odjrk23_fja,a,b,y0,n-1);
    n=max(size(y));
    func=zeros(n,1);
    for i=1:n
        func(i)=test_odjrk23_prava_fja(x(i));
    end
    figure(2);
    plot(x,y,'b--*');
    xlabel('x');
    ylabel('y');
    hold on
    fplot(@test_odjrk23_prava_fja,[0 4],'r-');
    legend('aprox rj','egzaktno rj');
    max(abs(y-func))
end

