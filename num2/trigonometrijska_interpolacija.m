function []=trigonometrijska_interpolacija()
    f = @(x) sin(2*x) + cos(6*x) + 2*sin(8*x);
    xmin=0;
    xmax=2*pi;
    L=xmax-xmin;
    n=9;
    dx=(xmax-xmin)/n;
    x=xmin:dx:xmax;
    y=f(x);   
    n=length(x)-1;
    yy=y(1:n)';
    N=n;
    mN=floor(N/2);
    c=fft(yy,N);
    
    if N==2*mN
        a(1:mN) = 2* real(c(1:mN))/N;
        a(mN+1)= real(c(mN+1))/N;
        b(2:mN)=-2*imag(c(2:mN))/N;
        b(mN+1)=0;
    else
        a(1:mN+1)=2*real(c(1:mN+1))/N;
        b(2:mN+1)=-2*imag(c(2:mN+1))/N;
    end
        
    dx1=L/1000;
    xInt=(xmin:dx1:xmax)';
    yInt=0.5*a(1)*ones(length(xInt),1);
    yInt0=0.5*a(1)*ones(length(x),1);
    
    for j=1:mN
        yInt=yInt+a(1+j)*cos(2*pi*j*xInt/L)+b(1+j)*sin(2*pi*j*xInt/L);
        yInt0=yInt0+a(1+j)*cos(2*pi*j*x'/L)+b(1+j)*sin(2*pi*j*x'/L);
    end
    yEx=f(xInt);
    figure(1);
    plot(x,y,'ro',xInt,yInt,'b-',x,yInt0,'mx',xInt,yEx,'k');
    test=[y' yInt0 (y'-yInt0)./y']
end