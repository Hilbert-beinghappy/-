clear,clc
num=[5.3,7.2,9.6,12.9,17.1,23.2,31.4,38.6,50.2,63.9,76.0,92.0,106.5,123.2,131.7,150.7,179.3,204.0,226.5,251.4,281.4]';
num=num(~isnan(num));
t=[1800:10:2000]';
fn=@(r,xm,t)xm./(1+(xm/3.9-1)*exp(-r*(t-1790)));
ft=fittype(fn,'independent','t');
[f, st]=fit(t,num, ft, 'StartPoint',rand(1,2),...
    'Lower',[0,280],'Upper',[0.1,1000])  %由先验知识主观确定参数界限
xh=f(2010)  %求2010年的预测值
hold on
plot(t,f(t))
plot(t,num,'o')
a=[ones(20,1), -num(1:end-1)];  %向前差分
b=diff(num)./num(1:end-1)/10;
cs=a\b; r1=cs(1), xm1=r1/cs(2)
xh2=fn(r1,xm1,2010)  %求2010年的预测值
plot(t,fn(r1,xm1,t))
a1=[ones(20,1), -num(2:end)];  %向后差分
b1=diff(num)./num(2:end)/10;
cs2=a1\b1; r2=cs2(1), xm2=r2/cs2(2)
xh3=fn(r2,xm2,2010)  %求2010年的预测值
plot(t,fn(r2,xm2,t))