function [rj]=fja_Lorentz(t,y)
sigma=10;
beta=8/3;
ro=28;

rj1=sigma*(y(2)-y(1));
rj2=y(1)*(ro-y(3))-y(2);
rj3=y(1)*y(2)-beta*y(3);
rj=[rj1;rj2;rj3];
end