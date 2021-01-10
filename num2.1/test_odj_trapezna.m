function [  ] = test_odj_trapezna(  )
    y0=1;
    a=0;
    b=1;
    n=20;
    f=@(x,y) -100.*(y-cos(x))-sin(x);
    pravaf=@(x) cos(x);
    for i=1:4
        [x,y]=odj_impl_trapez(f,a,b,y0,n);
        figure(i);
        plot(x,y,'r');
        xlabel('x');
        ylabel('y');
        hold on
        fplot(@(x) cos(x),[0 1],'b');
        hold on
        
        fun=zeros(n+1,1);
        for i=1:n+1
            fun(i)=pravaf(x(i));
        end
        max(abs(y-fun))
        %% runge kutta
        [x,y]=odj_rk2(f,a,b,y0,n);
        plot(x,y,'g');
        legend('implicitna trapezna','cos(x)','rk2');
        max(abs(y-fun))
        n=n+10;
        
    end
end

