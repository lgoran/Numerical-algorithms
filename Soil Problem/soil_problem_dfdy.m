function [sol]=soil_problem_dfdy(x_var,P)
s=0.32;
A=231;
B=146;
n=3.65;
l=6.65;
L=100;
c=L/B;
d=L/A;
a=x_var/2;
x=P(1);
y=P(2);

sol=((-c*x)^l+1)*((2*c*l*(-c*x)^(l-1)*y)/((-c*x)^l+1)^2-(a*d*n*(1-s)*(-d*x)^(n-1))/((-d*x)^n+1)^2);
end