function []=optimalni_smjestaj()
x0=[50;50];
[x,k]=gradijentna_metoda(@optimalni_smjestaj_df,@optimalni_smjestaj_d2f,x0)
norm(optimalni_smjestaj_df(x),2)
x = linspace(-100,100);
y = linspace(-100,100);
[X,Y] = meshgrid(x,y);
Z = optimalni_smjestaj_f(X,Y);
contour(X,Y,Z)
end