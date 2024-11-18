% 导入数据
clear;
x=1;%x=1时为A园区 2时为B园区 3时为C园区
L = readmatrix("附件1：各园区典型日负荷数据.xlsx");
L = L(:, 2:end);
P = readmatrix("附件2：各园区典型日风光发电数据.xlsx");
P = P(3:end, 2:end);
p = [750 1000 600 500];
Pp = p .* P;  % 各园区发电量

% 各园区各时刻风电功率 (kW)
P_wind = [zeros(size(P, 1), 1) Pp(:, [2, 4])];
% 各园区各时刻光伏功率 (kW)
P_solar = [Pp(:, 1) zeros(size(P, 1), 1) Pp(:, 3)];

% 转置矩阵
P_wind = P_wind';
P_solar = P_solar';
L = L';

% 定义参数
T = 24;  %24h
n = 3;   % 园区数量

C_grid = 1;  % 主电网购电价格 (元/kWh)
C_wind = 0.5;  % 风电发电成本 (元/kWh)
C_solar = 0.4; % 光伏发电成本 (元/kWh)

eta_charge = 0.95;  % 储能充电效率
eta_discharge = 0.95;  % 储能放电效率
SOC_min = 0.1;  % 储能最小允许状态
SOC_max = 0.9;  % 储能最大允许状态
P_batt_max = 0;  % 储能最大充放电功率 (kW)
E_batt_max = 0;  % 储能容量

% 储能系统成本
C_batt_power = 50;  % 储能功率单价 (元/kW)
C_batt_energy = 1800;  % 储能容量单价 (元/kWh)
prob = optimproblem;

% 变量定义
P_batt_charge = optimvar('P_batt_charge', n, T, 'Type', 'continuous', 'LowerBound',-P_batt_max, 'UpperBound', P_batt_max);
E_batt = optimvar('E_batt', n, T+1, 'Type', 'continuous', 'LowerBound', SOC_min * E_batt_max, 'UpperBound', SOC_max * E_batt_max);
P_grid= optimvar('P_grid',n,T,'Type', 'continuous','LowerBound',0);
%定义 P_grid 作为计算变量
i = x;

% 目标函数
Cost_grid = C_grid * sum(P_grid(x,:));
Cost_wind = C_wind * sum(P_wind(x,:));
Cost_solar = C_solar * sum(P_solar(x,:));
Cost_batt_power = C_batt_power * P_batt_max;
Cost_batt_energy = C_batt_energy * E_batt_max;

prob.Objective  = Cost_grid + Cost_wind + Cost_solar +(Cost_batt_energy+Cost_batt_power)/3650;

% 约束条件
cons1 = [];
cons2 = [];
% 能量平衡约束
i = x;
for t = 1:T
    %Pg = L(i, t) - P_wind(i, t) - P_solar(i, t) + P_batt_charge(i, t) - P_batt_discharge(i, t);
    cons1 = [P_grid(i,t)-L(i,t)+P_wind(i, t)+ P_solar(i, t)+P_batt_charge(i, t)>=0,cons1];
    cons1 = [P_grid(i,t)>=0,cons1];
end

% 储能电量变化约束

i = x;
for t = 1:T
    cons2 = [E_batt(i, t+1) == E_batt(i, t) + eta_charge * P_batt_charge(i, t)];
end


% 储能初始状态约束
prob.Constraints.con1=cons1;
prob.Constraints.con2=cons2;
prob.Constraints.con3=E_batt(i, 1) == E_batt(i, T+1);
% 创建优化问题

[sol, fval, exitflag, output] = solve(prob);
% 输出
disp('优化结果:');
disp(sol);
disp('最小化目标函数值:');
disp(fval);