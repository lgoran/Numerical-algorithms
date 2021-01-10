function [ y,rez,k ] = cheby_jacobi( A, b, x0, tol, kmax )

n = max( size( A ) );
norm_b = norm( b );

D = diag( diag( A ) );
F = D\( D - A );
ro = max( abs( eig( F ) ) );
c = D\b;

if norm( b - A*x0 )/norm_b < tol
    y = x0;
    k = 0;
    return
end

m0 = 1;
m1 = ro;

y0 = x0;
y1 = F*x0 + c;

for k = 1 : kmax
    
    m = 1/( 2/( ro*m1 ) - 1/m0 );
    pom1 = ( 2*m )/( ro*m1 );
    pom2 = m/m0;
    
    y = pom1*( F*y1 + c ) - pom2*y0;
    
    rez( k ) = norm( b - A*y );
    if rez( k )/norm_b < tol
        return
    else
        m0 = m1;
        m1 = m;
        y0 = y1;
        y1 = y;
    end
end
    
    

