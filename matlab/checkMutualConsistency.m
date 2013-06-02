function [ valid ] = checkMutualConsistency( A0, A1, A2, A3 )
%CHECKMUTUALCONSISTENCY Summary of this function goes here
% Check mutual consistency of A matricies, see contidions 6.6, 6.7
% 
% This requirement can be formulated as an as- sumption that each element of Aj should be dominated by an element of Aj+1, for 0 ? j ? K ? 1, i.e.
% ?x?Aj ?y?Aj+1 : x?? y. (6.6) 
% 
% In order to obtain the desired properties of the level sets of v ?, we have to impose an
% additional condition (6.7), symmetric to (6.6):
% ?x?Aj+1 ?y?Aj :x?? y, (6.7)
% 
% which allows us to formulate the following definition:
% Definition 6.3. The reference classes Aj, and Aj+1 satisfying the above conditions (6.6)-(6.7) will be called mutually consistent.

valid = 1;

for i = 1:size(A0)
    xi = A0(i,:)
    dominatorExists = 0;
    
    for j = 1:size(A1)
        xj = A1(j,:)
        
%         todo jak por?wnywa? w sumie?
        if xi <= xj 
            dominatorExists = 1;
        end
    end
    
    valid = dominatorExists;
end

end

