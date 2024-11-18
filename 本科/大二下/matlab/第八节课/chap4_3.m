clc,clear
a = zeros(6);
a(1,[2,5]) = [20,15];a(2,[3,4,5]) = [20,60,25];
a(3,[4,5]) = [30,18];a(4,[5,6]) = [35,10];
a(5,6) = 15; a = a+a'; %建立邻接矩阵
s = cellstr(strcat('v',int2str([1:6]')));
G = graph(a,s,'upper');%画出无向赋权图
p = plot(G,'EdgeLabel',G.Edges.Weight)
T = minspantree(G)%画出最小生成树
L = sum(T.Edges.Weight)%找出最小生成树的路径，并计算总和
highlight(p,T)%着重标记最小生成树