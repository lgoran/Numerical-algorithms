function [x,u]=odj_rp_dirichlet(a,b,alfa,beta,c1,c0,f,n,varargin)
% rubni problem u''(x) + c1(x)*u'(x) + c0(x)*u(x) = f(x)
% u(a)=alfa, u(b)=beta - Dirichletovi rubni uvjeti
% u_0=u(a) u_1,u_2,...,u:n u_n+1=u(b)
% n = #velicina sustava kojeg racunamo
h=(b-a)/(n+1);
x=a+(0:h:b-a)';
c0v=feval(c0,x(2:n+1),varargin{:});
c1v=feval(c1,x(2:n+1),varargin{:});
fv=2*h^2*feval(f,x(2:n+1),varargin{:});
fv(1)=fv(1)-(2-h*c1v(1))*alfa;
fv(n)=fv(n)-(2+h*c1v(n))*beta;
A=-4*eye(n) + 2*h^2*diag(c0v) + 2*diag(ones(n-1,1),1) + h*diag(c1v(1:n-1),1) + 2*diag(ones(n-1,1),-1) - h*diag(c1v(2:n),-1);
%rjesavamo tridijagonalni sustav
u=A\fv;
u=[alfa;u;beta];


%ako imamo neumannove alfa=u0' ili beta=un'
%kosristima u0'=(u1-u0)/2h => dobijemo u0
%za beta analogno un'=(un-u(n-1))/2h =>un
% do uvrstimo gore umjesto alfa ili beta
end