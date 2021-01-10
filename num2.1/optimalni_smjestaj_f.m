function [f]=optimalni_smjestaj_f(x,y)
xv=[43,13,115,119,33];
yv=[167,29,119,4,17];
c=[12,10,14,9,19];
f=0;
for i=1:5 
    f=f+c(i)*sqrt((x-xv(i)).^2+(y-yv(i)).^2);
end

end