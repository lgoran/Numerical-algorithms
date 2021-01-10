function [wmin,wmp,wmin2,wmp2]=portfelj(C,m)
n=max(size(C));
tol=1e-8;
mp=0.05;
vekrad=sor_konv(C);
minrad=min(vekrad);
e=ones(n,1);
w=0;
for i=1:201
    if minrad == vekrad(i)
        w=0.01*(i-1);
        break;
    end
end
[pom,rez,k]=sor(C,e,zeros(n,1),tol,1000,w);
wmin=pom / (e'*pom);


[pom2,rez2,k1]=sor(C,m,zeros(n,1),tol,1000,w);
wmp=(m'*pom2-mp*e'*pom2)*pom+(mp*e'*pom*e'*pom2)*pom2 /((e'*pom) * (m'*pom2) -(e'*pom2)*(e'*pom2));



%%sada radimo sa pcg
[pom,flag,relres,iter,resvec]=pcg(C,e,tol);
[pom2,flag2,relres2,iter2,resvec2]=pcg(C,m,tol);
resvec=resvec/norm(e);
resvec2=resvec2/norm(m);
wmin2=pom / (e'*pom);
wmp2=(m'*pom2-mp*e'*pom2)*pom+(mp*e'*pom*e'*pom2)*pom2 /((e'*pom) * (m'*pom2) -(e'*pom2)*(e'*pom2));

semilogy(0:k,rez,'bo',0:iter,resvec,'ro',0:k1,rez2,'gd',0:iter2,resvec2,'cd');