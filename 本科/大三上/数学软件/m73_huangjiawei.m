
vector_operation(1,2,3)



function result = vector_operation(a, b, c)
    if nargin == 2
        result = a + b;
    elseif nargin == 3
        len_a = length(a);
        len_b = length(b);
        len_c = length(c);
        if len_a < len_b
            a = [zeros(1, len_b - len_a), a];
        elseif len_a > len_b
            b = [zeros(1, len_a - len_b), b];
        end
        if len_b < len_c
            b = [zeros(1, len_c - len_b), b];
        elseif len_b > len_c
            c = [zeros(1, len_b - len_c), c];
        end
        result = a - b;
    end
end