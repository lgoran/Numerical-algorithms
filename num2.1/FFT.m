function [b]=FFT(f,n)
N=2^n;
b=f;
for j=0:N-1
    b(j+1)=f(rho(j,n)+1);
end
for m=1:n
    for j=0:2^(m-1)-1
        e=exp(-2*pi*j*1i/2^m);
        for q=0:2^m:N-1
            u=b(q+j+1);
            v=b(q+j+2^(m-1)+1)*e;
            b(q+j+1)=u+v;
            b(q+j+2^(m-1)+1)=u-v;
        end
    end
end
for j=1:N
    b(j)=b(j)/N;
end
end