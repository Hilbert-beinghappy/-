clc, clear
c=[1-5*300/6000,1-321*7/10000,-6*250/4000,-4*783/7000,-200*7/4000,1.65-0.5-8*250/4000,1.65-321*9/10000-8*250/4000,2.3-321*12/10000-11*783/7000]';
b=[6000,10000,4000,7000,4000]';
a=[5,0,0,0,0,10,0,0;
   0,7,0,0,0,0,9,12;
   0,0,6,0,0,8,8,0;
   0,0,0,4,0,0,0,11;
   0,0,0,0,7,0,0,0];
prob = optimproblem('ObjectiveSense','max')
x = optimvar('x',8,'LowerBound',0);
prob.Objective = sum(c.*x);
prob.Constraints.con1 = a*x<=b;
prob.Constraints.con2 = x(1)+x(2)-x(3)-x(4)-x(5)==0;
[sol,fval,flag,out]=solve(prob)
xx=sol.x