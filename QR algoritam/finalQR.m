function [H] = finalQR(A,tol)
n=max(size(A));
H=hess_reduction(A);
q=0;
while q~=n     
    for i=1:n-1
        if abs(H(i+1,i))<=(tol*(abs(H(i,i)) + abs(H(i+1,i+1))))
            H(i+1,i)=0;
        end
    end
    [p,q]=pandq(H);
    if q<n
        if p==0 && q==0
            [~,H(p+1:n-q,p+1:n-q)]=shift_bulge(H(p+1:n-q,p+1:n-q));%%H22
        elseif p==0
            [U,H(p+1:n-q,p+1:n-q)]=shift_bulge(H(p+1:n-q,p+1:n-q));%%H22
            H(p+1:n-q,n-q+1:n)=U'*H(p+1:n-q,n-q+1:n);%%H23
        elseif q==0
            [U,H(p+1:n-q,p+1:n-q)]=shift_bulge(H(p+1:n-q,p+1:n-q));%%H22
            H(1:p,p+1:n-q)=H(1:p,p+1:n-q)*U;%%H12
        else
            [U,H(p+1:n-q,p+1:n-q)]=shift_bulge(H(p+1:n-q,p+1:n-q));%%H22
            H(1:p,p+1:n-q)=H(1:p,p+1:n-q)*U;%%H12
            H(p+1:n-q,n-q+1:n)=U'*H(p+1:n-q,n-q+1:n);%%H23
        end
    end
    
end
end

