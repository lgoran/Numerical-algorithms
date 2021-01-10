function [ y,rez,k ]  = cheby_gs( A, b, x0, tol, kmax )

n = max( size( A ) );

norm_b = norm( b )

I = eye( n );

D = diag( diag( A ) );

L = -D \ ( tril( A ) - D );

U = -D \ ( triu( A ) - D );

G = ( I - L ) \ U;

ro = max( abs( eig( G ) ) )

g = ( I - L ) \ D \ b;

if norm( b - A*x0 )/norm_b < tol
    y = x0;
    k = 0;
    return
end

m0 = 1;
m1 = ro;

y0 = x0;
y1 = G*x0 + g;

for k = 1 : kmax
    
    m = 1/( 2/( ro*m1 ) - 1/m0 );
    pom1 = ( 2*m )/( ro*m1 );
    pom2 = m/m0;
  
    y = pom1*( G*y1 + g ) - pom2*y0;
    
    rez( k ) = norm( b - A*y );
    if(k<100)
        rez(k)
    end
    if rez( k )/norm_b < tol
        return
    else
        m0 = m1;
        m1 = m;
        y0 = y1;
        y1 = y;
    end
end
