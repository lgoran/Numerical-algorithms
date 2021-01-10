function [sol]=soil_problem_f(x_var,P)
s=0.32;
A=231;
B=146;
n=3.65;
l=6.65;
L=100;
c=L/B;
d=L/A;
a=x_var/2;
x=P(1); %P
y=P(2); %P'

sol=(1+(-x*c)^l)*((l*(-c*x)^(l-1)*c)/(((-c*x)^l+1)^2)*y^2-(1-s)*a*(n*(-d*x)^(n-1)*d)/(((-d*x)^n+1)^2)*y);
end