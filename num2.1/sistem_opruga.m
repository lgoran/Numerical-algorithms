function [ ] = sistem_opruga()
    tol=1e-8;
    maxit=4;
    m=[2,5,3,6];
    k=[10,9,8,7,6,5,5,5];
    M=diag(m)
    Mw=sqrt(M);
    Mw=inv(Mw);
    K=[k(1)+k(2)+k(6),-k(2),-k(6),0;
        -k(2),k(2)+k(3)+k(8),-k(3),-k(8);
        -k(6),-k(3),k(3)+k(4)+k(6)+k(7),-k(4);
        0,-k(8),-k(4),k(4)+k(5)+k(8)];
    A=Mw*K*Mw;
    Apom=A-4*eye(4);
    u=[1;0;0;0];
    k=1;
    while 1
        u=minres(Apom,u,tol,maxit);
        u=u/norm(u);
        plot(u);
        axis([0.5 4.5 -1 1])
        xlabel('Indeks komponente');
        ylabel('Komponenta');
        title(['Aproksimacija svojstvenog vektora: iteracija ' sprintf('%d',k)]);
        grid on
        pause(0.5);
        rez(k)=norm(A*u-(u'*A*u)*u);
        rez(k)
        if(rez(k)<tol)
            break;
        end
        k=k+1;
    end
    figure(2)
    semilogy(rez);
end
    

