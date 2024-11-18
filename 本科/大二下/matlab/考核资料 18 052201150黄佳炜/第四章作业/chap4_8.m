clc,clear
a = rand(10);%构造概率矩阵
a = triu(a,1);%我们取上三角元素
w = randi(10,10);%构造了权重矩阵
W = (a>=0.4).*w%生成无向赋权图邻接矩阵的上三角部分
W = W +W'%生成完全邻接矩阵
G = graph(W,'upper')
subplot(121),plot(G,'EdgeLabel',G.Edges.Weight)
T = minspantree(G)%使用Prim算法求得最小生成树
subplot(122),plot(T,'EdgeLabel',T.Edges.Weight)
[p,d] = shortestpath(G,1,10)%q求得1-10的最短距离及最短路径；
d2 = distances(G)