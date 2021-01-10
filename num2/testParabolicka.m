function []=testParabolicka()

%% zad 1
%{
T=0.2;
xL=0;
xD=pi;
k=2;
g=@(x) sin(2.*x);
ro0=@(x) 0;
ro1=@(x) 0;
egz=@(t,x) exp(-8.*t).*sin(2.*x);

n=100;
m=1000;
[t,x,u]=pdjParabolicka(k,T,xL,xD,ro0,ro1,g,n,m);
figure(1);
mesh(t,x,u);
figure(2);
fmesh(egz,[0 T xL xD]);
%}
%% zad2
%{
T=0.1;
xL=0;
xD=1;
k=1;
g=@(x) sin(pi.*x)+sin(3*pi.*x);
ro0=@(x) 0;
ro1=@(x) 0;
egz=@(t,x) exp((-pi*pi).*t).*sin(pi.*x)+exp((-9*pi*pi).*t).*sin((3*pi).*x);
n=50;
m=1000;
%}
g = @(x) sin(0.5 * pi * x) + 0.5*sin(2*pi*x);
xL = 0; xD = 1;
ro0 = @(t) 0;
ro1 = @(t) exp(-pi * pi * t / 4);
egz = @(x, t) exp(-pi .* pi .* t ./ 4) .* sin(0.5 .* pi .* x) + 0.5 .* exp(-4 .* pi .*pi .* t) .* sin(2*pi.*x);
T = 1;
m = 10000; n = 50;
k=1;

[t,x,u]=pdjParabolicka(k,T,xL,xD,ro0,ro1,g,n,m);
[t1,x1,u1]=pdjParabolicka_CrankNicolson(k,T,xL,xD,ro0,ro1,g,n,m);
figure(1);
mesh(t,x,u);
figure(2);
fmesh(egz,[0 T xL xD]);
figure(3);
mesh(t1,x1,u1);
end