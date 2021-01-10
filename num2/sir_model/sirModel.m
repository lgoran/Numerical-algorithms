function [] = sirModel(b,k,s0,i0,r0,pop,n)
    i0=i0/pop;
    s0=1;
    h=1;
    s=zeros(n/h);
    i=zeros(n/h);
    r=zeros(n/h);
    %% euler
    y0=[s0;i0;r0];
    y=zeros(3,n/h);
    y(:,1)=y0+h*f(y0,b,k);
    for j=1:n/h-1
        y(:,j+1)=y(:,j)+h*f(y(:,j),b,k);
    end
    y=y*pop;
    y(2,28)+y(3,28)%ukupan broj zarazenih
    %% crtanje eulera
    figure(1)
    x=1:n/h;    
    plot(x*h,y(1,:),'b',x*h,y(2,:),'r',x*h,y(3,:),'g');
    grid on
    title('Eulerova metoda');
    legend('\color{blue} Nezaraženi','\color{red} Zaraženi','\color{green} Preboljeli');
    xlabel('Broj dana');
    ylabel('Broj zaraženih');
    %% euler poboljsani 
    y0=[s0;i0;r0];
    y=zeros(3,n/h);
    y(:,1)=y0+h*f(y0+(h/2)*f(y0,b,k),b,k);
    for j=1:n/h-1
        y(:,j+1)=y(:,j)+h*f(y(:,j)+(h/2)*f(y(:,j),b,k),b,k);
    end
    y=y*pop;
    y(2,28)+y(3,28)%ukupan broj zarazenih
    %% crtanje euler2
    figure(2)
    x=1:n/h;    
    plot(x*h,y(1,:),'b',x*h,y(2,:),'r',x*h,y(3,:),'g');
    grid on
    title('Poboljšana Eulerova metoda');
    legend('\color{blue} Nezaraženi','\color{red} Zaraženi','\color{green} Preboljeli');
    xlabel('Broj dana');
    ylabel('Broj zaraženih');
    %% trapezna
    y0=[s0;i0;r0];
    y=zeros(3,n/h+1);
    y(:,1)=y0;
    for j=1:n/h
        g=@(z) -z+y(:,j)+h*(f(y(:,j),b,k)+f(z,b,k))/2;
        z0=y(:,j)+h*f(y(:,j ),b,k);
        y(:,j+1)=fsolve(g,z0);
    end
    y=y*pop;
    y(2,28)+y(3,28)%ukupan broj zarazenih
    %% crtanje trapezne
    figure(3)
    x=1:n/h;    
    plot(x*h,y(1,2:n/h+1),'b',x*h,y(2,2:n/h+1),'r',x*h,y(3,2:n/h+1),'g');
    grid on
    title('Trapezna metoda');
    legend('\color{blue} Nezaraženi','\color{red} Zaraženi','\color{green} Preboljeli');
    xlabel('Broj dana');
    ylabel('Broj zaraženih');
    %% matlabova fja
    y0=[s0;i0;r0];
    tspan=(1:h:n)';
    [t,y]=ode45(@(t,y)sustavODJ(t,y,b,k),tspan,y0);
    y=y*pop;
    %ovako se prenose argumenti - 
    %(t,y) ono sta nemam i fju zoves kako si je definira
    y(28,2)+y(28,3)
    %% crtanje matlabove fje
    figure(4)
    plot(t,y);
    grid on
    title('Matlabov ode45');
    legend('\color{blue} Nezaraženi','\color{red} Zaraženi','\color{green} Preboljeli');
    xlabel('Broj dana');
    ylabel('Broj zaraženih');
end

