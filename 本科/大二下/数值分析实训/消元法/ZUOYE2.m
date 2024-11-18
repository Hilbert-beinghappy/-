% 导入数据
clear; 
L = readmatrix("附件1：各园区典型日负荷数据.xlsx");
L = L(:, 2:end);
P = readmatrix("附件2：各园区典型日风光发电数据.xlsx");
P = P(3:end, 2:end);
p = [750 1000 600 500];
Pp = p .* P;  % 发电量

% 各园区各时刻风电功率 (kW)
P_wind = [zeros(size(P, 1), 1) Pp(:, [2, 4])];
% 各园区各时刻光伏功率 (kW)
P_solar = [Pp(:, 1) zeros(size(P, 1), 1) Pp(:, 3)];

% 转置风电和光伏功率矩阵，以便与负荷矩阵匹配
P_wind = P_wind';
P_solar = P_solar';
L = L';

% 定义参数
T = 24;  % 时间步数
n = 3;   % 园区数量

C_grid = 1.0;  % 主电网购电价格 (元/kWh)
C_wind = 0.5;  % 风电发电成本 (元/kWh)
C_solar = 0.4; % 光伏发电成本 (元/kWh)
min=10000000;
jj=0;
kk=0;
for j=1:400
    for k=1:800
eta_charge = 0.95;  % 储能充电效率
eta_discharge = 0.95;  % 储能放电效率
SOC_min = 0.1;  % 储能最小允许状态
SOC_max = 0.9;  % 储能最大允许状态
P_batt_max = j;  % 储能最大充放电功率 (kW)
E_batt_max = k;  % 储能容量

% 储能系统成本
C_batt_power = 800;  % 储能功率单价 (元/kW)
C_batt_energy = 1800;  % 储能能量单价 (元/kWh)

% 变量定义
P_batt_charge = optimvar('P_batt_charge', n, T, 'Type', 'continuous', 'LowerBound', 0, 'UpperBound', P_batt_max);
P_batt_discharge = optimvar('P_batt_discharge', n, T, 'Type', 'continuous', 'LowerBound', 0, 'UpperBound', P_batt_max);
E_batt = optimvar('E_batt', n, T+1, 'Type', 'continuous', 'LowerBound', SOC_min * E_batt_max, 'UpperBound', SOC_max * E_batt_max);
P_grid = optimexpr(n, T);

% 定义 P_grid 作为计算变量
for i = 1:n
    for t = 1:T
        P_grid(i, t) = L(i, t) - P_wind(i, t) - P_solar(i, t) + P_batt_charge(i, t) - P_batt_discharge(i, t);
    end
end

% 目标函数
cost_grid = C_grid * sum(sum(P_grid));
cost_wind = C_wind * sum(sum(P_wind));
cost_solar = C_solar * sum(sum(P_solar));
cost_batt_charge = C_batt_power * sum(sum(P_batt_charge));
cost_batt_discharge = C_batt_power * sum(sum(P_batt_discharge));

objective = cost_grid + cost_wind + cost_solar ;

% 约束条件
cons = optimconstr;

% 能量平衡约束
for i = 1:n
    for t = 1:T
        cons(end+1) = P_grid(i, t) == L(i, t) - P_wind(i, t) - P_solar(i, t) + P_batt_charge(i, t) - P_batt_discharge(i, t);
    end
end

% 储能电量变化约束
for i = 1:n
    for t = 1:T
        cons(end+1) = E_batt(i, t+1) == E_batt(i, t) + eta_charge * P_batt_charge(i, t) - P_batt_discharge(i, t) / eta_discharge;
    end
end

% 储能初始状态约束
for i = 1:n
    cons(end+1) = E_batt(i, 1) == E_batt(i, T+1);
end

% 创建优化问题
prob = optimproblem('Objective', objective, 'Constraints', cons);

% 求解优化问题
[sol, fval, exitflag, output] = solve(prob);

while fval<min
    min=fval;
    jj=j;
    kk=k;
    disp(min)
end

    end
end









