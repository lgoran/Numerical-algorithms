function [ ] = dekonvolucija( up,yp,hh)
    n=18;
    m=102;
    y=yp;
    U=zeros(m+1,n+1);
    for i=1:n+1
        U(:,i)=up(n+2-i:n+2-i+m);
    end
    h=U\y;
    C1=U;
    C2=y;
    C=[C1,C2];
    [U1,s1,V1]=svd(C1);
    [U2,s2,V2]=svd(C);
    usporedba=[s1(n+1,n+1),s2(n+2,n+2)]
    if s1(n+1,n+1)>s2(n+2,n+2)
        ProvjeraUvjetaTM='Matrica [E0,R0] rješava TLS problem'
    elseif s1(n+1,n+1)==s2(n+2,n+2)
        ProvjeraUvjetaTM='Rješenje postoji ali ne mora biti jedinstveno'
    end
    h=-V2(1:n+1,n+2)/V2(n+2,n+2);
    x=1:n+1;
    plot(x,h,'r',x,hh,'b')
    legend('izracunati h', 'egzaktni hh');
end

