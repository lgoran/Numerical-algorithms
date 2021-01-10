function [ x,y ] = odjHuen( f,a,b,y0,n,varargin )
h=(b-a)/n;
x= a+h*(0:n)';
y(:,1)=y0(:);
for i=1:n
    k1=feval(f,x(i),y(:,i),varargin{:});
    k2=feval(f,x(i)+h/3,y(:,i)+h/3*k1,varargin{:});
    k3=feval(f,x(i)+h,y(:,i) + h*k2,varargin{:});
    y(:,i+1)=y(:,i)+h/4*(k1+3*k3);
end
end

