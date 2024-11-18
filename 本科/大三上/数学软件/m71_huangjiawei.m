Fib(25)
function [P]=Fib(x)
    F(1)=1;F(2)=1;F(3)=2;

    if x==1||x==2
        P=1;
    else

        for i=3:x
            F(i)=F(i-1)+F(i-2);
        end

        P=F(x);
    end
end
     
    