clc,clear
prob=optimproblem('ObjectiveSense','max');
a=randi([0,10],100,150);
v=optimvar('v',1,'LowerBound',0)
x=optimvar('x',100,'LowerBound',0);
prob.Objective =v;
prob.Constraints.con1=a'*x>=v;
prob.Constraints.con2=sum(x)==100;
[sol,fval,flag]=solve(prob),xx=sol.x;