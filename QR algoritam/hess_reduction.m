function [H] = hess_reduction(A)
n=max(size(A));
for k=1:n-2
    [v,b]=house(A(k+1:n,k));
    I=diag(ones(size(v)));
    p=I-b*v*v';
    A(k+1:n, k:n)=p*A(k+1:n, k:n);
    A(1:n,k+1:n)=A(1:n,k+1:n)*p;
end
H=A;
end