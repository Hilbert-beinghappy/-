clc,clear
syms y(x)
Dy = diff(y);%按照差分的定义我们就可以得到导数
y=dsolve(x^2*diff(y,2)+x*diff(y)+(x^2-1/4)*y,y(pi/2)==2,Dy(pi/2)==-2/pi);
y=simplify(y)%化简所得到的符号解
pretty(y);
ezplot(y);
hold on
dy=@(x,y)[y(2);(1/(4*x^2)-1)*y(1)-y(2)/x];
[x,y]=ode45(dy,[pi/2,8],[2,-2/pi]);%用求解器求解微分方程
plot(x,y(:,1),'*')
legend('符号解','数值解')
