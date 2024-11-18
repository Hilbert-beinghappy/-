function [L,U,x]=LU(A,b)
    %判断A是否为方阵
    [m,n]=size(A);
    if m~=n
        error('A不是方阵');
    end
    %计算变量维数n
    n=length(b);
    % 对变量进行预分配内存x
    x = zeros(n,1);  %解向量
    y = zeros(n,1);  %中间向量
    L = eye(n);      %矩阵L对角线上的值均为1
    U = zeros(n);   %矩阵U变量
    %代入计算公式分解
    for i =1:n
        U(1,i) = A(1,i);    %给U第一行赋值，对应计算公式1
    end
    for i = 2:n
        L(i,1) = A(i,1)/U(1,1); %给L第一列赋值，对应计算公式2
    end
    for r = 2:n
        for i = r:n
            U(r,i) = A(r,i)-sum(L(r, 1:r-1) * U(1:r-1, i)); %对应计算公式3
        end    
        for i = r+1:n        
            L(i,r) = (A(i,r)-sum(L(i, 1:r-1)*U(1:r-1, r)))/U(r,r);    %对应计算公式4
        end
    end
    
    % 求解Ly=b;
    y(1)=b(1);
    for i=2:n
        y(i)=b(i)-L(i,1:i-1) * y(1:i-1);
    end
    % 求解Ux=y;
    if U(n,n)~=0
        x(n) = y(n)/U(n,n);
    end
    for i=(n-1):-1:1
        x(i) = (y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
    end