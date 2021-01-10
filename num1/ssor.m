% Ova funkcija rjesava sustav Ax = b pomocu SSOR metode tako, pri cemu 
% je omega izabran tako da spektralni radijus matrice iteracija bude minimalan.
function [ x, k, rez ] = ssor( A, b, x0, tol, kmax )

n = max( size( A ) );

x = x0;

min = 100;

if norm( b - A*x0 )/norm( b ) < tol
    k = 0;
    return
end

D = diag( diag( A ) );

L1 = zeros( n, n );

U1 = zeros( n, n );

I = eye( n );

for i = 1 : n
    for j = 1 : i - 1
        L1( i, j ) = A( i, j );%L1 je strogo donji trokut od A
    end
    for j = i + 1 : n
        U1( i, j ) = A( i, j );%U1 je strogo gornji trokut od A
    end
end

L = -D \ L1;%L je matrica iz rastava A = D( I - L - U )

U = -D \ U1;%U je matrica iz rastava A = D( I - L - U )

%Zelimo izabrati om tako da je spr( S ) minimalan, pri cemu je S matrica
%iteracija SSOR metode.
%Znamo da om mora biti u intervalu ( 0, 2 ).

for pom = 0.1 : 0.05 : 1.9
    S = I - pom*( 2 - pom )*( I - pom*U )\( I - pom*L )\D\A;
    spr = max( abs( eig ( S ) ) );%spektralni radijus od S
    if spr < min
        min = spr;
        om = pom;
    end
end

for k = 1 : kmax
    
    for i = 1 : n
        x( i ) = ( 1 - om )*x( i ) + ( om/A( i, i ) )*( b( i ) - A( i, : )*x + A( i, i )*x( i ) );
    end

    for i = n : -1 : 1
        x( i ) = ( 1 - om )*x( i ) + ( om/A( i, i ) )*( b( i ) - A( i, : )*x + A( i, i )*x( i ) );
    end
    
    rez( k ) = norm( b - A*x );
    
    if rez( k )/norm( b ) < tol
        return
    end

end