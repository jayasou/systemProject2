load('梯撩��10(700).mat') %營團檜 等檜攪 ж釭 菟堅褥...
%load('梯敘諫10(800).mat')
%load('梯營團2(800).mat')
% load('梯營團3(650).mat')
% load('梯營團4(700).mat')
% load('梯營團5(700).mat')
% load('梯營團6(750).mat')
% load('梯營團7(750).mat')
% load('梯營團8(750).mat')
% load('梯營團9(750).mat')
% load('梯營團10(750).mat')

temp = data10; 
sT = length(temp); %data1曖 望檜
imfs = emd(temp); %emd陛 鼠蝦 л熱檣雖 澀 賅腦啊棻
[tx,ty] = size(imfs);
sum = zeros(1,sT);

for x = 3 : tx
    sum = sum + imfs(x,:);
end
data1 = sum'; %% EMD

% maxV = max(data1);
[size_r, size_c] = size(data1);
% norm = data1/maxV;
norm = data1;

%罹晦 800擎 劂梱 .......
[peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 800);

[row col] = size(loc)
if(row > 8)
	loc(9:row, :) = []
end
disp(loc);

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
%load fisheriris
z = eogFeature1;
group = cell(1,8);
group(1,1:4) = {'virginica'};
group(1,5:8) = {'versicolor'};

svmStruct = svmtrain(z,group, 'ShowPlot',true);
disp(group);
disp(svmStruct);
vector = getfield(svmStruct, 'SupportVectors')
ScaleData = getfield(svmStruct, 'ScaleData')

x1 = getfield(ScaleData, 'shift');
x2 = getfield(ScaleData, 'scaleFactor');
mean(x2)

