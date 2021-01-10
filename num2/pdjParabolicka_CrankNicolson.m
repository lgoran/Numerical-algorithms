function [t,x,u]=pdjParabolicka_CrankNicolson(k,T,xL,xD,ro0,ro1,g,n,m)
%u_t=k*u_xx
dx=(xD-xL)/n;
dt=T/m;
c=k*dt/dx/dx;
t=(0:dt:T)';
x=(xL:dx:xD)';
u=zeros(n+1,m+1);


for i=1:n+1
    u(i,1)=feval(g,x(i));
end
for j=1:m+1
    u(1,j)=feval(ro0,t(j));
    u(n+1,j)=feval(ro1,t(j));
end
A=diag((2*(1+c)).*ones(n-1,1))-diag(c.*ones(n-2,1),-1)-diag(c.*ones(n-2,1),1);
for j=1:m
    b=c.*u(3:n+1,j) + (2*(1-c)).*u(2:n,j)+ c.*u(1:n-1,j);
    b(1)=b(1)+ c*u(1,j+1);
    b(n-1)=b(n-1) + c*u(n+1,j+1);
    u(2:n,j+1)=A\b;
end
end