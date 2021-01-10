function [x,u]=odj_rp_dirichlet_neumann(a,b,alfa,beta,c1,c0,f,n,varargin)
% rubni problem u''(x) + c1(x)*u'(x) + c0(x)*u(x) = f(x)
% u'(a)=alfa, u(b)=beta - Dirichlet + Neumann rubni uvjeti
% u_0=u(a) u_1,u_2,...,u:n u_n+1=u(b)
% SUSTAV POSTAJE n+1 = #velicina sustava kojeg racunamo
h=(b-a)/(n+1);
x=a+(0:h:b-a)';
c0v=feval(c0,x(2:n+2),varargin{:});
c1v=feval(c1,x(2:n+2),varargin{:});
fv=2*h^2*feval(f,x(2:n+2),varargin{:});
fv(1)=fv(1)-(2-h*c1v(1))*alfa;
fv(n+1)=fv(n+1)/2-(2*h-h^2*c1v(n+1))*beta;
A=-4*eye(n+1) + 2*h^2*diag(c0v) + 2*diag(ones(n,1),1) + h*diag(c1v(1:n),1) + 2*diag(ones(n,1),-1) - h*diag(c1v(2:n+1),-1);
A(n+1,n+1)=c0v(n+1)*h^2-2;
A(n+1,n)=2;
%rjesavamo tridijagonalni sustav
u=A\fv;
u=[alfa;u];
end