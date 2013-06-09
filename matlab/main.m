%% data setup
%  rozdzial 6.3

% s?owno muzycznie:
% chodzi o to aby w przestrzeni rozwi?za? maj?c dostarczone kilka
% mozliwosci, konkretnie w takich kategoriach: "najlepsze, zno?ne, z?e"
% wiadomo ?e nasze rozwi?zanie trzeba zbli?y? jak naj bardziej do
% najlepszego i najdalej od najgorszego.

N = 100;

% decision space
U = randi(20, [N 2]);
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

figure(1);
close all;
hold;
xlim([0 25]);
ylim([0 25]);
pl0 = plot(A0(:,1), A0(:,2), 'b*-');
pl1 = plot(A1(:,1), A1(:,2), 'g*-');
pl2 = plot(A2(:,1), A2(:,2), 'c*-');
pl3 = plot(A3(:,1), A3(:,2), 'r*-');
pl4 = plot(U(:,1), U(:,2), 'm*');
pl5 = plot(PU(:,1), PU(:,2), 'y*');
legend([pl0, pl1, pl2, pl3, pl4, pl5], 'A0 - lower bound', 'A1 - ideal points', 'A2 - attainable points', 'A3 - anti-ideal points', 'input set U', 'pareto optimal set PU');

%% consistency checking
%  rozdzial 6.4

% check internal consistency
% internalValid = checkInternalConsistency([A0 A1 A2 A3])
mutualValid = checkMutualConsistency(A0, A1, A2, A3);


% check mutual consistency
