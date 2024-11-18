function T=my_trapz(f,a,b,eps)
        h=b-a;
        k=2;
        T(1)=0;
        n=1;
        T(2)=(f(a)+f(b)).*h/2
        while(abs(T(k)-T(k-1))>eps)
            n=n+1;
            h=h/n;
            sum=0;
            count=0;
            for i=a:h:b
                sum=(f(a+count*h)+f(a+(count+1)*h))*h/2+sum;
                count=count+1;
            end
            k=k+1;
            T(k)=sum;
            if k>20
                break
            end
        end
    disp(k)