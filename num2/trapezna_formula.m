function [ y ] = trapezna_formula( f,y0,h,n )
    y=zeros(n,1);
    t0=0;
    y(1)=y0+h/2*(f(t0,y0)+f(t0+h,y(1)));
    for i=1:n-1
        y(i+1)=y(i)+h*f(t0+h*i,y(i));
    end
end