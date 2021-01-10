function [x,rez,k] = sor(A,b,x0,tol,maxit,w)
n=max(size(A));
normab=norm(b);
x=x0;
rez(1)=norm(b-A*x)/normab;
for k=1:maxit
    for i=1:n
        x(i)=(1-w)*x(i)+(b(i)-A(i,1:n)*x(1:n)+ A(i,i)*x(i))*w/A(i,i);
    end
    rez(k+1)=norm(b-A*x)/normab;
    if(rez(k+1)<tol)
        return;
    end
end