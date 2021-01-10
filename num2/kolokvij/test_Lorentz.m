function []=test_Lorentz()
a=0;
b=20;
y0=[1;1;1];
n=1000;
[t,y]=odjABM4(@fja_Lorentz,a,b,y0,n);
figure(1);
plot(t,y(1,:));
figure(2);
plot(t,y(2,:));
figure(3);
plot(t,y(3,:));
end