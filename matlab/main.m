%% data setup
%  rozdzial 6.3

% s?owno muzycznie:
% chodzi o to aby w przestrzeni rozwi?za? maj?c dostarczone kilka
% mozliwosci, konkretnie w takich kategoriach: "najlepsze, zno?ne, z?e"
% wiadomo ?e nasze rozwi?zanie trzeba zbli?y? jak naj bardziej do
% najlepszego i najdalej od najgorszego.

N = 50;

% decision space
U = randi([8, 15], [N 2]);
PU = pareto(U);

% lower bound gdzie to jeszcze ma sens...
A0 = [ 2 1
       1 3 ];

% ideal points - idealne rozw
A1 = [ 6 12
       8  7 
       16 4 ];

% attainable points - zno?ne rozw
A2 = [ 14  8
       12 11
       10 12
       8  16 ];
   
% anti-idea points - tragiczne rozw od czego chcemy sie oddalic
A3 = [ 20 12 
       19 14
       18 15
       17 18 ];

% util value a1 < a2 < a3

paretoN = size(PU);
distances = zeros(paretoN, 4);
for i = 1:paretoN
    distances(i,:) = [distanceToSet(A0, PU(i,:)) distanceToSet(A1, PU(i,:)) distanceToSet(A2, PU(i,:)) distanceToSet(A3, PU(i,:))];
end

for i = 1:paretoN
    distances(i,:) = [distanceToSet(A0, PU(i,:)) distanceToSet(A1, PU(i,:)) distanceToSet(A2, PU(i,:)) distanceToSet(A3, PU(i,:))];
end

% here all elements surpassing A0 or A3 should be dropped as incorrect

grades = zeros(paretoN, 1);
for i = 1:paretoN
    grades(i) = distances(i, 1) - distances(i, 2);
end
[bestGrade, bestIndex] = min(grades);

close all;
figure(1);
hold;
xlim([0 25]);
ylim([0 25]);
pl0 = plot(A0(:,1), A0(:,2), 'b*-');
pl1 = plot(A1(:,1), A1(:,2), 'g*-');
pl2 = plot(A2(:,1), A2(:,2), 'c*-');
pl3 = plot(A3(:,1), A3(:,2), 'r*-');
pl4 = plot(U(:,1), U(:,2), 'y*');
pl5 = plot(PU(:,1), PU(:,2), 'm*');
pl6 = plot(PU(bestIndex,1), PU(bestIndex,2), 'k*');
legend([pl0, pl1, pl2, pl3, pl4, pl5, pl6], 'A0 - lower bound', 'A1 - ideal points', 'A2 - attainable points', 'A3 - anti-ideal points', 'input set U', 'pareto optimal set PU', 'Best value found by refset');
hold off;

figure(2);
hold;
pldistA0 = plot(distances(:, 1), 'b*');
pldistA1 = plot(distances(:, 2), 'g*');
pldistA2 = plot(distances(:, 3), 'c*');
pldistA3 = plot(distances(:, 4), 'r*');
plGrades = plot(grades(:), 'k*');
legend([pldistA0, pldistA1, pldistA2, pldistA3, plGrades], 'Distances to A0 - lower bound (min)', 'Distances to A1 - ideal points (min)', 'Distances to A2 - attainable points (max)', 'Distances to A3 - anti-ideal points (max)', 'input set U', 'pareto optimal set PU', 'Grades (min)');
hold off;

%% consistency checking
%  rozdzial 6.4

% check internal consistency
% internalValid = checkInternalConsistency([A0 A1 A2 A3])
mutualValid = checkMutualConsistency(A0, A1, A2, A3);


% check mutual consistency
