function []=Diskreditacija(n,alfa,beta)
    x0=zeros(1,n);
    tol=1e-3;
    maxit=1000;
    Tn=2*eye(n)-diag(ones(1,n-1),1)-diag(ones(1,n-1),-1);
    F=zeros(1,n);
    h=1/(n+1);
    F(1)=16*pi*pi*sin(4*pi*h)+alfa/h/h;
    for i=2:n-1
        F(i)=16*pi*pi*sin(4*pi*i*h);
    end
    F(n)=16*pi*pi*sin(4*pi*n*h)+beta/h/h;
    [rj,rez,k]=jacobijeva(Tn,h*h*F,x0,tol,maxit);
    
    konacni=zeros(1,n+2);
    for i=2:n+1
        konacni(i)=rj(i-1);
    end
    
    X=0:0.001:1;
    subplot(2,1,1);
    plot(linspace(0,1,n+2),konacni);
    subplot(2,1,2);
    plot(X,sin(4*pi*X));