primeNumbers = []; 
number = 2; 
while number <= 100
    isPrime = true; 
    for i = 2:sqrt(number)
        if mod(number, i) == 0
            isPrime = false; 
            break;
        end
    end
    if isPrime
        primeNumbers = [primeNumbers, number]; 
    end
    number = number + 1; 
end
disp('1到100间的所有素数为：');
disp(primeNumbers);