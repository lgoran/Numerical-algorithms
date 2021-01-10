function [p,q] = pandq(H)
n=max(size(H));
q=0;
n_p_q=0;
flag=0;

for i=n-1:-1:1
    if flag==0 && H(i+1,i)~=0       
        flag=1;
        n_p_q=1;    
    elseif flag==1 && H(i+1,i)==0
        break;
    end
    
    if flag==0
        q=q+1;
    end
    if flag==1
        n_p_q=n_p_q+1;
    end

end
if q==n-1 && n_p_q==0
    q=n;
end
p=n-n_p_q-q;
end

