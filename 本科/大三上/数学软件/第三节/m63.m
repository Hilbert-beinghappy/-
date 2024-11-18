syms x y;
[solx,soly]=solve(x^2+y^2-4,x^2-y^2-1,x,y);
disp(solx);
disp(soly);