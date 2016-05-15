repeats = 10; steps = 5; littleSteps = 40;
nLearn = 10; nStep = 10; nSub = 1000000;
p1 = 0.43;
mi1 = 100; sig1 = 40;
mi2 = 200; sig2 = 45;

result = zeros(steps, 2);



for i = 1 : steps
    result(i,1) = nLearn;
    for j = 1 : littleSteps
        subImage = GenerateImageN(nSub, p1, mi1, sig1, mi2, sig2);
        learnImageN = GenerateImageN(nLearn, p1, mi1, sig1, mi2, sig2);
        result(i,2) = result(i,2) + MN(learnImageN, subImage);
    end
    nLearn = nLearn * nStep;
    result(i,2) = result(i,2)/(littleSteps * nSub);
end

result


