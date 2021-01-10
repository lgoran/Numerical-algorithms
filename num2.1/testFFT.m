function []=testFFT()
f=@(x) exp(-x.^2./4);
n=4;
N=2^n;
x=zeros(N,1);
fv=zeros(N,1);
for k=1:N
    x(k)=2*pi*(k-1)/N;
    fv(k)=f(x(k));
end
b=FFT(fv,n);
[A,B]=trig_FFT(fv,n);

y=zeros(N,1);
for k=1:N
    epsilon=exp(1i*x(k));
    y(k)=b(N);
    for j=N-1:-1:1
        y(k)=y(k)*epsilon+b(j);
    end
    y(k)=real(y(k));
end
greska=abs(fv(1)-y(1));
for i=2:N
    if abs(fv(i)-y(i))>greska
        greska=abs(fv(i)-y(i));
    end
end
greska

nn=1000;
h=2*pi/nn;
xx=[0:h:2*pi];
yy=xx;
for i=1:nn+1
    yy(i)=gen_horner_trig(xx(i),A,B);
end

figure(1)
fplot( f , [0,2*pi], 'b-');
hold on;
plot (x,y, 'o');
plot(xx,yy,'g-')
legend('egzaktno','tocke','trig.polinom');
hold off;
end