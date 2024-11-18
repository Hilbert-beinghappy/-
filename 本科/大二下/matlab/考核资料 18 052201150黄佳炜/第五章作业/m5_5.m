rng(2) %确保多次运行产生相同结果
x0=linspace(-6,6,100);
fx=@(x)8*x.^3+5*x.^2+2*x-1;
y0=fx(x0);
p=polyfit(x0,y0,3)
y1=polyval(p,x0) %生成多项式p在函数点x0的值
yh=y1+normrnd(0,1,size(y0)); %加入白噪声
p2=polyfit(x0,yh,3) 
hold on
plot(x0,y1)
plot(x0,yh)