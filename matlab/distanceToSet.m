function dist = distanceToSet(A, point)
dist = Inf;
for i = 1:size(A)
  dist = min(dist, sqrt(sum((A(i, :) - point) .^ 2)));
end