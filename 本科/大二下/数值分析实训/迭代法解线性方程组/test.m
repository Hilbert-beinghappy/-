clc,clear
format long
%A为系数矩阵，b为右边的列向量，x0为喜欢的初值（列向量）,ep为误差限
%只需要对A b进行修改
A=[8 -3 2
   4 11 -1
   2 1 4];
b=[20 33 12]';
x0=[0 0 0]';ep=1e-2;
%jacobi 和gauseidel选一个
[y,n,max_eig]=gauseidel(A,b,x0,ep)
%y为每个迭代的结果，n为迭代次数，max_eig为谱半径