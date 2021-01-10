function [ x ] = odj_newton( f,df,x0,k )
    tol=1e-5;
    epsilon=1e-10;
    for i=1:k
        y=f(x0);
        dy=df(x0);
        if abs(dy)<epsilon
            break
        end
        x=x0-y/dy;
        if abs(x-x0)<=tol
            i
            break;
        end
        x0=x;
    end
end

