function [x] = grab_plijen_funkcija(t,p)
    alfa1=2;
    delta1=0.02;
    alfa2=0.0002;
    delta2=0.8;
    x1=alfa1*p(1)-delta1*p(1)*p(2);
    x2=alfa2*p(1)*p(2)-delta2*p(2);
    x=[x1;x2];
end

