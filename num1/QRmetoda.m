function [ Q ] = QRmetoda( A,tol )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[Q,R]=qr(A);
A=R*Q;
k=1;
while 1
    Qstari=Q;
    [Q,R]=qr(A);
    A=R*Q;
    if(norm(Q-Qstari)<tol)
        k
        return;
    end
    k=k+1;
end

end

