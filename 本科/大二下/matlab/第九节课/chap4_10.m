clc,clear
a = zeros(14);%总共有5个专业，4个公司，1个源点，1个汇点，3个中转点
a(1,[2:6]) = [4,3,3,2,4];a(2,[7:10]) = 1;
a(3,[7,9,10,12]) = 1;a(4,[9:12]) = 1;
a(5,[8:12]) = 1;a(6,[7,10,12,13]) = 1;
a(7,11) = 2;a(8,12) = 1;a(9,13) = 2;
a([10:13],14) = [5,4,4,3];%将权赋好
s = cellstr(strcat('v',int2str([1:14]')));%命名序号
G = digraph(a,s);%确定赋权图
[M,F] = maxflow(G,1,14) %使用默认searchtrees方法求最大流
p = plot(G,'Layout','force','EdgeLabel',G.Edges.Weight);
highlight(p,F)%显示最大流并画出最大流