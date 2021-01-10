function []=spektralnaAnaliza()
g=@(t) 0.2.*cos(2*pi*20*t)+0.35*sin(2*pi*50*t)+0.3*sin(2*pi*70*t);
n=9;
N=2^n;%2^9=512
T=2;
dt=T/N;
dfi=1/T;
t=zeros(N,1);
gv=zeros(N,1);
gv_sum=zeros(N,1);
for k=1:N
    t(k)=dt*(k-1);
    gv(k)=g(t(k));
    gv_sum(k)=gv(k)+normrnd(0,0.5);
end
b=FFT(gv,n);
b_sum=FFT(gv_sum,n);
[A,B]=trig_FFT(gv,n);
[A_sum,B_sum]=trig_FFT(gv_sum,n);
M=N/2;
A(1)=A(1)/2;
A(M+1)=A(M+1)/2;
A_sum(1)=A_sum(1)/2;
A_sum(M+1)=A_sum(M+1)/2;

figure(1)
plot(t,gv,'b-');
figure(2)
subplot(3,1,1)
plot (M/2*t,abs(b), 'b-');
subplot(3,1,2)
plot([0:M]/2,A,'b-');
subplot(3,1,3)
plot([0:M-1]/2,B,'b-');

figure(3)
plot(t,gv_sum,'b-');
figure(4)
subplot(3,1,1)
plot (M/2*t,abs(b_sum), 'b-');
subplot(3,1,2)
plot([0:M]/2,A_sum,'b-');
subplot(3,1,3)
plot([0:M-1]/2,B_sum,'b-');
end