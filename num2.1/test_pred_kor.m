function [] = test_pred_kor()
    
    y0=1;
    a=0;
    b=3;
    n=300;
    m=3;
    f=@(x,y) -y-5.*exp(-x).*sin(5.*x);
    pravaf=@(x) exp(-x).*cos(5.*x);
    [x,y]=odj_pred_kor(f,a,b,y0,n,m);
    figure(1);
    plot(x,y,'b-*');
    xlabel('x');
    ylabel('y');
    hold on
    fplot(pravaf,[0 3],'r');        
    fun=zeros(n+1,1);
    for i=1:n+1
        fun(i)=pravaf(x(i));
    end
    max(abs(y-fun))

end

