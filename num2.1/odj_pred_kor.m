function [x,y] = odj_pred_kor(f,a,b,y0,n,m)
    h=(a+b)/n;
    x=zeros(n+1,1);
    y=zeros(n+1,1);
    x(1)=a;
    y(1)=y0;
    fun=zeros(4);
    fun(1)=f(x(1),y(1));
    %% prve 3
    [x1,y1]=odj_rk4(f,a,a+3*h,y0,3);
    for i=1:3
        x(i+1)=x(i)+h;
        y(i+1)=y1(i+1);
        fun(i+1)=f(x(i+1),y(i+1));
    end
    %% adams-bashfort-moulton
    for i=4:n
        x(i+1)=x(i)+h;
        y(i+1)=y(i)+h/24*(55*fun(4)-59*fun(3)+37*fun(2)-9*fun(1));%AB-prediktor
        fun_novi=f(x(i+1),y(i+1));
        for j=1:m
            y(i+1)=y(i)+h/24*(9*fun_novi+19*fun(4)-5*fun(3)+fun(2));%AM-korektor
            fun_novi=f(x(i+1),y(i+1));
        end
        for k=1:3
            fun(k)=fun(k+1);
        end
        fun(4)=f(x(i+1),y(i+1));
    end
    
end

