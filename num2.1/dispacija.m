function [] = dispacija()
    ta=20; qc=10;
    b=[0,0,-ta,-ta,-ta,qc,0]';
    n=7;
    tol=1e-8;
    [x,flag,relres,iter,resvec] = gmres(@mdAx,b,7,tol);
    plot(resvec/norm(b));
    x
end

