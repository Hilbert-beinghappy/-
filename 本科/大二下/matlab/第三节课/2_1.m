clc,clear
prob=optimproblem;
x=optimvar('x',6,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = sum(x);
prob.Constraints.con1=x(1)+x(2)+x(3)>=1;
prob.Constraints.con2=x(2)+x(4)>=1;
prob.Constraints.con3=x(3)+x(5)>=1;
prob.Constraints.con4=x(4)+x(6)>=1;
prob.Constraints.con5=x(6)+x(5)>=1;
prob.Constraints.con6=x(1)>=1;
prob.Constraints.con1=x(4)+x(2)+x(6)>=1;
[sol,fval,flag]=solve(prob),xx=sol.x