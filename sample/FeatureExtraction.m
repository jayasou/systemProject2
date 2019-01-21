function [startMaxTime, startMinTime, m1, m2] = FeatureExtraction( data )
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치
[m1,j1] = max(data); %max
[m2,j2] = min(data); %min

s = 0;

for i = j1 : -1 : 1
   
    if(data(i) <= 0)
        s = i;
        break;
    end
end

temp = abs(data);
[m3,j3] = min(temp(j1:j2));
j3 = j1+j3;

startMaxTime = (j1-s)/512;
startMinTime = (j2-j3)/512;

end

