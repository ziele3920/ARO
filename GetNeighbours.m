function neighboursIndex = GetNeighbours(a, image, value)

workImage = image(:,1);
workImage = abs(workImage - value);
[sorted, index] = sort(workImage);
neighboursIndex = index(1:a);

end