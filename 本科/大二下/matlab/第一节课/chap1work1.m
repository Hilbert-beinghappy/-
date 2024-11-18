clc,clear
c=[1:4]';
b=[0,1,-1/2]';
a=[1,-1,-1,1;1,-1,1,-3;1,-1,-2,3];
prob=optimproblem;
u=optimvar('u',4,'LowerBound',0);
v=optimvar('v',4,'LowerBound',0);
prob.Objective=sum(c'*(u+v));
prob.Constraints=a*(u-v)==b;
[sol,fval.flag,out] =solve(prob)
x=sol.u-sol.v