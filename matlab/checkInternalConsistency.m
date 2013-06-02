function [ valid ] = checkInternalConsistency(A)
%CHECKINTERNALCONSISTENCY Summary of this function goes here
%   check if the A matrix is internally consistent

valid = 1;

for i = 0:size(A)
  for j = 0:size(A)
      if ((i ~= j) && A(i))
          valid = 0;
      end
  end
end

