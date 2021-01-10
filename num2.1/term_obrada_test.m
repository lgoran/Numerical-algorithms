function [ ] = term_obrada_test()
    
    
    tol=1e-3;
    a=0;
    b=210;
    n=50;
    y0=21+273.15;
    [x,y]=odj_rk23(@term_obrada_fja_f,a,b,y0,tol);
    y=y-273.15;
    figure(1)
    plot(x,y,'b-o');
    hold on;
    xlabel('Vrijeme(s)');
    ylabel('Temperatura(K)');
    [x,y]=odj_rk4(@term_obrada_fja_f,a,b,y0,n);
    y=y-273.15;
    plot(x,y,'r-x');
    hold on;
    [x,y]=odj_rk4(@term_obrada_fja_f,a,b,y0,n*2);
    y=y-273.15;
    plot(x,y,'g-');
    legend('rk23','rk4','rk4 h/2');
    
    
    
end

