function result = CountErraNNU(a, steps, nLStep0, stepMultipler, littleSteps, nSub, p1, a1, b1, a2, b2)

nLearn = nLStep0;
result = zeros(steps, 2);

for i = 1 : steps
    result(i,1) = nLearn;
    for j = 1 : littleSteps
        subImage = GenerateImageU(nSub, p1, a1, b1, a2, b2);
        learnImageN = GenerateImageU(nLearn, p1, a1, b1, a2, b2);
        result(i,2) = result(i,2) + aNN(learnImageN, subImage, a);
    end
    nLearn = nLearn * stepMultipler;
    result(i,2) = result(i,2)/(littleSteps * nSub);
end
end