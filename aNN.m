function resultErr = aNN(learnImage, newImage, a)

resultErr = 0;
[n, m] = size(newImage);

for i = 1 : n
    neighboursIndex = GetNeighbours(a, learnImage, newImage(i, 1));
    k = size(neighbourIndex);
    class1count = 0; class2count = 0; class =  2;
    
    for j = 1 : k
        
        if learnImage(neighboursIndex(j), 2) == 1
            class1count = class1count + 1;
        else
            class2count = class2count + 1;
        end
    end
    
    if class1count > class2count
        class = 1;
    end
    
    if class ~= newImage(i, 2)
        resultErr = resultErr + 1;
    end
end
end

