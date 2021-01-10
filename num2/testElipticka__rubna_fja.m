function [rez]=testElipticka__rubna_fja(x,y,ax,bx,ay,by)
rez=0;
%{
if y==ay
    rez=4*exp(-3*x);
elseif y==by
    rez=0;
elseif x==ax
    rez=4*cos(3*y);
elseif x==bx
    rez=4*exp(-3)*cos(3*y);
end
%}
if y==ay
    rez=0;
elseif y==by
    rez=x*x/2;
elseif x==ax
    rez=sin(pi*y);
elseif x==bx
    rez=exp(pi)*sin(pi*y)+y*y/2;
end
end
