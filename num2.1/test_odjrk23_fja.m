function [rez] = test_odjrk23_fja(x,y)
    if 0<=x && x<=pi
        rez=1-y;
    elseif pi<x && x<=4
        rez=-5.*y;
    else rez=0;
    end
end

