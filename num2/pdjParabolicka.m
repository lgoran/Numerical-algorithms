function [t,x,u]=pdjParabolicka(k,T,xL,xD,ro0,ro1,g,n,m)
%u_t=k*u_xx
dx=(xD-xL)/n;
dt=T/m;
c=k*dt/dx/dx;
c1=1-2*c;
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
for j=1:m
    for i=2:n
    u(i,j+1)=c*u(i+1,j) + c1*u(i,j) + c*u(i-1,j);
    end
end
end