function [ newloc ] = convert( loc )
%UNTITLED2 이 함수의 요약 설명 위치
%   자세한 설명 위치
row = size(loc,1);
if(row > 8)
	loc(9:row, :) = []
end
newloc = loc;
disp(newloc);
end

