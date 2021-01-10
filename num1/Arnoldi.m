function [Q,H,l]= Arnoldi(A,b,maxit,tol)
n=size(b);
Q = zeros(n);
H = zeros(n);
Q(:,1)=b/norm(b);
for i=1:maxit
    v=A*Q(:,i);
    for j=1:i
        H(j,i)=Q(:,j)'*v;
        v=v-Q(:,j)*H(j,i);
    end
    H(i+1,i)=norm(v);
    if(H(i+1,i)< tol)
        l=i;
        return
    end
    Q(:,i+1)=v/H(i+1,i);
end
l=maxit;