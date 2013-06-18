%% data setup
%  rozdzial 6.3

INPUT_FILE = 'input.xls';

% decision space
U = xlsread(INPUT_FILE, 'U');
PU = pareto(U);


% lower bound gdzie to jeszcze ma sens...
A0 = xlsread(INPUT_FILE, 'A0')

% ideal points - idealne rozw
A1 = xlsread(INPUT_FILE, 'A1')

% attainable points - zno?ne rozw
A2 = xlsread(INPUT_FILE, 'A2')
   
% anti-idea points - tragiczne rozw od czego chcemy sie oddalic
A3 = xlsread(INPUT_FILE, 'A3')

% util value a1 < a2 < a3

paretoN = size(PU);
distances = zeros(paretoN, 4);
for i = 1:paretoN
    distances(i,:) = [distanceToSet(A0, PU(i,:)) distanceToSet(A1, PU(i,:)) distanceToSet(A2, PU(i,:)) distanceToSet(A3, PU(i,:))];
end

for i = 1:paretoN
    distances(i,:) = [distanceToSet(A0, PU(i,:)) distanceToSet(A1, PU(i,:)) distanceToSet(A2, PU(i,:)) distanceToSet(A3, PU(i,:))];
end

grades = zeros(paretoN, 1);
for i = 1:paretoN
    grades(i) = distances(i, 1) - distances(i, 2);
end

final = grades
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

best = [PU(bestIndex,1), PU(bestIndex,2)]

figure(2);
hold;
pldistA0 = plot(distances(:, 1), 'b*');
pldistA1 = plot(distances(:, 2), 'g*');
pldistA2 = plot(distances(:, 3), 'c*');
pldistA3 = plot(distances(:, 4), 'r*');
plGrades = plot(grades(:), 'k*');
legend([pldistA0, pldistA1, pldistA2, pldistA3, plGrades], 'Distances to A0 - lower bound (min)', 'Distances to A1 - ideal points (min)', 'Distances to A2 - attainable points (max)', 'Distances to A3 - anti-ideal points (max)', 'input set U', 'pareto optimal set PU', 'Grades (min)');
hold off;

