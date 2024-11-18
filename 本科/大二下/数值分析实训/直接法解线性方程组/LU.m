function a=LU(a)
    n=size(a);
    for i=2:n
        a(i,1)=a(i,1)/a(1,1);
    end
    for r=2:n
        for i=r:n
            a(r,i)=a(r,i)-a(r,1:r-1)*a(1:r-1,i);
        end
        if(r<n)
            for i=r+1:n
                a(i,r)=(a(i,r)-a(i,1:r-1)*a(1:r-1,r))/a(r,r);
            end
        end
    end