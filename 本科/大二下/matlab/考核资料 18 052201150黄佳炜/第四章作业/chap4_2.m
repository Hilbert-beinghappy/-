clc,clear,close all
a=zeros(6);
a(1,[2,5])=[20,15];a(2,[3:5])=[20,60,25];
a(3,[4,5])=[30,18];a(4,[5,6])=[35,10];a(5,6)=15;
s=cellstr(strcat('v',int2str([1:6]')));
G=graph(a,s,'upper');
[p,d]=shortestpath(G,1,4)
h=plot(G,'EdgeLabel',G.Edges.Weight);
highlight(h,p,'EdgeColor','r','LineWidth',2)
disp('(d)赋权无向图');