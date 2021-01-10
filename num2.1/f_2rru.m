function [ dy ] = f_2rru( x,y )
    dy=[0;0];
    dy(1)=y(2);
    dy(2)=3/2*y(1)*y(1);
end

