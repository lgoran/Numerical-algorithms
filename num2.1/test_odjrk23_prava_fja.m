function [rez] = test_odjrk23_prava_fja(x)
    if 0<=x && x<=pi
        rez=1-exp(-x);
    elseif pi<x && x<=4
        rez=(1-exp(-pi)).*exp(-5.*(x-pi));
    else rez=0;
    end
end
