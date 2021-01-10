function [fN]=gen_horner_trig(x,a,b)
N=max(size(a));
b=[0;b];
a(1)=a(1)/2;
a(N)=a(N)/2;
B1 = 0;
C1 = 0;
B0 = a(N);
C0 = b(N);
alfa = 2*cos(x);
for k = N-1 : -1 : 1
    B2 = B1;
    C2 = C1;
    B1 = B0;
    C1 = C0;
    B0 = a(k) + alfa*B1 - B2;
    C0 = b(k) + alfa*C1 - C2;
end
parN = B0 - B1*0.5*alfa;
neparN= C1*sin(x);
fN= parN+neparN;
end