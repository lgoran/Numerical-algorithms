function [ H ] = hess2( A )
n=size(A,1);
for i=1:n-2
    x=A(i+1:n,j);
    x1=-sign(A(i+1,j)*norm(x);
    u=zeros(n-i,1);
    u(1)=sqrt((x1-x(1))/(2*x1));
    for j=2:n-i
        u(j)=x(j)/(-2*u(1)*x1);
    end
    
    H=eye(n);
    H(i+1:n,i+1:n)=H(i+1:n,i+1:n)-2*norm(u);
    A=H'*A*H;
end
H=A;
end

