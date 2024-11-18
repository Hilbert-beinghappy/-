clc,clear
prob=optimproblem;
x=optimvar('x',6,'LowerBound',0);
y=optimvar('y',6,'LowerBound',0);
a=[1.25,8.75,0.5,5.75,3,7.25];
b=[1.25,0.75,4.75,5,6.5,7.75];
c=[a',b'];
p_1=[5,1];
p_2=[2,7];
d=distant(p_1,c)

