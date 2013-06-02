%% data setup
%  rozdzial 6.3

% s?owno muzycznie:
% chodzi o to aby w przestrzeni rozwi?za? maj?c dostarczone kilka
% mozliwosci, konkretnie w takich kategoriach: "najlepsze, zno?ne, z?e"
% wiadomo ?e nasze rozwi?zanie trzeba zbli?y? jak naj bardziej do
% najlepszego i najdalej od najgorszego.

% lower bound gdzie to jeszcze ma sens...
A0 = [ 2 1
       1 2 ];

% ideal points - idealne rozw
A1 = [ 5 5
       6 7 
       8 6 ];

% attainable points - zno?ne rozw
A2 = [ 10 12
        7  9
       10 10 ];
   
% anti-idea points - tragiczne rozw od czego chcemy sie oddalic
A3 = [ 20 12 
       19 14
       18 15
       17 18 ];

% util value a1 < a2 < a3

%% plot spaces
figure(1);
hold all;
xlim([0 25]);
ylim([0 25])
pl0 = plot(A0(:,1), A0(:,2), '*-');
pl1 = plot(A1(:,1), A1(:,2), '*-');
pl2 = plot(A2(:,1), A2(:,2), '*-');
pl3 = plot(A3(:,1), A3(:,2), '*-');
legend([pl0, pl1, pl2, pl3], 'lower bound', 'ideal points', 'attainable points', 'anti-ideal points');

%% consistency checking
%  rozdzial 6.4

% check internal consistency
internalValid = checkInternalConsistency([A0 A1 A2 A3])
extern


% check mutual consistency
