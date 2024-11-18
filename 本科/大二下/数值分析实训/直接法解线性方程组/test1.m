clc,clear
format long
%A为系数矩阵，b为右边的列向量
%只需要对A b进行修改
A=[10 -7 0 1;-3 2.099999 6 2;5 -1 5 -1;2 1 0 2];
b=[8 5.900001 5 1]';
A=LU(A);
%LU为对A进行LU分解
L=eye(4);U=zeros(4,4);
for i=1:4
    for j=1:4
        if i>j
            L(i,j)=A(i,j);
        else
            U(i,j)=A(i,j);
        end
    end
end
%上面这个循环做的是将L和U分开成两个矩阵
%求x
x=inv(U)*inv(L)*b