function [ro] = sor_konv( A )
n=max(size(A));
omega=zeros(201,1);
ro=zeros(201,1);
D=diag(diag(A));
U=triu(A,1);
L=tril(A,-1);

for i=0:200
    w=0.01*i;
    Tsor=inv(D+w*L)*((1-w)*D-w*U);
    omega(i+1)=w;
    ro(i+1)=max(abs(eig(Tsor)));   
end
plot(omega,ro);
