function [df]=optimalni_smjestaj_df(z)
xv=[43,13,115,119,33];
yv=[167,29,119,4,17];
c=[12,10,14,9,19];
df=[0;0];
x=z(1);
y=z(2);
for i=1:5 
    df(1)=df(1)+c(i)*(x-xv(i))/sqrt((x-xv(i))^2+(y-yv(i))^2);
    df(2)=df(2)+c(i)*(y-yv(i))/sqrt((x-xv(i))^2+(y-yv(i))^2);
end
end