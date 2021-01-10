function []=test_modNewton()
f=@(x) [x(1)^2+x(2)^2-2;exp(x(1)-1)+x(2)^3-2];
df=@(x) [2*x(1),2*x(2);exp(x(1)-1),3*x(2)^2];
x0=[1.5;2];
xmn=mod_newton(f,df,x0)
xn=newton(f,df,x0)

x1=[0.5;0.4];
ymn=mod_newton(f,df,x1)
yn=newton(f,df,x1)
end