function [x]=mod_newton(f,df,x0)
k=0;
h=@(x) norm(f(x))^2;
hk=@(tau,x,dk) h(x-tau.*dk);
dh=@(x,f,df) 2*f(x)'*df(x);
x=x0;
n=max(size(x));
while 1
    dk=df(x)\f(x);
    k2=1;
    gama=inv(k2*df(x));
    j=0;
    while 1
        if hk(2^(-j),x,dk)<=hk(0,x,dk)-2^(-j-2)*norm(dk)*norm(dh(x,f,df))*gama
            break;
        end
        j=j+1;
    end
    min=hk(1,x,dk);
    mini=0;
    for i=1:j
        if hk(2^(-i),x,dk)<min
            min=hk(2^(-i),x,dk);
            mini=i;
        end
    end
    lambda=2^(-mini);
    if lambda<0.01
        lambda=0.01;
    end
    x0=x;
    x=x-lambda*dk;
    k=k+1;
    flag=0;
    for i=1:n
        if abs(x(i)-x0(i))>abs(x0(i))*eps
            flag=1;
            break;
        end
    end
    if flag==0
        break;
    end
end
k
end