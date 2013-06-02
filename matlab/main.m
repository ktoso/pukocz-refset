%% data setup
%  rozdzial 6.3

% s?owno muzycznie:
% chodzi o to aby w przestrzeni rozwi?za? maj?c dostarczone kilka
% mozliwosci, konkretnie w takich kategoriach: "najlepsze, zno?ne, z?e"
% wiadomo ?e nasze rozwi?zanie trzeba zbli?y? jak naj bardziej do
% najlepszego i najdalej od najgorszego.

% lower bound gdzie to jeszcze ma sens...
A0 = [];

% ideal points - idealne rozw
A1 = [];

% attainable points - zno?ne rozw
A2 = [];

% anti-idea points - tragiczne rozw od czego chcemy sie oddalic
A3 = [];

% util value a1 < a2 < a3

%% consistency checking
%  rozdzial 6.4

% check internal consistency
valid = checkInternalConsistency([A0 A1 A2 A3])

% check mutual consistency
