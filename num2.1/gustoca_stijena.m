function [  ] = gustoca_stijena( g )
    n=15;
    d=0.25;
    t=0:1/(n-1):1;
    k=zeros(n);
    for i=1:n
        for j=1:n
            k(i,j)=d/(d*d+(t(i)-t(j))^2)^(3/2);
        end
    end
    K=zeros(n);
    for i=1:n
        for j=1:n
            if j==1 || j==n
                K(i,j) = k(i,j)/2/( n - 1 );
            else
                K(i,j) = k(i,j)/(n-1);
            end
        end
    end
    [U,S,V]=svd(K);
    figure(1)
    plot(diag(S),'o');
    f=zeros(n,1);
    for i=1:n
        f(i)=sin(pi*t(i))+0.5*sin(2*pi*t(i));
    end
    for p=1:15
        figure(2)
        x=V(:,1:p)*(S(1:p,1:p)\(U(:,1:p)'*g));
        plot(t,x,t,f);
        pause(0.5);
    end
end

