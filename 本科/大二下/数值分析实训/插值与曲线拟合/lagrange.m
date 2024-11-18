function s=lagrange(x,y,t)
    m=length(t);
    n=length(x);
    s=zeros(1,m);
    for j=1:m
        for i=1:n
            s(j)=s(j)+y(i)*L_base(n,i,x,t(j));
        end
    end
end
function L_b=L_base(n,i,x,t)
    L_b=1;
    xi=x(i);
    x=x([1:i-1 i+1:n]);
    for j=1:n-1
        L_b=L_b*(t-x(j))/(xi-x(j));
    end
end
        