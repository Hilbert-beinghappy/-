function [y,n,max_eig]=gauseidel(A,b,x0,ep)
D=diag(diag(A));
L=-tril(A,-1); 
U=-triu(A,1);
B=(D-L)\U;
max_eig=max(abs(eig(B)));
f=(D-L)\b;
y=B*x0+f;
n=1;
while norm(y-x0)>=ep
    x0=y;
    y=B*x0+f;
    n=n+1;
    %这里是当迭代次数超过一定时，直接返回，可删去
    if n==5
        break
    end
        
end
