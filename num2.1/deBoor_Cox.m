function [y,dy,d2y] = deBoor_Cox(x,t,k,i)
y=0;
dy=0;
d2y=0;
N=max(size(t))-1;
zadnji=1;
for j=N:-1:1
    if t(j)~=0
        zadnji=j;
        break;
    end
end
if k==0
    if i+1<=zadnji && t(i+1)<=x && x<t(i+2)
        y=1;
    end
elseif t(i+1)<t(i+k+2)
    if t(i+k+1)~=t(i+1)
        [y1,dy1,~]=deBoor_Cox(x,t,k-1,i);
        y=y+(x-t(i+1))*y1/(t(i+k+1)-t(i+1));
        dy=k*y1/(t(i+k+1)-t(i+1));
        d2y=k*dy1/(t(i+k+1)-t(i+1));
    end
    if t(i+k+2)~=t(i+2)
        [y2,dy2,~]=deBoor_Cox(x,t,k-1,i+1); 
        y=y+(t(i+k+2)-x)*y2/(t(i+k+2)-t(i+2));
        dy=dy-k*y2/(t(k+i+2)-t(i+2));
        d2y=d2y-k*dy2/(t(k+i+2)-t(i+2));
    end
end