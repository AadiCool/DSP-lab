function [res] = my_vector_elementwise_multiply(input1,input2)
res = zeros(1, length(input1));
for i = 1:length(input1)
    res(i) = input1(i) * input2(i);
end

