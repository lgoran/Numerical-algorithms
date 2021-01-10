function []=test_odj_diferencije()
q=@(x) 400;
g=@(x) -400*(cos(pi*x))^2- 2*(pi)^2*cos(2*pi*x);
rjesenje=@(x)(exp(-20)*exp(20*x))/(1+exp(-20))+(exp(-20*x))/(1+exp(-20))-((cos(pi*x))^2);
x=[0:0.1:1];
a=0;
b=1;
alfa=0;
beta=0;
[A,c]=odj_diferencije_Ac(q,g,a,b,alfa,beta,x);
u=A\c;
n=max(size(u));
u=[alfa;u;beta];
hold on
fplot(rjesenje,[0 1],'r');
plot(x,u,'b-');
hold off
err=abs(u(1)-rjesenje(x(1)));
for i=2:n
    if abs(u(i)-rjesenje(x(i)))>err
        err=norm(u(i)-rjesenje(x(i)));
    end
end
err
end