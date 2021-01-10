function [ x,y ] = odj_rk2( f,a,b,y0,n )
    h=(b-a)/n;
    x=zeros(n,1);
    y=x;
    x(1)=a;
    y(1)=y0;
    c2=1/4; 
    c3=27/40;
    a21=1/4; 
    a31=-189/800; 
    a32=729/800;
    w1=214/891;
    w2=1/33;
    w3=650/891;
    
    for i=1:n
        x(i+1)=a+h*i;
        k1=f(x(i),y(i));
        k2=f(x(i)+c2*h,y(i)+a21*k1*h);
        k3=f(x(i)+c3*h,y(i)+(a31*k1+a32*k2)*h);
        y(i+1)=y(i)+(w1*k1+w2*k2+w3*k3)*h;
    end
end

