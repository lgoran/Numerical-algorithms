function [ x,y ] = odjTrapez( f,a,b,y0,n,varargin )
h=(b-a)/n;
x= a+h*(0:n)';
y(:,1)=y0;
options = optimset('Display','off');
for k=1:n
    y(:,k+1)=fsolve(@(z) -z + y(:,k)+h/2*(feval(f,x(k),y(:,k),varargin{:})+feval(f,x(k+1),z,varargin{:})),y(:,k),options);
end
end