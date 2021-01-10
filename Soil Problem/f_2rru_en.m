function [dy]=f_2rru_en(x,y,f,dfy,dfdy)
        dy=[y(2); f(x,y); y(4); dfy(x,y)*y(3) + dfdy(x,y)*y(4)];
end