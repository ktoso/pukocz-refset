function [ valid ] = checkInternalConsistency(A)
%CHECKINTERNALCONSISTENCY Summary of this function goes here
%   check if the A matrix is internally consistent

valid = true;

for i = 1:size(A)
  a = A(i,:);
  
  for j = 1:size(A)
    b = A(j,:);
    
    w = a < b; % checks for each criteria
    if sum(w) == size(w, 2) % is dominated
      valid = false;
      return;
    end
  end
end