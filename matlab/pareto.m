function PU = pareto(U)

PU = [];

for i = 1:size(U)
  dominated = false;
  for j = 1:size(U)
    dominated = dominated || all(U(i, :) > U(j, :));
  end
  if dominated == false
    PU = [PU; U(i,:)];
  end
end
