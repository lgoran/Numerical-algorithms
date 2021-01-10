n=5;
A=rand(n);
tol=n*realmin;
%A=[-3,2,0,0;-3,4,0,0;0,0,-5,-4;0,0,-2,2];%-6,-2,3,3
%A=[4,6,10;3,10,13;-2,-6,-8];%0,2,4


podaci=importdata('stieltjes_matr.txt');
A=zeros(100);
for i=1:100
    for j=1:100
        A(i,j)=podaci(100*(i-1)+j);
    end
end


tol=1e-8;
tic
H=finalQR(A,tol);
toc