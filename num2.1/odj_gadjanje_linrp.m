function [ x,u,s ] = odj_gadjanje_linrp(T,g,a,b,A,B,c,n)
m=3;
y0=zeros(m,1);
[x,ya0]=odj_rk4v(@(x,y) T(x)*y+g(x),a,b,y0,n);
I=eye(m);
Y=zeros(m,m,n+1);
for i=1:m 
    y0=I(:,i);
    [x,Y(:,i,:)]=odj_rk4v(@(x,y) T(x)*y,a,b,y0,n);
end
s=-(A+B*Y(:,:,n+1))\(B*ya0(:,n+1)-c);
u=zeros(m,n+1);
for i=1:n+1
    u(:,i)=Y(:,:,i)*s+ya0(:,i);
end
end

