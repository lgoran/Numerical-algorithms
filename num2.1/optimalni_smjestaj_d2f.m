function [d2f]=optimalni_smjestaj_d2f(z)
xv=[43,13,115,119,33];
yv=[167,29,119,4,17];
c=[12,10,14,9,19];
d2f=[0,0;0,0];
x=z(1);
y=z(2);
for i=1:5 
    d2f(1,1)=d2f(1,1)+c(i)*(y-yv(i))^2/(((x-xv(i))^2+(y-yv(i))^2)^(3/2));
    d2f(1,2)=d2f(1,2)-c(i)*(x-xv(i))*(y-yv(i))/(((x-xv(i))^2+(y-yv(i))^2)^(3/2));
    d2f(2,2)=d2f(2,2)+c(i)*(x-xv(i))^2/(((x-xv(i))^2+(y-yv(i))^2)^(3/2));
end
d2f(2,1)=d2f(1,2);
end