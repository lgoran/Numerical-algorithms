function [x]=newton(f,df,x0)
k=0;
x=x0;
n=max(size(x));
while 1
    dk=df(x)\f(x);
    x0=x;
    x=x-dk;
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