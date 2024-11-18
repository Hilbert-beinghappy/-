syms x

T = sym(zeros(1, 11));

T(1) = 1;
T(2) = x;
for n = 3:11
    T(n) = 2*x*T(n-1) - T(n-2);
end

disp('第10阶Chebyshev多项式 T10(x) 是：');
disp(T(11));