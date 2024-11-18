clc,clear
prob=optimproblem('ObjectiveSense','max');
b=[4,2,3,4;6,4,5,5;7,6,7,6;7,8,8,6;7,9,8,6;7,10,8,6]
x=optimvar('x',6,4,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = sum(b.*x,'all');
prob.Constraints.con1=sum(x,2)==1;
prob.Constraints.con2=sum(x,1)>=1;
[sol,fval,flag]=solve(prob),xx=sol.x