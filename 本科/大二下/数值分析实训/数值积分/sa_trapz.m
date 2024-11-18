function r = sa_trapz (f,a,b,eps) %复合梯形变步长求积分
%f为给定函数，a为函数积分下限，b为函数积分上线，eps为绝对误差限
k = 1;%k代表迭代次数
h = b-a; T(1) = 0;%初始化，先令n=1
x = [a:h:b];%第一次的步长取值
T(2) = my_trapz (x,f(x));%第一次迭代

while (abs(T(k+1)-T(k)) > eps)%当没有满足迭代两次的绝对值差小于误差限时，继续迭代
    h = h/2;%半步长
    x = [a:h:b];%半步长取值
    T(k+2) = my_trapz(x,f(x));%计算下一次迭代的T（k）
    k=k+1;%每次迭代自增
        if k > 20%当迭代次数超过20次时，直接返回
            break;
        end
    
end
m = length(T);%m为最终迭代次数
n_trapz = length(x)
r = T(m);%积分约等于复合梯形变步长算法结果
end