function [ eogFeature1 ] = getPeaks( norm, loc, size_r )
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치
for i = 1:8
    if i < 8
    [minp, n] = min(norm(loc(i):loc(i+1)));
    [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
    ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8); 
    else
        [minp, n] = min(norm(loc(8):size_r));
        [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
        ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
    end
   eogFeature1(:,i) = [start1; start2; m1; m2; ar'];
 
end

end

function [startMaxTime, startMinTime, m1, m2] = FeatureExtraction( data )
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치
[m1,i1] = max(data); %max
[m2,i2] = min(data); %min

s = 0;

for i = i1 : -1 : 1
   
    if(data(i) <= 0)
        s = i;
        break;
    end
end

temp = abs(data);
[m3,i3] = min(temp(i1:i2));
i3 = i1+i3;

startMaxTime = (i1-s)/512;
startMinTime = (i2-i3)/512;
end