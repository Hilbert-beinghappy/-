clc,clear
prob=optimproblem('ObjectiveSense','max');
x=optimvar('x',3,'Type','integer','LowerBound',0,'UpperBound',1);
y=optimvar('y',1,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = x(1)+y-x(3);
prob.Constraints.con1=-2*x(1)+3*x(2)+x(3)<=3;
prob.Constraints.con2=x(1)+x(2)-1<=y;
prob.Constraints.con3=y<=x(1);
prob.Constraints.con4=y<=x(2);
[sol,fval,flag]=solve(prob),xx=sol.x