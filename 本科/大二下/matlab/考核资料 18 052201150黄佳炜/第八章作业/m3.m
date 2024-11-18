clear,clc
x0=[200,200,200]';
L=[0.6,0.3,0.1;0.2,0.7,0.1;0.1,0.3,0.6]
L=sym(L);%转变为符号矩阵
p=charpoly(L);%求特征多项式
r=roots(p);
[P,D]=eig(L)%求特征向量和特征值
xl=P*diag([1,0,0])*inv(P)*x0