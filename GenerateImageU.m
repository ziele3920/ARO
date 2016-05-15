function result = GenerateImageU(n, p1, a1, b1, a2, b2)

result = zeros(n, 2);

for i = 1 : n
   
    divider = rand;
    
    if divider < p1 
        result(i,1) = rand * (b1-a1) + a1;
        result(i,2) = 1;
    else
        result(i,1) = rand * (b2-a2) + a2;
        result(i,2) = 2;
    end
    

end