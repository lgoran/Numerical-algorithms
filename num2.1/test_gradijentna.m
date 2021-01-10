function []=test_gradijentna()
f=@(x) x(1)^2+x(2)^2/4-2*x(1)+x(2)+5;
gradf=@(x) [2*x(1)-2;x(2)/2+1];
hessf=@(x) [2,0;
            0,1/2];
x0=[0;0];
[x,k]=gradijentna_metoda(gradf,hessf,x0)
end