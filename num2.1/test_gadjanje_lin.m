function [ ] = test_gadjanje_lin(  )
T=@(x) [x,0,-x^2; 
        2*x^3-x,3*x^2-2*x+1,-4*x-2;
        -3*x^3+2,2*x^3+x^2-3*x,2*x];
g=@(x) [-2*x^2+5*x-3;x+3;-x^3+1];
a=0;
b=2;
A=[1,0,-1;2,3,1;4,5,-2];
B=eye(3);
c=[3;-8;5];
n=100;
[x,y,s]=odj_gadjanje_linrp(T,g,a,b,A,B,c,n);
s
plot(x,y(1,:),'r',x,y(2,:),'b',x,y(3,:),'g');
legend('y1','y2','y3');
end

