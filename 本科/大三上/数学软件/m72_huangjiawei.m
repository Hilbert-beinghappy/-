function sum = Factorial(varargin)
    if length(varargin) == 1
        error('��Ҫ������������������');
    else
        sum = 0;
        for i = 1:length(varargin)
            sum = sum + factorial(varargin{i});
        end
    end
end