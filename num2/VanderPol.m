function y = VanderPol( t, x, mu )
% Van der Pol-ova diferencijalna jednadzba 
% y''(t) - mu*(1-y(t)^2) y'(t) + y(t) = 0 
% zapisana kao sustav diferencijalnih jednadzbi
y = zeros(2,1) ; 
y(1) = x(2)                     ; 
y(2) = mu*(1-x(1)^2 )*x(2)-x(1) ; 
%
end
