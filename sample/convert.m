function [ newloc ] = convert( loc )
%UNTITLED2 �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
row = size(loc,1);
if(row > 8)
	loc(9:row, :) = []
end
newloc = loc;
disp(newloc);
end

