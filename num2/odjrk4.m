function [ x,y ] = odjrk4( f,a,b,y0,n,varargin )
h=(b-a)/n;
x= a+h*(0:n)';
y(:,1)=y0(:);
for i=1:n
    k1=feval(f,x(i),y(:,i),varargin{:});
    k2=feval(f,x(i)+h/2,y(:,i)+h/2*k1,varargin{:});
    k3=feval(f,x(i)+h/2,y(:,i) + h/2*k2,varargin{:});
    k4=feval(f,x(i)+h,y(:,i) + h*k3,varargin{:});
    y(:,i+1)=y(:,i)+h/6*(k1+2*k2+2*k3+k4);
end
end
