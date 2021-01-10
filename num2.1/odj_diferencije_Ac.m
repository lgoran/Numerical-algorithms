function [A,c]=odj_diferencije_Ac(q,g,a,b,alfa,beta,x)
n=max(size(x))-2;
h=(b-a)/(n+1);
qv=zeros(n,1);
c=zeros(n,1);
for i=1:n
    qv(i)=q(x(i+1));
    c(i)=g(x(i+1));
end

c(1)=c(1)+alfa/h/h;
c(n)=c(n)+beta/h/h;

A=2*eye(n)+diag(qv)*h*h-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);
A=A/h/h;
end