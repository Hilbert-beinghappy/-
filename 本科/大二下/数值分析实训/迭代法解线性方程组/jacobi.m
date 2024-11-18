function [y,n,max_eig]=jacobi(A,b,x0,ep)
Leng=length(x0);
y=zeros(Leng,1);
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
B=D\(L+U);
max_eig=max(abs(eig(B)));
f=D\b;
y(:,1)=B*x0+f;
n=1;
while norm(y(:,n)-x0)>=ep
    x0=y(:,n);
    n=n+1;
    y(:,n)=B*x0+f;
    %这里是当迭代次数超过一定时，直接返回，可删去
    if n>10
        break;
    end

end
