function resultErr = BayesN(subjectImage, p1, mi1, sig1, mi2, sig2)

resultErr = 0;
[n, m] = size(subjectImage);
p2 = 1 - p1;
for i = 1 : n
    
   class = 2;
   
    if p1*normpdf(subjectImage(i, 1),mi1, sig1) > p2 * normpdf(subjectImage(i, 1), mi2, sig2)
        class = 1;
    end
    
    if class ~= subjectImage(i, 2)
        resultErr = resultErr + 1;
    end
    
end

end