clear,clc
t=[700,720,740,760,780];
V=[0.0977,0.1218,0.1406,0.1551,0.1664];
v1=interp1(t,V,[750,770])%计算线性插值
pp=csape(t,V);
v2=fnval(pp,[750,770])%计算三次调样插值
plot(t,V,'* -')
hold on,fplot(@(t)fnval(pp,t),[700,780])