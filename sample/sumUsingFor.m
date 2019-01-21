function [ y ] = sumUsingFor( x, tx, imfs, sum )
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치
y=[;];
disp(sum);
for x = 3 : tx
    sum = sum + imfs(x,:);
end

y = sum;
disp(y);

end