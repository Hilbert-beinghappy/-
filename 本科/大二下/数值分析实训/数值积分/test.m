clc,clear
format long
f = @(x)1./(x.^2-1);
%f为函数 第一个数字为积分下限 第二个数字为积分上限，eps为误差限
eps = 0.5e-6;
result = integral(f,2,3)%直接求积分
result_sa_trapz = sa_trapz(f,2,3,eps)%复合梯形求积分
result_sa_simpson = sa_simpson(f,2,3,eps)%复合辛普森求积分
result_romberg = romberg(f,2,3,eps)%romberg求积分
