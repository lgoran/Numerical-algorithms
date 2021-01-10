function [x] = term_obrada_fja_f( t,T )
    sigma=5.67*1e-8;
    duljina=1;
    r=0.005;
    gustoca=7822;
    volumen=pi*r*r*duljina;
    m=gustoca*volumen;
    Ap=2*r*pi*duljina;
    c=444;
    e=0.7;
    H1=15;
    H2=100;
    Tokolina=21+273.15;
    th=70;
    tuk=210;
    Qe=3000;
    if t>=0 && t<th
        x=1/(m*c)*(Qe-Ap*(H1*(T-Tokolina)+e*sigma*(T^4-Tokolina^4)));
    elseif t>=th && t<=tuk
        x=1/(m*c)*(-Ap*(H2*(T-Tokolina)+e*sigma*(T^4-Tokolina^4)));
    else
        x=273.15;
    end
end

