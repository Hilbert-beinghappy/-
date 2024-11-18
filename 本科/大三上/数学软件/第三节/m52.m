format long
Sum=0;
x=31*pi/2;
i=1;
while abs((-1)^(i-1)*x^(2*i-1)/factorial(2*i-1))>10e-16
    Sum=Sum+(-1)^(i-1)*x^(2*i-1)/factorial(2*i-1);
    i=i+1;
end
disp(Sum);
disp(sin(x));