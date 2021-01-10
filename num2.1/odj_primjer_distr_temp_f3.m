function [ dy ] = odj_primjer_distr_temp_f3( x,y )
    alfa=0.8;
    dy=[y(2);0;0];
    if 0<=x && x<=1e-2
        dy(2)=alfa/2*exp(y(3))*(-1+3/8*x^2*alfa*exp(y(3)));
    elseif 1e-2<=x && x<=1
        dy(2)=-y(2)/x-alfa*exp(y(1));
    end
end

