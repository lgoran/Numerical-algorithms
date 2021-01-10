function [ x,y ] = odjABM4( f,a,b,y0,n)
h=(b-a)/n;
x= a+h*(0:n)';
[~,y]=odjrk4(f,a,a+3*h,y0,3);
f3=feval(f,a,y(:,1));
f2=feval(f,a+h,y(:,2));
f1=feval(f,a+2*h,y(:,3));
f0=feval(f,a+3*h,y(:,4));
for i=4:n-1
    y(:,i+1)=fsolve(@(z) -z + y(:,i)+h/720*(251*feval(f,x(i+1),z)+646*f0-264*f1+106*f2-19*f3),y(:,i));
    if i==n-1
        f4=f3;
    end
    f3=f2;f2=f1;f1=f0;
    f0=feval(f,x(i+1),y(:,i+1));

end
y(:,n+1)=y(:,n)+h/720*(251*f0 + 646*f1 - 264*f2 + 106*f3 -19*f4);
end