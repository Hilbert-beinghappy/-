 clc,clear
 f=@(t,z)[-z(1)^3-z(2);z(1)-z(2)^3];
 s=ode45(f,[0,30],[1;0.5])%使用求解器求解
 subplot(121),fplot(@(t)deval(s,t,1),[0,30],'--','LineWidth',1.3)
 hold on ,fplot(@(t)deval(s,t,2),[0,30],'--','LineWidth',1.3)
 legend({'x(t)','y(t)'},'Location','best','Interpreter','latex')
 xlabel('t','Interpreter','latex')
 subplot(122),fplot(@(t)deval(s,t,1),@(t)deval(s,t,2),[0,30],'k')
 xlabel('x','Interpreter','latex')
 ylabel('y','Interpreter','latex','Rotation',0)