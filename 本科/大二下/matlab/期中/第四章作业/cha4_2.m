clc, clear;
L= {'A','B1',2;'A','B2',4 ;'B1','C1',3
'B1','C2',3;'B1','C3',1;'B2','C1',2
'B2','C2',3;'B2','C3',1;'C1','D',1
'C2','D',3 ;'C3','D',4};
G=digraph (L(:,1),L(:,2),cell2mat (L(:,3)));
plot (G), [p,d]=shortestpath(G,'A','D')