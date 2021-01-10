function [ x,y ] = odjAB4( f,a,b,y0,n,varargin )
h=(b-a)/n;
x= a+h*(0:n)';
[~,y]=odjrk4(f,a,a+3*h,y0,3,varargin{:});
f3=feval(f,a,y(:,1),varargin{:});
f2=feval(f,a+h,y(:,2),varargin{:});
f1=feval(f,a+2*h,y(:,3),varargin{:});
f0=feval(f,a+3*h,y(:,4),varargin{:});
for i=4:n-1
    y(:,i+1)=y(:,i)+h/24*(55*f0-59*f1+37*f2-9*f3);
    f3=f2;f2=f1;f1=f0;
    f0=feval(f,x(i+1),y(:,i+1),varargin{:});
end
y(:,n+1)=y(:,n)+h/24*(55*f0-59*f1+37*f2-9*f3);
end