syms x

T = sym(zeros(1, 11));

T(1) = 1;
T(2) = x;
for n = 3:11
    T(n) = 2*x*T(n-1) - T(n-2);
end

disp('��10��Chebyshev����ʽ T10(x) �ǣ�');
disp(T(11));