function [] = orbite(p1,p2,p3,p4,p5)
    pom=[p1';p2';p3';p4';p5'];
    A=zeros(5);
    b=zeros(5,1);
    for i=1:5
        x=pom(i,1);
        y=pom(i,2);
        A(i,1)=x*y;
        A(i,2)=y*y;
        A(i,3)=x;
        A(i,4)=y;
        A(i,5)=1;
        b(i)=-x*x;
    end
    a=gmres(A,b);
    
    f=@(x,y) x.^2+a(1)*x.*y+a(2)*y.^2+a(3)*x+a(4)*y+a(5);
    x=-5:0.1:5;
    y=x;
    [X,Y]=meshgrid(x,y);
    Z=f(X,Y);
    %contour(x,y,Z,[0,0]);
    surf(x,y,Z)
    grid on
end
    