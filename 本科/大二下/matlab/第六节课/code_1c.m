a3=zeros(6);
a3(1,3)=3;a3(2,[1,3])=[7,1];a3(3,4)=8;
a3(4,1)=12;a3(5,[4,6])=[9,3];a3(6,2)=1;
s=cellstr(strcat('v',int2str([1:6]')));
G3=digraph(a3,s);
plot(G3,'EdgeLabel',G3.Edges.Weight,'Layout','circle')
disp('(c)有向图');