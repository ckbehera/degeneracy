




%connecting weights 

function [wi1,wi2,wi3,wi4,w5e1,w5e2,w5edi,w5i1,w5i2,Jd_5ht3,Jg_5ht3,Jd5e,J55e,Jd5i,J55i,Jdi,Jd5,J5d,J5di,w5ii,w5ee,wii, wdd,w55] = connectdstbl(modelno, rew,SeroDA, SeroGlu)
%% play with the w's and j's in this section

switch lower(modelno)
     case 'l'
     if rew==0
           
            if SeroDA==0
              
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=1;% Connection weight from 5-HT in DRN to DA pop in VTA 
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=1;
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN
                end
            else
                
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=-1;
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=-1;
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                end
            end
        else
           
            if SeroDA==0
                
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA
                    wi3=-1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=3;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=1;
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                     wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=3;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=1;
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                     wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                end
            else
              
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=3;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=-1;
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=3;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=-1;
                    Jg_5ht3=1;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                     wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                end
            end
            
            
            
            
            
            
            
            
      end

    case 'k'
        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=0;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=0;      %Connection weight from DA pop in VTA to 5-HT in DRN 
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
        
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0;     % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
    case 'j'
        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=2;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=0;      %Connection weight from DA pop in VTA to 5-HT in DRN 
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
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0;     % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
        
    case 'i'
        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=-2;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=0;      %Connection weight from DA pop in VTA to 5-HT in DRN 
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
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0;     % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
             
                
    case 'h'

        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=0;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
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
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0;    % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
        
    case 'g'
        % ============== Non-principal GABAergic neurons in VTA ==========
        Jd_5ht3=0;
        Jg_5ht3=0;
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=0;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=0;     %Connection weight from DA pop in VTA to 5-HT in DRN 
        % ============= Non-principal glutamatergic neurons in DRN =========
        
        %w5e1=5;    % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
        w5e1=0;
        w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
        %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
        w5edi=0;
        
        % ============== Non-principal GABAergic neurons in DRN ============
        
        w5i1=10;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
        w5i2=20;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
        
        %=============== Coupling with non-principal neurons ===============
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0;    % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA
        w55=1;      % Self-inhibition of 5HT population in DRN
        
    case 'f' 
        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=0;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=0;     %Connection weight from DA pop in VTA to 5-HT in DRN
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
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
        
    case 'e'
        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=0;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
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
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0.1;     % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
        
        
    case 'd'
        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=0;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
        % ============= Non-principal glutamatergic neurons in DRN =========
        
        %w5e1=5;    % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection
        w5e1=0;
        w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
        %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
        w5edi=0;
        
        % ============== Non-principal GABAergic neurons in DRN ============
        
        w5i1=10;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
        w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
        
        %=============== Coupling with non-principal neurons ===============
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
        
        
    case 'c'
        % ============== Non-principal GABAergic neurons in VTA ==========
        
        wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
        wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
        wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
        wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
        % ============= Non-principal glutamatergic neurons in DRN =========
        
        %w5e1=5;    % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
        w5e1=0;
        w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
        %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
        w5edi=0;
        
        % ============== Non-principal GABAergic neurons in DRN ============
        
        w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
        w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
        
        %=============== Coupling with non-principal neurons ===============
        Jd_5ht3=0;
        Jg_5ht3=0;
        Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
        J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
        Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
        J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
        Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
        J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
        Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
        J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
        w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
        w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
        wii=10;     % Self-inhibition of GABAergic population in VTA 
        wdd=1;      % Self-inhibition of DA population in VTA 
        w55=1;      % Self-inhibition of 5HT population in DRN 
        
    case 'b'
        
      %  SeroGlu = input('for excitatory 5HT-Glu connection enter 1 else 0 ');
        if SeroGlu==0
            % ============== Non-principal GABAergic neurons in VTA ==========
            
            wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
            wi2=2;     % Connection weight from DA in VTA to GABA pop in VTA
            wi3=0.2;    % Connection weight from 5-HT in DRN to DA pop in VTA 
            wi4=10;     %Connection weight from DA pop in VTA to 5-HT in DRN 
            % ============= Non-principal glutamatergic neurons in DRN =========
            
            
            w5e1=-0.1;  % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
            w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
            %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
            w5edi=0;
            
            % ============== Non-principal GABAergic neurons in DRN ============
            
            w5i1=4;      % .Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA
            w5i2=10;     % .Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
            
            %=============== Coupling with non-principal neurons ===============
            Jd_5ht3=0;
            Jg_5ht3=0;
            Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
            J55e=6;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
            Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
            J55i=0.1;   % .DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
            Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
            J5di=0;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
            Jd5=0;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
            J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
            w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
            w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
            wii=10;     % Self-inhibition of GABAergic population in VTA 
            wdd=1;      % Self-inhibition of DA population in VTA 
            w55=1;      % Self-inhibition of 5HT population in DRN 
            
            
        else
            % ============== Non-principal GABAergic neurons in VTA ==========
            
            wi1=20;     % .Connection weight from 5-HT in DRN to GABA pop in VTA 
            wi2=2;      % .Connection weight from DA in VTA to GABA pop in VTA 
            wi3=1;      % .Connection weight from 5-HT in DRN to DA pop in VTA 
            wi4=10;     %.Connection weight from DA pop in VTA to 5-HT in DRN 
            % ============= Non-principal glutamatergic neurons in DRN =========
            
            
            w5e1=1;   % .Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
            w5e2=0;     % .Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
            %w5edi=1;   % .Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
            w5edi=0;
            
            % ============== Non-principal GABAergic neurons in DRN ============
            
            w5i1=4;      % .Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
            w5i2=10;     % .Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
            
            %=============== Coupling with non-principal neurons ===============
            Jd_5ht3=0;
            Jg_5ht3=0;
            Jd5e=100;   % .DRN's Glutamergic neuronal excitatory coupling on DA neurons 
            J55e=5;     % .DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
            Jd5i=0;     % .DRN's GABAergic neuronal inhibitory coupling on DA neurns ons 
            J55i=0.1;   % .DRN's GABAergic neuronal inhibitory coupling on 5-HT neuro
            Jdi=25;     % .VTA's GABAergic neuronal inhibitory coupling on DA neurons
            J5di=0;     % .VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
            Jd5=0;      % .VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
            J5d=0;      % .DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
            w5ii=0.5;   % .Self-inhibition of GABAergic population in DRN 
            w5ee=0.5;   % .Self-excitation of Glutamergic population in DRN 
            wii=10;     % .Self-inhibition of GABAergic population in VTA 
            wdd=1;      % Self-inhibition of DA population in VTA 
            w55=1;      % Self-inhibition of 5HT population in DRN 
        end
        
    case 'a'
        
        if rew==0
          %  SeroDA  = input('for excitatory 5HT-DA connection enter 1 else 0 ');
            if SeroDA==0
              %  SeroGlu = input('for excitatory 5HT-Glu connection enter 1 else 0 ');
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=-1;      % Connection weight from 5-HT in DRN to DA pop in VTA
                    wi4=20;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=10;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=2;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=20;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=10;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=2;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                end
            else
              %  SeroGlu = input('for excitatory 5HT-Glu connection enter 1 else 0 ');
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=20;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=10;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=2;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=20;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=4;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=10;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=10;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=2;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.4;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN
                end
            end
        else
            %SeroDA  = input('for excitatory 5HT-DA connection enter 1 else 0 ');
            if SeroDA==0
              %  SeroGlu = input('for excitatory 5HT-Glu connection enter 1 else 0 ');
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=-1;      % Connection weight from 5-HT in DRN to DA pop in VTA
                    wi4=20;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=0.2;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=20;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=10;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=0.5;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jd5=0.1;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA
                     wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=20;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=0.2;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA
                    w5i2=20;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=10;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons 
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons 
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=2;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.1;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                     wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                end
            else
              %  SeroGlu = input('for excitatory 5HT-Glu connection enter 1 else 0 ');
                if SeroGlu==0
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA 
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=20;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=-0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=0.2;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=20;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT 
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons
                    J55e=10;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=2;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.1;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                    wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN
                else
                    % ============== Non-principal GABAergic neurons in VTA ==========
                    
                    wi1=20;     % Connection weight from 5-HT in DRN to GABA pop in VTA
                    wi2=2;      % Connection weight from DA in VTA to GABA pop in VTA 
                    wi3=1;      % Connection weight from 5-HT in DRN to DA pop in VTA 
                    wi4=30;     %Connection weight from DA pop in VTA to 5-HT in DRN 
                    % ============= Non-principal glutamatergic neurons in DRN =========
                    
                    
                    w5e1=0.1;   % Connection weight from 5-HT neural pop to Glu pop in DRN, relative to 5-HT-to-DA connection 
                    w5e2=0;     % Connection weight from DA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection 
                    %w5edi=1;   % Connection weight from GABA in VTA neural pop to Glu pop in DRN, relative to DA-to-5-HT connection
                    w5edi=0;
                    
                    % ============== Non-principal GABAergic neurons in DRN ============
                    
                    w5i1=0.1;    % Connection weight from 5-HT to GABA pop in DRN, relative to 5-HT-to-DA 
                    w5i2=20;     % Connection weight from DA in VTA to GABA in DRN, relative to DA-to-5-HT
                    
                    %=============== Coupling with non-principal neurons ===============
                    Jd_5ht3=0;
                    Jg_5ht3=0;
                    Jd5e=100;   % DRN's Glutamergic neuronal excitatory coupling on DA neurons 
                    J55e=5;     % DRN's Glutamergic neuronal excitatory coupling on 5-HT neurons
                    Jd5i=0;     % DRN's GABAergic neuronal inhibitory coupling on DA neurons 
                    J55i=0.1;   % DRN's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jdi=25;     % VTA's GABAergic neuronal inhibitory coupling on DA neurons 
                    J5di=1;     % VTA's GABAergic neuronal inhibitory coupling on 5-HT neurons
                    Jd5=0.1;      % VTA's GABAergic neuronal inhibitory coupling on DRN's GABA
                    J5d=0;      % DRN's GABAergic neuronal inhibitory coupling on VTA's GABA
                    w5ii=0.5;   % Self-inhibition of GABAergic population in DRN 
                    w5ee=0.5;   % Self-excitation of Glutamergic population in DRN 
                    wii=10;     % Self-inhibition of GABAergic population in VTA 
                     wdd=1;      % Self-inhibition of DA population in VTA 
                    w55=1;      % Self-inhibition of 5HT population in DRN 
                end
            end
            
            
            
            
            
            
            
            
        end

end

