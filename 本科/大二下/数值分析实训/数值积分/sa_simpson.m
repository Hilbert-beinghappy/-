function sa =sa_simpson(f,a,b,eps)
k=1;
h=b-a;
s(1)=0;
x=[a:h/2:b];
y=f(x);
s(2)=simpson(y,h);
while (abs(s(k+1)-s(k))>eps)
    h=h/2;
    x=[a:h/2:b];
    y=f(x);
    s(k+2)=simpson(y,h);
    k=k+1;

    if k>20
        break;
    end
end
m = length(s);%m为最终迭代次数
n_simpson = length(x)
sa = s(m);%积分约等于复合辛普森变步长算法结果
end