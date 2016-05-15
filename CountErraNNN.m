function result = CountErraNNN(a, steps, nLStep0, stepMultipler, littleSteps, nSub, p1, mi1, sig1, mi2, sig2)

nLearn = nLStep0;
result = zeros(steps, 2);

for i = 1 : steps
    result(i,1) = nLearn;
    for j = 1 : littleSteps
        subImage = GenerateImageN(nSub, p1, mi1, sig1, mi2, sig2);
        learnImageN = GenerateImageN(nLearn, p1, mi1, sig1, mi2, sig2);
        result(i,2) = result(i,2) + aNN(learnImageN, subImage, a);
    end
    nLearn = nLearn * stepMultipler;
    result(i,2) = result(i,2)/(littleSteps * nSub);
end
end