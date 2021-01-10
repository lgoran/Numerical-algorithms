function [  ] = test(  )
n=200;
a=0;
b=10;
y0=[3;4];

[~,y1]=odjEuler(@test_fja,a,b,y0,n);
[~,y2]=odjEuler2(@test_fja,a,b,y0,n);
[~,y3]=odjTrapez(@test_fja,a,b,y0,n);
[~,y4]=odjKutta(@test_fja,a,b,y0,n);
[~,y5]=odjHuen(@test_fja,a,b,y0,n);
[~,y6]=odjrk4(@test_fja,a,b,y0,n);
[~,y7]=odjAB4(@test_fja,a,b,y0,n);
[~,y8]=odjAB5(@test_fja,a,b,y0,n);
[x,y9]=odjABM4(@test_fja,a,b,y0,n);


figure(1)
fplot(@(t) 3.*cos(t)+sin(t)+exp(-2.*t).*sin(3.*t),[0,10],'y');
hold on;
plot(x,y1(1,:),'r--*',x,y2(1,:),'b-o',x,y3(1,:),'g-.+');
hold off;
legend('pravo','Euler','boljiEuler','Trapez');
figure(2)
plot(x,y4(1,:),'r--*',x,y5(1,:),'b-o',x,y6(1,:),'g-.+');
legend('Kutta2','Huen','rk4');
figure(3)
plot(x,y7(1,:),'r--*',x,y8(1,:),'b-o',x,y9(1,:),'g-.+');
legend('AB4','AB5','ABM4');
end

