function []=test_deBoor()
L=@(y,dy,d2y) -d2y+400*y;
f=@(x) -400*(cos(pi*x))^2- 2*(pi)^2*cos(2*pi*x);
rjesenje=@(x)(exp(-20)*exp(20*x))/(1+exp(-20))+(exp(-20*x))/(1+exp(-20))-((cos(pi*x))^2);

n=11;
s=zeros(n,1);
x=zeros(n,1);
for i=1:n
    s(i)=0.1*(i-1);
    x(i)=i/12;
end
t=zeros(n+6,1);
for i=1:4
    t(i)=s(1);
    t(n+2+i)=s(n);
end
for i=5:n+2
    t(i)=s(i-3);
end
    
[A,b]=odj_kolokacija_kBs_Ab(t,x,L,f);
alfa=A\b;
alfa= [0; alfa; 0];
v=@(x) deBoor(x,t,3,alfa);

err=abs(v(x(1))-rjesenje(x(1)));
for i=2:n
    if abs(v(x(i))-rjesenje(x(i)))>err
        err=norm(v(x(i))-rjesenje(x(i)));
    end
end
err
hold on;
fplot(rjesenje,[0 1],'r');   
fplot(v,[0 1],'b');
legend('egz','v');
end