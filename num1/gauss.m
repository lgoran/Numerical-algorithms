function [x,rez,k]=gauss(a,b,x0,tol,maxit)
    x=x0;
    norma_b=norm(b);
    n=max(size(a));
    for k=1:maxit
        for i=1:n
            x(i) = ( b(i) - a(i,1:i-1)*x(1:i-1) - a(i,i+1:n)*x0(i+1:n)) / a(i,i); 
        end
        x0=x;
        rez(k)=norm(b-(a*x))/norma_b;
        if(rez(k) < tol)
            return;
        end
    end