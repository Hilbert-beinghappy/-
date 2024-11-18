a2=zeros(6);
a2(1,[2:4])=[7,3,12];a2(2,[3,6])=[1,1];
a2(3,4)=8;a2(4,5)=9;a2(5,6)=3;
s=cellstr(strcat('v',int2str([1:6]')));
G2=graph(a2,s,'upper');
plot(G2,'Layout','circle','EdgeLabel',G2.Edges.Weight,'NodeFontSize',10)
disp('(b)赋权图');