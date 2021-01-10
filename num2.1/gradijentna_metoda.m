function [x,k]=gradijentna_metoda(gradf,hessf,x0)
x=x0;
k=0;
dg=@(lambda,gradf,x,s) gradf(x+lambda*s)'*s;
d2g=@(lambda,hessf,x,s) s'*hessf(x+lambda*s)*s;
while norm(gradf(x))>1e-10
    s=-gradf(x);
    lambda=gradijentna_newton(@(lambda) dg(lambda,gradf,x,s),@(lambda) d2g(lambda,hessf,x,s),0);
    x=x+lambda*s;
    k=k+1;
end
end