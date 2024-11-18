function t=romberg(f,a,b,eps)
    h=b-a;
    t(1,1)=h*(f(a)+f(b))/2;
    t(2,1)=t(1,1)/2+h*f((a+b)/2)/2;
    t(2,2)=(4*t(2,1)-t(1,1))/3;
    k=2;
    m=2;h=h/2;
    while(abs(t(k,m)-t(k-1,m-1))>eps)
        k=k+1;
        x1=[a+h/2:h:b-h/2];
        t(k,1)=t(k-1,1)/2+sum(f(x1))*h/2;
        for m=2:k
            t(k,m)=(4^(m-1)*t(k,m-1)-t(k-1,m-1))/(4^(m-1)-1);
        end
        h=h/2;
    end
    disp(k)
    end