clc,clear
prob=optimproblem('ObjectiveSense','max');
x=optimvar('x',4,'LowerBound',-1,'UpperBound',1);
c=[6,8,4,2];
Q=[-1,2,0,0;2,-1,2,0;0,2,-1,2;0,0,2,-1];
prob.Objective = c*x+0.5*x'*Q*x;
prob.Constraints.con1=x(1)*x(2)+x(3)*x(4)>=-1;
prob.Constraints.con2=x(1)*x(2)+x(3)*x(4)<=1;
prob.Constraints.con3=x(1)+x(2)+x(3)+x(4)>=-3;
prob.Constraints.con3=x(1)+x(2)+x(3)+x(4)<=2;
x0.x=rand(4,1);
[sol,fval,flag,out]=solve(prob,x0),xx=sol.x;
