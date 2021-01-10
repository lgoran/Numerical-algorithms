%Gauss-Seidel pol

function[y,reziduali,it]=gspol(A,b,x0,m,tol)
n=max(size(A));
y=x0;
if norm(b)==0
  y=zeros(n);
  reziduali=0;
  it=0;
  return
end
rez=norm(b-A*x0)/norm(b);
reziduali(1)=rez;
if rez<=tol
  it=0;
  return
end
D=diag(diag(A));
U=triu(A,1);
U=-inv(D)*U;
L=tril(A,-1);
L=-inv(D)*L;
M=D*(eye(n)-L);
F=eye(n)-inv(M)*A;
c=inv(M)*b;
r=max(abs(eig(F)));
mi0=1;
mi1=r;
y0=x0;
y1=F*x0 + c;
for k=1:m
  mi=1/((2/(r*mi1))-(1/mi0));
  y=((2*mi)/(r*mi1))*F*y1 - (mi/mi0)*y0 + ((2*mi)/(r*mi1))*c;
  rez=norm(b-A*y)/norm(b);
  reziduali(k+1)=rez;
  if rez<=tol
    it=k;
    return
  end
  mi0=mi1;
  mi1=mi;
  y0=y1;
  y1=y;
end
if rez>tol
  it=m;
end
end
