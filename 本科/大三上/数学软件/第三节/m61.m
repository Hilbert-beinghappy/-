p = [6 0  -5 1 0];
q = [0 6  0 0 -1];

% 计算 p(x) + q(x)
sumPQ = p+q;

% 计算 p(x) * q(x)
productPQ = conv(p, q);

% 计算 p(x) 的导数
dp = polyder(p);

% 计算 q(x) 的导数
dq = polyder(q);

% 显示结果
disp('p(x) + q(x) = ');
disp(poly2sym (sumPQ));
disp('p(x) * q(x) = ');
disp(poly2sym (productPQ));
disp('p''(x) = ');
disp(poly2sym (dp));
disp('q''(x) = ');
disp(poly2sym (dq));