function resultErr = BayesU(subjectImage, a, b)

[n, m] = size(subjectImage);
resultErr = 0;

for i = 0 : n
 
    class = 2;
    if p1*DestinyFunctionU(a, b) > p2 * DestinyFunctionU(a, b)
        class = 1;
    end
    
    if class ~= subjectImage(i, 2)
        resultErr = resultErr + 1;
    end
    
end


end

