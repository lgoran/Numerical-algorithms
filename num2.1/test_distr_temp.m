function [ ] = test_distr_temp(  )
a=0;
b=1;
s0=1;
n=100;
[x,y,s,k]=odj_gadjanje_2rru_temp(@odj_primjer_distr_temp_f3,a,b,s0,n);
s
plot(x,y(1,:),'r-*');
end

