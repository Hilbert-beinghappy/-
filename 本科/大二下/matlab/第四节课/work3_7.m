clc,clear
prob=optimproblem('ObjectiveSense','max');
v=optimvar('v',1,'LowerBound',0);
x=optimvar('x',1,'LowerBound',0);
prob.Objective =2*x+v;
prob.Constraints.con1=5*v<=15;
prob.Constraints.con2=6*x+2*v<=24;
prob.Constraints.con3=x+v<=5;
[sol,fval,flag]=solve(prob)
xx=sol.x,yy=sol.v