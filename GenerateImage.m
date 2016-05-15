function result = GenerateImage(n, p1, m1, sig1, m2, sig2)

result = zeros(n, 2);

for i = 1 : n
   
    divider = rand();
    
    if divider > p1 
        result(i,1) = normrnd(m1, sig1);
        result(i,2) = 1;
    else
        result(i,1) = normrnd(m2, sig2);
        result(i,2) = 2;
    end
    
end