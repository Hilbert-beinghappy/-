clear,clc
n=1;
count=0;
prime=[];
for i=3:2000
    if isprime(i)==1
        prime=[prime;i];
    end
end

for i=3:2000
    
    for a=prime
        for b=prime
            if i==a+b
                count=count+1
            end
        end
    end 
end
if count==0
    disp('���ӣ����ϸ�°ͺղ��룬�����Ʒ���');
end