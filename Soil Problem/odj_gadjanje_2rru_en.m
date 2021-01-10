function [ x,y,s0,k ] = odj_gadjanje_2rru_en( f,a,b,alfa,beta,s0,n,dfy,dfdy)
    y=zeros(4,n+1);
    k=0;
    fja=@(x,y) f_2rru_en(x,y,f,dfy,dfdy);
    while abs(y(1,n+1)-beta)>1e-6 && k<100
        y0=[alfa;s0;0;1];
        [x,y]=odj_rk4v(fja,a,b,y0,n);
        s0=s0-(y(1,n+1)-beta)/y(3,n+1);%newton
        k=k+1;
    end
    y=y(1,:);
end