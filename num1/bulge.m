function [ Q,D ] = bulge(H)
n=max(size(H));
Q=eye(n);
for k=1:1000
    [c,s]=givens(H(1,1),H(2,1));
    G=[c,-s;s,c];
    H(1:2,1:n)=G*H(1:2,1:n);
    H(1:n,1:2)=H(1:n,1:2)*G';
    Q(1:2,1:n)=G*Q(1:2,1:n);
    
    for i=1:(n-2)
        [c,s]=givens(H(i+1,i),H(i+2,i));
        G=[c,-s;s,c];
        H(i+1:i+2,1:n)=G*H(i+1:i+2,1:n);
        H(1:n,i+1:i+2)=H(1:n,i+1:i+2)*G';
        H(i+2,i)=0;
        Q(i+1:i+2,1:n)=G*Q(i+1:i+2,1:n);
        
    end
end
D=H;
Q=Q';
end

