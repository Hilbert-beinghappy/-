function [x,m,a,p]=my_gauss_eli(a,b)
    n=length(b);
    m=zeros(n);
    %u=zeros(n);
    x=zeros(1,n);
    p=0;
    for k=1:n-1
        [c,t]=max(abs(a(k:n,k)));
         if t~=1
            p=p+1;
        end
        t=t+k-1;
        temp=a(t,:);a(t,:)=a(k,:);a(k,:)=temp;
        temp=b(t);b(t)=b(k);b(k)=temp;
        for i=k+1:n
            m(i,k)=a(i,k)/a(k,k);
            b(i)=b(i)-m(i,k)*b(k);
            for j=k+1:n
                a(i,j)=a(i,j)-m(i,k)*a(k,j);
            end
        end
    end
    x(n)=b(n)/a(n,n);
    for k=n-1:-1:1
        temp=0;
        for j=k+1:n
            temp=temp+a(k,j)*x(j);
        end
        x(k)=(b(k)-temp)/a(k,k);
    end
end
        
