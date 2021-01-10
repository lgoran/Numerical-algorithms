function [x,rez,k]=sor(a,b,x0,tol,maxit,w)
    x=x0;
    norma_b=norm(b);
    n=max(size(a));
    for k=1:maxit
        for i=1:n
            x(i) =(1-w)*x0(i)+ ( b(i) - ( a(i,1:n)*x(1:n) - a(i,i)*x(i) ) ) * w / a(i,i); 
        end
        x0=x;
        rez(k)=norm(b-(a*x))/norma_b;
        if(rez(k) < tol)
            break;
        end
    end