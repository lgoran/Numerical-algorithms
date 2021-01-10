function [ x,y,s,k ] = odj_gadjanje_2rru( f,a,b,alfa,beta,s0,n )
    y=zeros(1,n+1);
    k=0;
    while abs(y(1,n+1)-beta)>1e-6 && k<100
        y0=[alfa;s0];
        [~,yy]=odj_rk4v(f,a,b,y0,n); 
        F=yy(1,n+1)-beta;
        malis=sqrt(eps)*s0;
        [x,y]=odj_rk4v(f,a,b,[alfa;s0+malis],n);
        dF=(y(1,n+1)-yy(1,n+1))/malis;
        s0=s0-F/dF;
        k=k+1;
    end
    s=s0;
end

