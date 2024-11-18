clc,clear
format long
%f为所求方程
%x0为初值，f_dev为一阶导,eps为误差限
f=@(x)x^3+2*x^2+10*x-20;
x0=0;b=10;h=1e-4;
[x,k,res]=newton_sp(x0,f,eps)
%x为根，k为近似值