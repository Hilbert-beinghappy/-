p = [816 -3835 6000 -3125];

% 求出 p(x) 的所有零点
rootsP = roots(p);
disp('p(x) 的所有零点为：');
disp(rootsP);


p=@(x)816*x^3-3835*x^2+6000*x-3125
% 用 fzero 计算 p(x) 的第二大零点
secondLargestRoot = fzero(p, [max(rootsP)/2 min(rootsP)]);
disp('p(x) 的第二大零点为：');
disp(secondLargestRoot);
