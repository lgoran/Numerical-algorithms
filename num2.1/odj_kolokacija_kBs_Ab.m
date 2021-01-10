function[A,b]= odj_kolokacija_kBs_Ab(t,x,L,f)
n=max(size(x));
A=zeros(n,n);
b=zeros(n,1);
for i=1:n
    for j=1:n
        [y,dy,d2y]=deBoor_Cox(x(j),t,3,i);
        A(j,i)=L(y,dy,d2y);
    end
    b(i)=f(x(i));
end
end