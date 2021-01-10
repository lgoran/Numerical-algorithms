function [x,u]=odj_rp_neumann(a,b,alfa,beta,c1,c0,f,n,varargin)
% rubni problem u''(x) + c1(x)*u'(x) + c0(x)*u(x) = f(x)
% u'(a)=alfa, u'(b)=beta - Neumannovi rubni uvjeti
% u_0=u(a) u_1,u_2,...,u:n u_n+1=u(b)
% SUSTAV POSTAJE n+2 = #velicina sustava kojeg racunamo
h=(b-a)/(n+1);
x=a+(0:h:b-a)';
c0v=feval(c0,x,varargin{:});
c1v=feval(c1,x,varargin{:});
fv=2*h^2*feval(f,x,varargin{:});
fv(1)=fv(1)/2+(2*h-h^2*c1v(1))*alfa;
fv(n+2)=fv(n+2)/2-(2*h-h^2*c1v(n+2))*beta;
A=-4*eye(n+2) + 2*h^2*diag(c0v) + 2*diag(ones(n+1,1),1) + h*diag(c1v(1:n+1),1) + 2*diag(ones(n+1,1),-1) - h*diag(c1v(2:n+2),-1);
A(1,1)=c0v(1)*h^2-2;
A(1,2)=2;
A(n+2,n+2)=c0v(n+2)*h^2-2;
A(n+2,n+1)=2;

%rjesavamo tridijagonalni sustav
u=A\fv;