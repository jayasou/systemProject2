function [ eogFeature1 ] = getPeaks( norm, loc, size_r )
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치

row = size(loc,1);
disp(row);

for j = 1:row
    if j < row
    [minp, n] = min(norm(loc(j):loc(j+1)));
    
    sloc1 = loc(j)-n:loc(j)+(n*3);
    yloc1 = [];
    if(sloc1(1,1) < 0)
        num = abs(sloc1(1,1));
        yloc1 = sloc1 + num + 1;
    else
        yloc1 = sloc1;
    end
    
    [start1, start2, m1, m2] = FeatureExtraction(norm(yloc1));
    ar = arburg(norm(yloc1),8); 

    else
        sloc = loc(j)-n:loc(j)+(n*3);
          yloc = [];
          if(sloc(1,1) < 0)
              num = abs(sloc(1,1));
              yloc = sloc + num + 1;
          else
           yloc = sloc;
         end
        [minp, n] = min(norm(loc(8):size_r));
        [start1, start2, m1, m2] = FeatureExtraction(norm(yloc));
        ar = arburg(norm(yloc),8);
    end
    chknum = 0;
    inputnum = -1;
    if isnan(start1) == 1
        chknum = 1;
    end
    if isnan(start2) == 1
        chknum = 2;
    end
    if isnan(m1) == 1
        chknum = 3;
    end
    if isnan(m2) == 1
        chknum = 4;
    end
    if chknum == 1
        eogFeature1(:,j) = [0; start2; m1; m2; ar'];
    end
   
    if chknum == 2
        eogFeature1(:,j) = [start1; 0; m1; m2; ar'];
    end
    if chknum == 3
        eogFeature1(:,j) = [start1; start2; 0; m2; ar'];
    end
    if chknum == 4
        eogFeature1(:,j) = [start1; start2; m1; 0; ar'];
    end
    if chknum == 0
        eogFeature1(:,j) = [start1; start2; m1; m2; ar'];
    end 
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