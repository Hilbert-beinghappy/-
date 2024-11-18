clc, clear, close all, n = 9;
nod =cellstr(strcat('v',int2str([0:n-1]')));%运用cellstr进行标号
G = graph(); G = addnode(G,nod); %定好无序图
ed ={ 'v0','v1',2;'v0','v2',1;'v0','v3',3;'v0','v4',4
    'v0','v5',4;'v0','v6',2;'v0','v7',5;'v0','v8',4
    'v1','v2',4;'v1','v8',1;'v2','v3',1;'v3','v4',1
    'v4','v5',5;'v5','v6',2;'v6','v7',3;'v7','v8',5};
G = addedge(G,ed(:,1),ed(:,2),cell2mat(ed(:,3)));%无序图确认 
p = plot(G,'EdgeLabel',G.Edges.Weight) %做出9个村庄道路及道路长度图
w = full(adjacency(G,'weighted')); %做出边权矩阵
w(w==0) = 1000000; %充分大的正实数，让所有不能直接到达的两个村庄改为足够大
prob = optimproblem;
x = optimvar('x',n,n,'Type','integer','LowerBound',0,'UpperBound',1);
prob.Objective = sum(sum(w.*x));
prob.Constraints.con1 = 1<=sum(x(1,:));%条件1
prob.Constraints.con2 = sum(x(:,2:end))'==1; %条件2
con3 = [];
for q = 2:n-1
    a = zeros(q);
    for m = 1:100 %100次足够精度
        b = randperm(n);%随机对n数进行排序
        c = b(1:q); %相当于从n中随机抽取p个数
        a = x(c,c);
        con3 = [sum(sum(a)) <= q-1;con3];
    end
end    
prob.Constraints.con3 = con3;%条件3
[sol,fval,flag,out] = solve(prob)
xx = sol.x  
[i,j]=find(sol.x);
ind = [(i-1)'; (j-1)'] %输出树的顶点编号
