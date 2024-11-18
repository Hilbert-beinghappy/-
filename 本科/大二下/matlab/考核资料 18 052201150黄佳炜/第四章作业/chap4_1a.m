clc,clear,close all
a1=zeros(6);
a1(1,[2:4])=1;a1(2,[3,6])=1;a1(3,4)=1;a1(4,5)=1;a1(5,6)=1;
s=cellstr(strcat('v',int2str([1:6]')));
G1=graph(a1,s,'upper');
plot(G1,'Layout','circle','NodeFontSize',10)
disp('(a)非赋权图');