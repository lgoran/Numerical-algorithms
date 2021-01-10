function [ x, k, rez ] = jacobi( A, b, x0, tol, kmax, spr )

n = max( size( A ) );

if norm( b - A*x0 ) < tol
    k = 0;
    x = x0;
    return
end

if spr >= 1
    exit
end


for k = 1 : kmax
    
    for i = 1 : n
        x( i, 1 ) = ( 1/A( i, i ) )*( b( i ) - A( i, : )*x0 + A( i, i )*x0( i ) );
    end
    
    rez( k ) = norm( b - A*x );
    
    if rez( k )/norm( b ) < tol
        return
    end

    x0 = x;
    
end



    
    