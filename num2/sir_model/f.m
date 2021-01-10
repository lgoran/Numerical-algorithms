function [ y ] = f( y0,b,k )
% pomocna fja za sirModel
    y(1,1)=-b*y0(1,1)*y0(2,1);
    y(2,1)=b*y0(1,1)*y0(2,1)-k*y0(2,1);
    y(3,1)=k*y0(2,1);
end

