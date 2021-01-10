function [y] = Potencije( A,x0,tol)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y=x0/norm(x0);
k=0;
while 1
    y_stari=y;
    y=A*y_stari;
    y=y/norm(y);
    if(norm(y-y_stari)<tol)
        k
        return;
    end
    k=k+1;
end
end

