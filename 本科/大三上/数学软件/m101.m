syms x;

T(1)={1};
T(2)={x};
for i=3:11
    T(i)=2*x*T(i-1)-T(i-2);
end

disp(T(11));