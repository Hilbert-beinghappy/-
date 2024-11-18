target = 4;
guess = 0;
while guess ~= target
    guess = input('猜一个数（1-100）：');
    if guess < target
        disp('太低了');
    elseif guess > target
        disp('太高了');
    else
        disp('恭喜你，猜对了！');
    end
end