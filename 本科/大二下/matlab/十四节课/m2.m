clear,clc
x0=[0.2,0.3,0.5]';
L=[1,1/2,0;0,1/2,1;0,0,0];
L=sym(L);%转变为符号矩阵
p=charpoly(L);%求特征多项式
r=roots(p);
[P,D]=eig(L);%求特征向量和特征值
xl=P*diag([0,0,1])*inv(P)*x0
