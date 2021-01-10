function [ x,y ] = odj_rk23v( f,a,b,y0,tol )
    x=zeros(2,1);
    x(1)=a;
    y(:,1)=y0;
    
    c2=1/4; 
    c3=27/40;
    c4=1;
    a21=1/4; 
    a31=-189/800; 
    a32=729/800;
    a41=214/891;
    a42=1/33;
    a43=650/891;
    w1=214/891;
    w2=1/33;
    w3=650/891;
    w11=533/2106;
    w22=0;
    w33=800/1053;
    w44=-1/78;
    
    h=b-a;
    i=1;
    p=2;
    while x(i)<b
        if i>1
            h=0.9*((tol/norm(y(:,i)-ytilda(:,i)))^(1/(p+1)))*h;
        end
        if x(i)+h>b
            h=b-x(i);
        end   
        k1=f(x(i),y(:,i));
        k2=f(x(i)+c2*h,y(:,i)+ a21*k1*h);
        k3=f(x(i)+c3*h,y(:,i)+(a31*k1+a32*k2)*h);
        k4=f(x(i)+c4*h,y(:,i)+(a41*k1+a42*k2+a43*k3)*h);
        y(:,i+1)=y(:,i)+(w1*k1+w2*k2+w3*k3)*h;
        ytilda(:,i+1)=y(:,i)+(w11*k1+w22*k2+w33*k3+w44*k4)*h;

        while( norm( ytilda(:,i+1)-y(:,i+1)) > tol )
            h=0.9*((tol/norm(y(:,i+1)-ytilda(:,i+1))).^(1/(p+1)))*h;
            if x(i)+h>b
                h=b-x(i);
            end
            k1=f(x(i),y(:,i));
            k2=f(x(i)+c2*h,y(:,i)+ a21*h*k1);
            k3=f(x(i)+c3*h,y(:,i)+h*(a31*k1+a32*k2));
            k4=f(x(i)+c4*h,y(:,i)+h*(a41*k1+a42*k2+a43*k3));
            y(:,i+1)=y(:,i)+h*(w1*k1+w2*k2+w3*k3);
            ytilda(:,i+1)=y(:,i)+h*(w11*k1+w22*k2+w33*k3+w44*k4);
        end
        
        x(i+1)=x(i)+h;
        i=i+1;
    end  
end

