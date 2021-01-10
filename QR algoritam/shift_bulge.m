function [Q,H] = shift_bulge(H)
n=max(size(H));
Q=eye(n);
I=eye(n);
%H(1,1)=H(1,1)-H(n,n);


c=zeros(n-1,1);
s=zeros(n-1,1);

    [c(1),s(1)]=givens(H(1,1)-H(n,n),H(2,1));
    G=[c(1),s(1);-s(1),c(1)];
    H(1:2,1:n)=G'*H(1:2,1:n);%izbacuje 2. element
    if n==2
        H(1:2,1:2)=H(1:2,1:2)*G;%slucaj n==2
    else
        H(1:3,1:2)=H(1:3,1:2)*G;%stvara kvrgu 
    end
for k =2:n-1
    if k==n-1 %% zadnje gonjenje
        [c(k),s(k)]=givens(H(k,k-1),H(k+1,k-1));
        G=[c(k),s(k);-s(k),c(k)];
        H(k:k+1,k-1:n)=G'*H(k:k+1,k-1:n);
        H(1:k+1,k:k+1)=H(1:k+1,k:k+1)*G; 
        continue;
    end
    [c(k),s(k)]=givens(H(k,k-1),H(k+1,k-1));
    G=[c(k),s(k);-s(k),c(k)];
    H(k:k+1,k-1:n)=G'*H(k:k+1,k-1:n);
    H(1:k+2,k:k+1)=H(1:k+2,k:k+1)*G;    
end

    
for k =1:n-1
    Q(1:n,k:k+1)=Q(1:n,k:k+1)*G;
end
end

