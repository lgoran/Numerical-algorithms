function y = E5(t, x, A, B, C, M)
%E5 problem za kemijsku pirolizu
% krut problem koji se sastoji od 4 nelinearne diferencijalne jednadžbe
y = zeros(4, 1);
y(1) = -A * x(1) - B * x(1) * x(3);
y(2) = A * x(1) - M * C * x(2) * x(3);
y(3) = A * x(1) - B * x(1) * x(3) - M * C * x(2) * x(3) + C * x(4);
y(4) = B * x(1) * x(3) - C * x(4);
end

