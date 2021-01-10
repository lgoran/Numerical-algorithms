function []=test_sesti()
c1=@(t) 2./t;
c0=@(t) -2./(t.^2);
f=@(t) 0;
a=1;
b=2;
alfa=5;
beta=3;
egz=@(t) t + 4./(t.^2);
n=1000;
[t,u]=odjRP(a,b,alfa,beta,c1,c0,f,n);

plot(t,u,'r');
hold on;
fplot(egz,[a b],'b');
hold off;
end