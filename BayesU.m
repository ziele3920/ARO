function resultErr = BayesU(subjectImage, a, b)

[n, m] = size(subjectImage);
resultErr = 0;

for i = 0 : n
 
    class = 2;
    if p1*unipdf(subjectImage(i, 1), a, b) > p2 * unipdf(subjectImage(i, 1), a, b)
        class = 1;
    end
    
    if class ~= subjectImage(i, 2)
        resultErr = resultErr + 1;
    end
    
end


end

