function [x,y,U]=pdjElipticka(ax,bx,ay,by,f,ro,n)
% -(u_xx + u_yy)=f
hx=(bx-ax)/(n+1);
hy=(by-ay)/(n+1);
x=(ax:hx:bx);
y=(ay:hy:by);

U=zeros(n+2);
F=zeros(n);

for i=1:n+2
    U(i,1)=feval(ro,x(i),ay);
    U(i,n+2)=feval(ro,x(i),by);
    U(1,i)=feval(ro,ax,y(i));
    U(n+2,i)=feval(ro,bx,y(i));
end

for i=1:n
    for j=1:n
        F(i,j)=hx*hy*feval(f,x(i+1),y(j+1));
    end
end
for i=1:n
    F(i,1)=F(i,1) + feval(ro,x(i+1),ay);
    F(i,n)=F(i,n) + feval(ro,x(i+1),by);
    F(1,i)=F(1,i) + feval(ro,ax,y(i+1));
    F(n,i)=F(n,i) + feval(ro,bx,y(i+1));
end

vecF=reshape(F,[n^2 1]);
T=delsq(numgrid('S',n+2));
u=T\vecF;
U(2:n+1,2:n+1)=reshape(u,[n n]);
end