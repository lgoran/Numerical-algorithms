function [ dy ] = meh_sustav_funkcija( t,y )
    a0=9.8;
    m=1;
    t0=0;
    if t<t0
        F=0;
    else F=m*a0;
    end
    zeta=0.1;
    w=35;
    dy=[y(2);0];
    dy(2)=F/m-2*zeta*w*y(2)-w*w*y(1);
end