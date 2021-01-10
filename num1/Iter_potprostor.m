function [Y] = Iter_potprostor(A,X0,tol)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[Y,R]=qr(X0);
k=0;
while 1
    Y_stari=Y;
    X=A*Y;
    [Y,R]=qr(X);
    if(abs(norm(Y-Y_stari))<tol)
        k
        return;
    end
    k=k+1;
end

end

