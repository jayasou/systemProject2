function [ y ] = sumUsingFor( x, tx, imfs, sum )
%UNTITLED �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
y=[;];
disp(sum);
for x = 3 : tx
    sum = sum + imfs(x,:);
end

y = sum;
disp(y);

end