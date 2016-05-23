function result = CountErrBayesU(steps, nLStep0, stepMultipler, littleSteps, subImage, p1, a1, b1, a2, b2)

nLearn = nLStep0;
result = zeros(steps, 2);
[nSub, o] = size(subImage);

for i = 1 : steps
    result(i,1) = nLearn;
    for j = 1 : littleSteps
        result(i,2) = result(i,2) + BayesU(subImage, p1, a1, b1, a2, b2);
    end
    nLearn = nLearn * stepMultipler;
    result(i,2) = result(i,2)/(littleSteps * nSub);
end
end