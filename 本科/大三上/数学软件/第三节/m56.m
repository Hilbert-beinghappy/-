score = input('请输入成绩(百分制):');

if score >= 90 && score <= 100
    grade = 'A';
elseif score >= 80 && score < 90
    grade = 'B';
elseif score >= 70 && score < 80
    grade = 'C';
elseif score >= 60 && score < 70
    grade = 'D';
elseif score >= 0 && score < 60
    grade = 'E';
else
    grade = '无效成绩';
end

fprintf('对应的等级是: %s\n', grade);