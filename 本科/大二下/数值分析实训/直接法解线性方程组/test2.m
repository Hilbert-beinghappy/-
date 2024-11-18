clc,clear
format short
A=[3.01 6.03 1.99;1.27 4.16 -1.23;0.987 -4.81 9.34];
b=[1;1;1];
[x,m,a,p]=my_gauss_eli(A,b)
aa=diag(a);detA=1;
n=length(aa);
for i=1:n
    detA=aa(i)*detA*(-1)^p;
end
detA %使用高斯消元法后，这里是在验证不改变行列式的值
det(A)
cond(A)%计算条件数