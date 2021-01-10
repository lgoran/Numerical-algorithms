function [ x,y ] = odj_impl_trapez( f,a,b,y0,n )
    y=zeros(n+1,1);
    x=y;
    x(1)=a;
    y(1)=y0;
    h=(b-a)/n;
    for i=1:n
        x(i+1)=a+h*i;
        w=sym('w');
        g=@(z)-z+y(i)+h/2*(f(x(i),y(i))+f(x(i+1),z));
        gs=g(w);
        dgs=diff(gs);
        dg=@(z) double(subs(dgs,z));
        y(i+1)=odj_newton(g,dg,y(i),5);      
    end
end

