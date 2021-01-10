function []=test_odj_rp()
% test_rpodj

primjer = menu('Test primjeri:', 'Dirichlet-1', 'Dirichlet-2', 'Dirichlet-Neumann-1', 'Neumann-1', 'Neumann-2');

switch primjer
    
case 1
c1    = @(x) 2./x     ; 
c0    = @(x) -2./(x.^2) ;
f     = @(x) 0*x       ; 
uex   = @(x) x + 4./(x.^2) ; 

a = 1 ;
b = 2 ; 
alpha = 5 ; 
beta  = 3 ; 

n = 500 ;

[ x, u ] = odj_rp_dirichlet( a, b, alpha, beta, c1, c0, f, n ) ; 

uexv = uex(x) ; 
figure(1)
plot( x, uexv, 'ro-', x, u, 'bx-' ), grid
legend('egzaktno','Centralne dif.','Location','NorthEast')
title('Centralne diferencije za lin.dif. kjedn. drugog reda ')

case 2
c1    = @(x) 0*x     ; 
c0    = @(x) -400*ones(size(x)) ;
f     = @(x) 400*cos(pi*x).^2+2*pi^2*cos(2*pi*x)       ; 
uex   = @(x) (exp(-20)/(1+exp(-20)))*exp(20*x) + ...
             (1/(1+exp(-20)))*exp(-20*x) - cos(pi*x).^2;  
a = 0 ;
b = 1 ; 
alpha =0  ;
beta  = 0 ;

% i=1;
figure(1), hold on

for n=10 : 10 : 500 
[ x, u ] = odj_rp_dirichlet( a, b, alpha, beta, c1, c0, f, n ) ; 
uexv = uex(x) ; 
figure(1), 
plot( x, u, 'b-' ), grid
%Anim(i) = getframe; i = i+1 ; 
end
plot( x, uexv, 'r-' ), grid

legend('egzaktno','Centralne dif.','Location','NorthEast')
title('Centralne diferencije za lin.dif. kjedn. drugog reda ')
figure(1), hold off
%movie(Anim,2,1)
case 3 
c0    = @(x) 2 - 4.*x.^2; 
c1    = @(x) 0*x;
f     = @(x) 0*x; 
uex   = @(x) exp(-x.^2) ; 

a = 0 ;
b = 1 ; 
alpha = 1 ; 
beta  = -2/exp(1) ; 

n = 500 ;

[ x, u ] = odj_rp_dirichlet_neumann( a, b, alpha, beta, c1, c0, f, n ) ; 

uexv = uex(x) ; 
figure(1)
plot( x, uexv, 'ro-', x, u, 'bx-' ), grid
legend('egzaktno','Centralne dif.','Location','NorthEast')
title('Centralne diferencije za lin.dif. kjedn. drugog reda ')

case 4 
c0    = @(x) 2 - 4.*x.^2; 
c1    = @(x) 0*x;
f     = @(x) 0*x; 
uex   = @(x) exp(-x.^2) ; 

a = 0 ;
b = 1 ; 
alpha = 0 ; 
beta  = -2/exp(1) ; 

n = 500 ;

[ x, u ] = odj_rp_neumann( a, b, alpha, beta, c1, c0, f, n ) ; 

uexv = uex(x) ; 
figure(1)
plot( x, uexv, 'ro-', x, u, 'bx-' ), grid
legend('egzaktno','Centralne dif.','Location','NorthEast')
title('Centralne diferencije za lin.dif. kjedn. drugog reda ')

case 5 
c0    = @(x) x; 
c1    = @(x) 0*x;
f     = @(x) (3-x-x.^2+x.^3).*sin(x) + 4.*x.*cos(x); 
uex   = @(x) (x.^2-1).*sin(x) ; 

a = 0 ;
b = 1 ; 
alpha = -1 ; 
beta  = 2*sin(1) ; 

n = 500 ;

[ x, u ] = odj_rp_neumann( a, b, alpha, beta, c1, c0, f, n ) ; 

uexv = uex(x) ; 
figure(1)
plot( x, uexv, 'ro-', x, u, 'bx-' ), grid
legend('egzaktno','Centralne dif.','Location','NorthEast')
title('Centralne diferencije za lin.dif. kjedn. drugog reda ')

end
end