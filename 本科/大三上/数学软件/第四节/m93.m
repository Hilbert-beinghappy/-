A=randi(1000,1000);
x = A\ones(size(A, 1), 1);

if isempty(x)
    disp('矩阵A不可逆，无法求解。');
else
    disp('矩阵A可逆，解为：');
    disp(x);
end

M = magic(20);

save('magic20.mtx', 'M', '-v7.3');