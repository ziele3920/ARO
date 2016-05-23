function result = CountErrMNN(steps, nLStep0, stepMultipler, littleSteps, subImage, p1, mi1, sig1, mi2, sig2)

nLearn = nLStep0;
result = zeros(steps, 2);
[nSub, o] = size(subImage);

for i = 1 : steps
    result(i,1) = nLearn;
    for j = 1 : littleSteps
        learnImageN = GenerateImageN(nLearn, p1, mi1, sig1, mi2, sig2);
        result(i,2) = result(i,2) + MN(learnImageN, subImage);
    end
    nLearn = nLearn * stepMultipler;
    result(i,2) = result(i,2)/(littleSteps * nSub);
end
end


