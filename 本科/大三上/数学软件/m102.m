n=1;
Flag=0;
while Flag==0

    n=n+1;

    if mod(n,2)==1&&mod(n,3)==2&&mod(n,5)==4&&mod(n,5)==4&&mod(n,6)==5&&mod(n,7)==0

        Flag=1;

    end

end
disp('该阶梯至少有')
disp(n);