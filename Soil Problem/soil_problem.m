function []=soil_problem()
s=0.32;
A=231;
B=146;
ni=3.65;
l=6.65;
L=100;

a=0;
alfa=0;
b=50;
beta=-1;

s0=0;
n=100;

[x,P,s_en,iter_en]=odj_gadjanje_2rru_en(@soil_problem_f,a,b,alfa,beta,s0,n,@soil_problem_dfy,@soil_problem_dfdy);
s_en
iter_en
S=(1-s)./(1+((-L/A).*P(1,:)).^ni)+s;
Kr=1./(1+((-L/B).*P(1,:)).^l);
subplot(3,1,1);
plot(x,P(1,:));
title('Water pressure(P)');
xlabel('x=psi/sqrt(t)');
grid on;
subplot(3,1,2);
plot(x,S);
title('Saturation(S)');
xlabel('x=psi/sqrt(t)');
subplot(3,1,3);
plot(x,Kr);
title('Relative Permeability(Kr)');
xlabel('x=psi/sqrt(t)');
end