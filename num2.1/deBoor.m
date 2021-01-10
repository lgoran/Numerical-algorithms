function[ v ]= deBoor(x, t, k, alfa)
d=max(size(alfa))-1;
N=max(size(t))-1;
j=N-k;
for i=N-k:-1:k+1
    if t(i)<=x && x<=t(i+1)
        j=i;
        break;
    end
end
alpha=zeros(d+1,k+1);
for i=1:d+1
	alpha(i,1)=alfa(i);
end
for l=1:k
	for i=j-k+l:j
        if t(i+k+1-l)~=t(i)
            alpha(i,l+1)=(x-t(i))/(t(i+k+1-l)-t(i))*alpha(i,l) + (t(i+k+1-l)-x)/(t(i+k+1-l)-t(i))*alpha(i-1,l);
        end
	end
end
v=alpha(j,k+1);
end