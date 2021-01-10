function [ x,y ] = odjEuler2( f,a,b,y0,n,varargin )
h=(b-a)/n;
x= a+h*(0:n)';
y(:,1)=y0;
for k=1:n
    y(:,k+1)=y(:,k)+h*feval(f,x(k)+h/2,y(:,k)+h/2*feval(f,x(k),y(:,k),varargin{:}),varargin{:});
end
end