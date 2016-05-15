function resultErr = BayesN(subjectImage, p1, mi1, sig1, mi2, sig2)

resultErr = 0;
[n, m] = size(subjectImage);

for i = 1 : n
    
   class = 2;
   
    if p1*DestinyFunctionN(mi1, sig1, subjectImage(i, 1)) > p2 * DestinyFunctionN(mi2, sig2, subjectImage(i, 1))
        class = 1;
    end
    
    if class ~= subjectImage(i, 2)
        resultErr = resultErr + 1;
    end
    
end

end