%sim = exp(-1*(x1-x2)'*(x1-x2)/(2*0.5*0.5));
%disp(sim);

% ar
% eogSum = [p1;p2;p3;p4;p5;p6;p7;p8];
% eogSum = diff(eogSum,2);
% eogAr = arburg(eogSum,32);

% ar32_1 = arburg(p1,32);
% ar32_2 = arburg(p2,32);
% ar32_3 = arburg(p3,32);
% ar32_4 = arburg(p4,32);
% ar32_5 = arburg(p5,32);
% ar32_6 = arburg(p6,32);
% ar32_7 = arburg(p7,32);
% ar32_8 = arburg(p8,32);
% 
% Jaemin32_1 = [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% Jaemin32_1 = Jaemin32_1';
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data2;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);

% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data2 = sum';
% 
% % maxV = max(data2);
% [size_r, size_c] = size(data2);
% % norm = data2/maxV;
% norm = data2;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 800);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature2(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% % ar
% 
% % eogSum2 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum2 = diff(eogSum2,2);
% % eogAr2 = arburg(eogSum2,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% % 
% % Jaemin32_2 = [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_2 = Jaemin32_2';
% % % 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data3;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data3 = sum';
% 
% maxV = max(data3);
% [size_r, size_c] = size(data3);
% % norm = data3/maxV;
% norm = data3;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 650);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature3(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% % ar
% 
% % eogSum3 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum3 = diff(eogSum3,2);
% % eogAr3 = arburg(eogSum3,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% 
% % Jaemin32_3 = [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_3 = Jaemin32_3';
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data4;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data4 = sum';
% 
% maxV = max(data4);
% [size_r, size_c] = size(data4);
% 
% % norm = data4/maxV;
% norm = data4;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 700);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature4(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% 
% % ar
% % eogSum4 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum4 = diff(eogSum4,2);
% % eogAr4 = arburg(eogSum4,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% 
% % Jaemin32_4 = [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_4 = Jaemin32_4';
% % 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data5;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data5 = sum';
% 
% maxV = max(data5);
% [size_r, size_c] = size(data5);
% 
% % norm = data5/maxV;
% norm = data5;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 700);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature5(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% 
% % ar
% 
% % eogSum5 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum5 = diff(eogSum5,2);
% % eogAr5 = arburg(eogSum5,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% 
% % Jaemin32_5= [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_5 = Jaemin32_5';
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data6;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data6 = sum';
% 
% maxV = max(data6);
% [size_r, size_c] = size(data6);
% 
% % norm = data6/maxV;
% norm = data6;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 750);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature6(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% 
% % eogSum6 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum6 = diff(eogSum6,2);
% % eogAr6 = arburg(eogSum6,32);
% 
% % ar
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% % 
% % Jaemin32_6= [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_6 = Jaemin32_6';
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data7;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data7 = sum';
% 
% maxV = max(data7);
% [size_r, size_c] = size(data7);
% 
% % norm = data7/maxV;
% norm = data7;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 750);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature7(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% 
% % ar
% % eogSum7 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum7 = diff(eogSum7,2);
% % eogAr7 = arburg(eogSum7,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% % Jaemin32_7 = [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_7 = Jaemin32_7';
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% temp = data8;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data8 = sum';
% 
% maxV = max(data8);
% [size_r, size_c] = size(data8);
% 
% % norm = data8/maxV;
% norm = data8;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 750);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature8(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% 
% % ar
% % eogSum8 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum8 = diff(eogSum8,2);
% % eogAr8 = arburg(eogSum8,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% % 
% % Jaemin32_8= [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_8 = Jaemin32_8';
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data9;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data9 = sum';
% 
% maxV = max(data9);
% [size_r, size_c] = size(data9);
% 
% % norm = data9/maxV;
% norm = data9;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 750);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature9(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% 
% % % ar
% % eogSum9 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum9 = diff(eogSum9,2);
% % eogAr9 = arburg(eogSum9,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% 
% % Jaemin32_9= [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_9 = Jaemin32_9';
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temp = data10;
% sT = length(temp);
% imfs = emd(temp);
% [tx,ty] = size(imfs);
% sum = zeros(1,sT);
% 
% for x = 3 : tx
%     sum = sum + imfs(x,:);
% end
% data10 = sum';
% 
% maxV = max(data10);
% [size_r, size_c] = size(data10);
% 
% % norm = data10/maxV;
% norm = data10;
% 
% [peaks, loc] = findpeaks(norm, 'MINPEAKDISTANCE', 750);
% 
% for i = 1:8
%     if i < 8
%     [minp, n] = min(norm(loc(i):loc(i+1)));
%     [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%     ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     else
%         [minp, n] = min(norm(loc(8):size_r));
%         [start1, start2, m1, m2] = FeatureExtraction(norm(loc(i)-n:loc(i)+(n*3)));
%         ar = arburg(norm(loc(i)-n:loc(i)+(n*3)),8);
%     end
%    eogFeature10(:,i) = [start1; start2; m1; m2; ar'];
%  
% end
% 
% % % ar
% % eogSum10 = [p1;p2;p3;p4;p5;p6;p7;p8];
% % eogSum10 = diff(eogSum10,2);
% % eogAr10 = arburg(eogSum10,32);
% 
% % ar32_1 = arburg(p1,32);
% % ar32_2 = arburg(p2,32);
% % ar32_3 = arburg(p3,32);
% % ar32_4 = arburg(p4,32);
% % ar32_5 = arburg(p5,32);
% % ar32_6 = arburg(p6,32);
% % ar32_7 = arburg(p7,32);
% % ar32_8 = arburg(p8,32);
% % 
% % Jaemin32_10 = [ar32_1;ar32_2;ar32_3;ar32_4;ar32_5;ar32_6;ar32_7;ar32_8];
% % Jaemin32_10 = Jaemin32_10';
% 
% % JaeminAr = [eogAr',eogAr2',eogAr3',eogAr4',eogAr5',eogAr6',eogAr7',eogAr8',eogAr9',eogAr10'];
% 
% a = randperm(10);
% Jaetrain = [];
% Jaetest = [];
% JaeFeature = [eogFeature1, eogFeature2, eogFeature3, eogFeature4, eogFeature5, eogFeature6, ...
%     eogFeature7, eogFeature8, eogFeature9, eogFeature10];
% for i = 1:8
%     if a(i) == 1
%         a1 = eogFeature1;
%         Jaetrain = [Jaetrain, a1];
%     elseif a(i) == 2
%         a2 = eogFeature2;
%         Jaetrain = [Jaetrain, a2];
%     elseif a(i) == 3
%         a3 = eogFeature3;
%         Jaetrain = [Jaetrain, a3];
%     elseif a(i) == 4
%         a4 = eogFeature4;
%         Jaetrain = [Jaetrain, a4];
%     elseif a(i) == 5
%         a5 = eogFeature5;
%         Jaetrain = [Jaetrain, a5];
%     elseif a(i) == 6
%         a6 = eogFeature6;
%         Jaetrain = [Jaetrain, a6];
%     elseif a(i) == 7
%         a7 = eogFeature7;
%         Jaetrain = [Jaetrain, a7];
%     elseif a(i) == 8
%         a8 = eogFeature8;
%         Jaetrain = [Jaetrain, a8];
%     elseif a(i) == 9
%         a9 = eogFeature9;
%         Jaetrain = [Jaetrain, a9];
%     elseif a(i) == 10
%         a10 = eogFeature10;
%         Jaetrain = [Jaetrain, a10];
%     end
% end
% 
% for i = 9:10
%     if a(i) == 1
%         a1 = eogFeature1;
%         Jaetest = [Jaetest, a1];
%     elseif a(i) == 2
%         a2 = eogFeature2;
%         Jaetest = [Jaetest, a2];
%     elseif a(i) == 3
%         a3 = eogFeature3;
%         Jaetest = [Jaetest, a3];
%     elseif a(i) == 4
%         a4 = eogFeature4;
%         Jaetest = [Jaetest, a4];
%     elseif a(i) == 5
%         a5 = eogFeature5;
%         Jaetest = [Jaetest, a5];
%     elseif a(i) == 6
%         a6 = eogFeature6;
%         Jaetest = [Jaetest, a6];
%     elseif a(i) == 7
%         a7 = eogFeature7;
%         Jaetest = [Jaetest, a7];
%     elseif a(i) == 8
%         a8 = eogFeature8;
%         Jaetest = [Jaetest, a8];
%     elseif a(i) == 9
%         a9 = eogFeature9;
%         Jaetest = [Jaetest, a9];
%     elseif a(i) == 10
%         a10 = eogFeature10;
%         Jaetest = [Jaetest, a10];
%     end
% end