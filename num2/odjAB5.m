function [ x,y ] = odjAB5( f,a,b,y0,n,varargin )
h=(b-a)/n;
x= a+h*(0:n)';
[~,y]=odjrk4(f,a,a+4*h,y0,4,varargin{:});
f4=feval(f,a,y(:,1),varargin{:});
f3=feval(f,a+h,y(:,2),varargin{:});
f2=feval(f,a+2*h,y(:,3),varargin{:});
f1=feval(f,a+3*h,y(:,4),varargin{:});
f0=feval(f,a+4*h,y(:,5),varargin{:});
for i=5:n-1
    y(:,i+1)=y(:,i)+h/720*(1901*f0-2774*f1+2616*f2-1274*f3+251*f4);
    f4=f3;f3=f2;f2=f1;f1=f0;
    f0=feval(f,x(i+1),y(:,i+1),varargin{:});
end
y(:,n+1)=y(:,n)+h/720*(1901*f0-2774*f1+2616*f2-1274*f3+251*f4);
end