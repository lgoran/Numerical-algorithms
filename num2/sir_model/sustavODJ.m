function [ dy ] = sustavODJ( t,y,b,k)
    dy(1) = -b*y(1)*y(2);
    dy(2) = b*y(1)*y(2)-k*y(2);
    dy(3) = k*y(2);
    dy = dy';
end

