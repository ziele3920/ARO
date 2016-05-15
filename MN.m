function resultErr = MN(learnImage, newImage)

sum1 = 0; count1 = 0;
sum2 = 0; count2 = 0;

resultErr = 0;
[n, m] = size(learnImage);

for i =  1 : n 
   
    if learnImage(i, 2) == 1
        sum1 = sum1 + learnImage(i,1);
        count1 = count1 + 1;
    else
        sum2 = sum2 + learnImage(i, 1);
        count2 = count2 + 1;
    end    
   
end

mi1 = sum1/count1;
mi2 = sum2/count2;

for i = 1 : n 
   
    x = newImage(i,1);
    class = 2;
    
    if(abs(x-mi1) < abs(x-mi2))
        class = 1;
    end
    
    if(class ~= newImage(i,2))
        resultErr = resultErr + 1;
    end
    
end

