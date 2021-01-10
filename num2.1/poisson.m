function [] = poisson()
    tol=1e-8;
    h=0.05;
    A=gallery('poisson',19);
    f=zeros(19*19,1);
    f(181)=h*h*10000;
    M=ichol(A);
    I=eye(361);
    u0=zeros(361,1);
    [u,flag,relres,iter,resvec]=pcg(A,f,tol,1000,M,M',u0);
    [u2,flag2,relres2,iter2,resvec2]=pcg(A,f,tol,1000,[],[],u0);
    resvec=resvec/norm(f);
    resvec2=resvec2/norm(f);
    semilogy(1:size(resvec),resvec,'r',1:size(resvec2),resvec2,'b')
    x=0:0.05:1;
    y=x;
    Z=zeros(21);
    for i=2:20
        for j=2:20
            Z(i,j)=u((i-2)*19+ j-1);
        end
    end
    %surf(x,y,Z)
end