A=randi(1000,1000);
x = A\ones(size(A, 1), 1);

if isempty(x)
    disp('����A�����棬�޷���⡣');
else
    disp('����A���棬��Ϊ��');
    disp(x);
end

M = magic(20);

save('magic20.mtx', 'M', '-v7.3');