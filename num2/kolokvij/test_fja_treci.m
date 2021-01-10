function [rez]=test_fja_treci(x,y,ax,bx,ay,by)
rez=0;
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
