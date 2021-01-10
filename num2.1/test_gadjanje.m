function [  ] = test_gadjanje(  )
    a=0;
    b=1;
    alfa=4;
    beta=1;
    s0=-20;
    n=100;
    [x,y,s,iter]=odj_gadjanje_2rru(@f_2rru,a,b,alfa,beta,s0,n);
    s
    iter
    figure(1)
    plot(x,y(1,:));
    hold on;
    f=@(x,y) 3/2*y(1)*y(1);
    dfy = @(x,y) 3*y(1);
    dfdy =@(x,y) 0;
    [x,y,s_en,iter_en]=odj_gadjanje_2rru_en(f,a,b,alfa,beta,s0,n,dfy,dfdy);
    s_en
    iter_en
    plot(x,y(1,:));
    while iter == iter_en && s0>-100
        s0=s0-0.1;
        [x,y,s,iter]=odj_gadjanje_2rru(@f_2rru,a,b,alfa,beta,s0,n);  
        [x,y,s_en,iter_en]=odj_gadjanje_2rru_en(f,a,b,alfa,beta,s0,n,dfy,dfdy);
    end
    'Za ovaj s0 se razlikuju'
    s0
    s
    iter
    iter_en
end

