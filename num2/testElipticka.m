function []=testElipticka()
f=@(x,y) x.^2+y.^2;
ax=0;
bx=1;
ay=0;
by=1;
ro=@(x,y) testElipticka__rubna_fja(x,y,ax,bx,ay,by);
egz=@(x,y) exp(pi.*x).*sin(pi.*y)+x.*x.*y.*y./2;
n=10;
[x,y,U]=pdjElipticka(ax,bx,ay,by,f,ro,n);
mesh(x,y,U);
figure(2);
fmesh(egz, [0 1 0 1]);
end