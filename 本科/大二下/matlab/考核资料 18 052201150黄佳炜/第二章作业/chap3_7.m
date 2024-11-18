clc,clear
prob=optimproblem;
R=[4,2.5,-10;2.5,36,-15;-10,-15,100]
x=optimvar('x',3,'LowerBound',0);
prob.Objective =x'*R*x;
x0.x=rand(3,1);
for n=0:100
prob.Constraints.con1=5*x(1)+8*x(2)+10*x(3)>=0.01*n*500000;
prob.Constraints.con2=20*x(1)+25*x(2)+30*x(3)<=500000;
[sol,fval,flag,out]=solve(prob,x0)
y=fval;
plot(0.01*n,y);
end