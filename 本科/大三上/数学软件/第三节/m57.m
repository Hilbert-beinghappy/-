grade = input('请输入成绩等级(A, B, C, D, E):', 's');

switch grade
    case 'A'
        scoreRange = '90--100';
    case 'B'
        scoreRange = '80--89';
    case 'C'
        scoreRange = '70--79';
    case 'D'
        scoreRange = '60--69';
    case 'E'
        scoreRange = '0--59';
    otherwise
        scoreRange = '无效等级';
end

fprintf('对应的分数区间是: %s\n', scoreRange);