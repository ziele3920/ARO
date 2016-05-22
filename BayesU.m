function resultErr = BayesU(subjectImage,p1, a1, b1, a2, b2)

[n, m] = size(subjectImage);
resultErr = 0;
p2 = 1 - p1;
for i = 1 : n
 
    class = 2;
    if p1*unifpdf(subjectImage(i, 1), a1, b1) > p2 * unifpdf(subjectImage(i, 1), a2, b2)
        class = 1;
    end
    
    if class ~= subjectImage(i, 2)
        resultErr = resultErr + 1;
    end
    
end


end

