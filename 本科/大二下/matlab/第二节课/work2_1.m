clc,clear
prob=optimproblem('ObjectiveSense','max');
x = optimvar('x',11,'LowerBound',0);
prob.Objective = 1.15*x(9)+1.40*x(4)+1.25*x(7)+1.06*x(11);
prob.Constraints.con1 = x(1)+x(2)==10;
prob.Constraints.con2 =x(3)+x(4)+x(5)-1.06*x(2)==0;
prob.Constraints.con3 =	x(6)+x(7)+x(8)-1.15*x(1)-1.06*x(5)==0;
prob.Constraints.con4 =	x(9)+x(10)-1.15*x(3)-1.06*x(8)==0;
prob.Constraints.con5 =1.15*x(6)+1.06*x(10)-x(11)==0;
prob.Constraints.con6 =x(7)<=4;
prob.Constraints.con7=x(4)<= 3;	
[sol,fval,flag,out]=solve(prob),sol.x;
xx=sol.x
	

