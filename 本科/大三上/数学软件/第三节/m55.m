maxNumber=110;
primeNumbers = []; 
number = 2; 
maxPrime=0;
while number <= maxNumber
    isPrime = true; 
    for i = 2:sqrt(number)
        if mod(number, i) == 0
            isPrime = false; 
            break;
        end
    end
    if isPrime
        primeNumbers = [primeNumbers, number];
        if  number>=maxPrime
            maxPrime=number;
        end
    end
    number = number + 1; 
end
disp('最大素数为：');
disp(maxPrime);