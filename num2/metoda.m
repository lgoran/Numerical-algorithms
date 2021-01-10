function [x,y]=metoda(f,a,b,y0,n,varargin)
h=(b-a)/n;
x=a+h.*(0:n)';
y(:,1)=y0;
for i=1:n
    %Euler y(:,i+1)=y(:,i)+h*feval(f,x(i),y(:,i),varargin{:});
    %Euler2 y(:,i+1)=y(:,i)+h*feval(f,x(i)+h/2,y(:,i)+h/2*feval(f,x(i),y(:,i)));
    %Trapez y(:,i+1)=fsolve(@(z) -z+y(:,i)+h/2*(feval(f,x(i),y(:,i)) + feval(f,x(i+1),z)),y(:,k));
    %{
    rk4
    k1=feval(f,x(i),y(:,i));
    k2=feval(f,x(i)+h/2,y(:,i)+h/2*k1);
    k3=feval(f,x(i)+h/2,y(:,i)+h/2*k2);
    k4=feval(f,x(i)+h/2,y(:,i)+h*k3);
    y(:,i+1)=y(:,i)+h*(k1/6+k2/3+k3/3+k4/6);
    %}
    
    
    
end
end