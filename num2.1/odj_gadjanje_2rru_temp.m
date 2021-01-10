function [ x,y,s,k ] = odj_gadjanje_2rru_temp( f,a,b,s0,n )
    y=zeros(1,n+1);
    k=0;
    while (abs(y(1,n+1))>1e-6 || k==0) && k<100
        y0=[s0;0;s0];
        [~,yy]=odj_rk4v(f,a,b,y0,n);
        malis=sqrt(eps)*s0;
        [x,y]=odj_rk4v(f,a,b,[s0+malis;0;s0+malis],n);
        F=y(1,n+1);
        dF=(y(1,n+1)-yy(1,n+1))/malis;
        s0=s0-F/dF;
        k=k+1;
    end
    s=s0;
end