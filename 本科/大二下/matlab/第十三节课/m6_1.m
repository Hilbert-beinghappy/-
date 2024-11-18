clear,clc
x=-2:0.01:4;
hold on
for c=1.5:1:5.5
    plot(x,c.*exp(x)-0.5*(sin(x)+cos(x)))
end