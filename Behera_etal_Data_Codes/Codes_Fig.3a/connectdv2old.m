




%connecting weights 

function [wi1,wi2,w5e1,w5e2,w5i1,w5i2,Jd5e,J55e,Jd5i,J55i,Jdi,J5di,w5ii,w5ee,wii,w5edi] = connectdv2old()
%% play with the w's and j's in this section

% ============== Non-principal GABAergic neurons in VTA ==========

wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 

% ============= Non-principal glutamatergic neurons in DRN =========

%w5e1=5;    % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
w5e1=0;
w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
%w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
w5edi=0;

% ============== Non-principal GABAergic neurons in DRN ============

w5i1=10;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
w5i2=0;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT

%=============== Coupling with non-principal neurons ===============

Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
%J55e=0;

%Jd5i=7;    % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
Jd5i=0;
%J55i=3;    % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
J55i=0;

Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 

w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
wii=10;     % Self-inhibition of GABAergic population in VTA 

end

