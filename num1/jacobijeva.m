function [x,rez,k]=jacobijeva(a,b,x0,tol,maxit)
    %x rezultat,rez reziduali,k broj iteracija
    x=x0;
    norma_b=norm(b);
    n=max(size(a));
    for k=1:maxit
        for i=1:n
            x(i) = ( b(i) - ( a(i,1:n)*x0(1:n) - a(i,i)*x0(i) ) ) / a(i,i); 
        end
        x0=x;
        rez(k)=norm(b-(a*x))/norma_b;
        if(rez(k) < tol)            
            break;
        end
    end