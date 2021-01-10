function [ y ] = Inv_iter( A,x0,tol,shift)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=x0/norm(x0);
I=ones(max(size(A)));
k=0;
while 1
    y_stari=y;
    [y,rez,iter]=gauss(A-shift*I,y_stari,x0,tol,1000);
    y=y/norm(y)
    if(norm(y-y_stari)<tol)
        k
        return;
    end
    k=k+1;
end

