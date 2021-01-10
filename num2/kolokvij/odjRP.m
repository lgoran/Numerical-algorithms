function [t,u]=odjRP(a,b,alfa,beta,c1,c0,f,n)

h=(b-a)/(n+1);
t=a+(0:h:b-a)';

fv=zeros(n,1);
c0v=zeros(n,1);
c1v=zeros(n,1);

for i=2:n+1
    c0v(i-1)=feval(c0,t(i));
    c1v(i-1)=feval(c1,t(i));
    fv(i-1)=(2*h^2).*feval(f,t(i));
end

fv(1)=fv(1)-(2-h*c1v(1))*alfa;
fv(n)=fv(n)-(2+h*c1v(n))*beta;
A=-4*eye(n) + 2*h^2*diag(c0v) + 2*diag(ones(n-1,1),1) + h*diag(c1v(1:n-1),1) + 2*diag(ones(n-1,1),-1) - h*diag(c1v(2:n),-1);

u=A\fv;
u=[alfa;u;beta];
end