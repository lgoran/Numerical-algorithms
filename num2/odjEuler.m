function [ x,y ] = odjEuler( f,a,b,y0,n,varargin )
h=(b-a)/n;
x= a+h*(0:n)';
y(:,1)=y0;
for k=1:n
    y(:,k+1)=y(:,k)+h*feval(f,x(k),y(:,k),varargin{:});
end
end

