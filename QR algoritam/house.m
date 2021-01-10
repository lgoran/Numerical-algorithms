function [ v,b ] = house( x )
m=size(x);
sigma=x(2:m)'*x(2:m);
v=[1;x(2:m)];
if sigma==0 && x(1)>=0
    b=0;
elseif sigma==0 && x(1)<0
        b=-2;
else
    u=sqrt(x(1)*x(1)+sigma);
    if x(1)<=0
        v(1)=x(1)-u;
    else
        v(1)=-sigma/(x(1)+u);
    end
    b=2*v(1)*v(1)/(sigma+v(1)*v(1));
    v=v/v(1);
end
    
end

