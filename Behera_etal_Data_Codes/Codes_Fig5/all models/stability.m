% source code for the stability analysis of the VTA-DRN system, consisting
% of DA neural population in VTA, 5-HT neural population in DRN,
% GABAgic and glutamatergic neural populations in DRN, and
% GABAergic neurons in VTA
%
% Denote "d" and "5" for DA and 5-HT, respectively

% Assume 1: DA neuronal input-output function for bursting similar to that
% of tonic activity
% Assume 2: Approximately instantaneous synapses for non-5-HT/DA
% (glutamatergic, GABAergic) mediated synapses, and firing rate response
% (e.g. see Fourcard and Brunel; and Wong and Wang, 2006)
% Constraint 1: Follow typical DA and 5-HT neural bursting amplitude and
% width, and baseline tonic activity
% Constraint 2: Follow linear input-output function of DA neurons
% Constraint 3: Follow voltammetry based release and uptake dynamics for
% [5-HT] and [DA] (see R. Wightman's work; Joshi et al., J. Royal
% Soc. Interface, 2017)

% The code does the stability analysis for all the models and plots the
% maximum phasic and tonic eigenvalues.


clear all;
%====================================================================================================================================
z=1;
modelnum=['a','b','c','d','e','f','g','h','i','j','k','l'];
for i=1:12
    clearvars -except z i modelnum eigphasic eigtonic E; close all;
    modelno = modelnum(i);
    
    if modelno=='a'
        for con=0:1
            for SeroDA=0:1
                for SeroGlu=0:1
                    for serotype=1:2
                        for rew=0:1
                            ave=abs(rew-1);
                            load modelparametrs.mat;
                            [wi1,wi2,wi3,wi4,w5e1,w5e2,w5edi,w5i1,w5i2,Jd_5ht3,Jg_5ht3,Jd5e,J55e,Jd5i,J55i,Jdi,Jd5,J5d,J5di,w5ii,w5ee,wii, wdd,w55]=connectdstbl(modelno, rew, SeroDA, SeroGlu);
                            for k=1:nsamples-1
                                if serotype==1
                                    %% Task protocols (Type I 5-HT neurons)
                                    
                                    % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                                    I_app = (expe==1)*(rew==1)*dI_bias ;
                                    %Expected rewarding stimulus schedule on 5-HT neural pop (at CS)
                                    I_app5(k) = (expe==1)*(rew==1)*dI_bias + (expe==1)*(rew==1)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext)));
                                    %Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at CS and US with waiting signal)
                                    I_appi(k) = (expe==1)*(rew==1)*(200)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + ...
                                        (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
                                    % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                                    
                                    I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext))-1*(rew==1)*dI_bias;% for * case
                                    
                                    % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                                    I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
                                        (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
                                    
                                    
                                    
                                else
                                    %      Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                                    
                                    % External stimulus to VTA's DA(baseline signal)
                                    I_app = (expe==1)*(rew==1)*dI_bias ;
                                    
                                    
                                    % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
                                    I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
                                    
                                    
                                    % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
                                    I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
                                    
                                    
                                    % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                                    
                                    I_app5i(k)= -(rew==1)*(800)*(t(k)>4500 & t(k)<5900)*(1-exp(-((t(k)-4500))/(8*tau_ext_slow)))-1*(rew==1)*dI_bias + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));%for * case
                                    % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                                    I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
                                    
                                end
                                %Total input current to non 5-HT neurons
                                
                                if con == 0
                                    I5i(k) =  -w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;    % Overall (weighted) input to local GABAergic population in DRN
                                else
                                    I5i(k) =  w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;
                                end
                                I5e(k) =  w5e1*Id5(k) + w5e2*I5d(k) + w5ee*F5e(k)-w5edi*Fi(k) + I_appe(k) ;                     % Overall (weighted) input to local glutamatergic population in DRN
                                
                                if modelno=='l'
                                    
                                    Ii(k)  =  wi1*Id5(k) + Jg_5ht3*F5(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                       % FOR MORALES NEW PAPER; Overall (weighted) input to local GABAergic population in VTA
                                    I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)- Jd_5ht3*F5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;   % FOR MORALES NEW PAPER, input current to DA
                                else
                                    
                                    if con==1
                                        Ii(k)  =  wi1*Id5(k) + wi2*I5d(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                          % Overall (weighted) input to local GABAergic population in VTA
                                    else
                                        Ii(k)  =  wi1*Id5(k) - wi2*I5d(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;
                                    end
                                    I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)- wi3*Id5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;      % Total input current to DA
                                end
                                
                                % Threshold linear input-output function
                                F(k) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);
                                % population firing rate
                                r(k) = F(k);                                                                          % Assuming quasi-steady state
                                
                                
                                %Total input current to 5-HT
                                I5(k) =-0*I5d(k)-J55i*F5i(k)+J55e*F5e(k)-J5di*Fi(k)+wi4*I5d(k)+ I_5_bias+I_app5(k)-w55*I_ad5(k)+c*randn;
                                % Threshold linear input-output function
                                F5(k) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);
                                % population firing rate
                                r5(k) = F5(k);                                                                        % Assuming quasi-steady state
                                
                                
                                
                                %updating..
                                
                                d(k+1) = d(k) + (dt)*(Cp*r(k)/1000 - Vmax./(1+Km./d(k)));                             % microM (baseline about 1.5nM) of [DA]
                                I_ad(k+1) =I_ad(k) + (dt/tau_d_auto)*(-I_ad(k)+k_ad./(1+exp(-(10*(d(k)-0.1)))));      % adaptive current of DA
                                I5d(k+1) = I5d(k) + (dt)*(-I5d(k)/tau_5d + A5d/(1+exp(-(20*((d(k)-0.3))))));          % Current due to DA receptors
                                s(k+1) = s(k) + (dt)*(Cp5*r5(k)/1000 - Vmax5./(1+Km5./s(k)));                         % microM (baseline about 10nM) of [5HT]
                                I_ad5(k+1) = I_ad5(k) + (dt/tau_5_auto)*(-I_ad5(k)+k_a5./(1+exp(-(10*(s(k)-0.1)))));  % adaptive current for 5-HT
                                Id5(k+1) = Id5(k) + (dt)*(-Id5(k)/tau_d5 + Ad5/(1+exp(-(20*((s(k)-0.1))))));          % Current due to 5-HT receptors in DA
                                F5i(k+1) = (g_5i.*(I5i(k)-I_05i)).*((I5i(k)-I_05i)>0);                                % Input-output function for Local GABAergic population in DRN
                                Fi(k+1) = (g_di.*(Ii(k)-I_0i)).*((Ii(k)-I_0i)>0);                                     % Input-output function for Local GABAergic population in VTA
                                F5e(k+1) = (g_5e.*(I5e(k)-I_05e)).*((I5e(k)-I_05e)>0);                                % Input-output function for Local glutamatergic population
                                F(k+1) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);                                           % Input-output function for Dopaminergic population in VTA
                                F5(k+1) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);                                      % Input-output function for Serotonergic population in DRN
                                
                            end
                            save variables.mat g_5 g_d w5ee w5edi wii Jd_5ht3 Jg_5ht3 J5d J55e J5di J55i Jd5e Jdi Jd5i Jd5 w5ii w5e2 g_5e w5e1 wi3 wi2 g_di g_5i w5i1 g_5i w5i2 g_5 wi4 I_appe I_appi I_app5i I_app5 I_app ;
                            
                            run eigen_values.m;
                            eigphasic(:,z)= min(min(eignvalues(:,:)));
                            eigtonic(:,z)= min(eignvalues(:,40000));
                            E(:,z)=eigenvalues;
                            
                            z=z+1;
                        end
                    end
                end
            end
        end
        
        
        
    elseif modelno=='b'
        SeroDA=0;
        for SeroGlu=0:1
            for serotype=1:2
                for rew=0:1
                    ave=abs(rew-1);
                    load modelparametrs.mat;
                    [wi1,wi2,wi3,wi4,w5e1,w5e2,w5edi,w5i1,w5i2,Jd_5ht3,Jg_5ht3,Jd5e,J55e,Jd5i,J55i,Jdi,Jd5,J5d,J5di,w5ii,w5ee,wii, wdd,w55]=connectdstbl(modelno, rew, SeroDA, SeroGlu);
                    for k=1:nsamples-1
                        if serotype==1
                            %% Task protocols (Type I 5-HT neurons)
                            
                            % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                            I_app = (expe==1)*(rew==1)*dI_bias ;
                            %Expected rewarding stimulus schedule on 5-HT neural pop (at CS)
                            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (expe==1)*(rew==1)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext)));
                            %Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at CS and US with waiting signal)
                            I_appi(k) = (expe==1)*(rew==1)*(200)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + ...
                                (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
                            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                            I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));
                            
                            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
                                (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
                            
                            
                        else
                            %      Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                            
                            % External stimulus to VTA's DA(baseline signal)
                            I_app = (expe==1)*(rew==1)*dI_bias ;
                            
                            
                            % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
                            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
                            
                            
                            % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
                            I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
                            
                            
                            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                            I_app5i(k) =  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
                            
                            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
                            
                        end
                        
                        %Total input current to non 5-HT neurons
                        I5i(k) =  -w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;    % Overall (weighted) input to local GABAergic population in DRN
                        I5e(k) =  w5e1*Id5(k) + w5e2*I5d(k) + w5ee*F5e(k)-w5edi*Fi(k) + I_appe(k) ;                     % Overall (weighted) input to local glutamatergic population in DRN
                        
                        if modelno=='l'
                            
                            Ii(k)  =  wi1*Id5(k) + Jg_5ht3*F5(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                       % FOR MORALES NEW PAPER; Overall (weighted) input to local GABAergic population in VTA
                            I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)- Jd_5ht3*F5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;   % FOR MORALES NEW PAPER, input current to DA
                        else
                            Ii(k)  =  wi1*Id5(k) + wi2*I5d(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                          % Overall (weighted) input to local GABAergic population in VTA
                            I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)- wi3*Id5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;      % Total input current to DA
                        end
                        
                        % Threshold linear input-output function
                        F(k) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);
                        % population firing rate
                        r(k) = F(k);                                                                          % Assuming quasi-steady state
                        
                        
                        %Total input current to 5-HT
                        I5(k) =-0*I5d(k)-J55i*F5i(k)+J55e*F5e(k)-J5di*Fi(k)+wi4*I5d(k)+ I_5_bias+I_app5(k)-w55*I_ad5(k)+c*randn;
                        % Threshold linear input-output function
                        F5(k) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);
                        % population firing rate
                        r5(k) = F5(k);                                                                        % Assuming quasi-steady state
                        
                        
                        
                        %updating..
                        
                        d(k+1) = d(k) + (dt)*(Cp*r(k)/1000 - Vmax./(1+Km./d(k)));                             % microM (baseline about 1.5nM) of [DA]
                        I_ad(k+1) =I_ad(k) + (dt/tau_d_auto)*(-I_ad(k)+k_ad./(1+exp(-(10*(d(k)-0.1)))));      % adaptive current of DA
                        I5d(k+1) = I5d(k) + (dt)*(-I5d(k)/tau_5d + A5d/(1+exp(-(20*((d(k)-0.3))))));          % Current due to DA receptors
                        s(k+1) = s(k) + (dt)*(Cp5*r5(k)/1000 - Vmax5./(1+Km5./s(k)));                         % microM (baseline about 10nM) of [5HT]
                        I_ad5(k+1) = I_ad5(k) + (dt/tau_5_auto)*(-I_ad5(k)+k_a5./(1+exp(-(10*(s(k)-0.1)))));  % adaptive current for 5-HT
                        Id5(k+1) = Id5(k) + (dt)*(-Id5(k)/tau_d5 + Ad5/(1+exp(-(20*((s(k)-0.1))))));          % Current due to 5-HT receptors in DA
                        F5i(k+1) = (g_5i.*(I5i(k)-I_05i)).*((I5i(k)-I_05i)>0);                                % Input-output function for Local GABAergic population in DRN
                        Fi(k+1) = (g_di.*(Ii(k)-I_0i)).*((Ii(k)-I_0i)>0);                                     % Input-output function for Local GABAergic population in VTA
                        F5e(k+1) = (g_5e.*(I5e(k)-I_05e)).*((I5e(k)-I_05e)>0);                                % Input-output function for Local glutamatergic population
                        F(k+1) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);                                           % Input-output function for Dopaminergic population in VTA
                        F5(k+1) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);                                      % Input-output function for Serotonergic population in DRN
                        
                        
                        
                        
                    end
                    
                    save variables.mat g_5 g_d w5ee w5edi wii Jd_5ht3 Jg_5ht3 J5d J55e J5di J55i Jd5e Jdi Jd5i Jd5 w5ii w5e2 g_5e w5e1 wi3 wi2 g_di g_5i w5i1 g_5i w5i2 g_5 wi4 I_appe I_appi I_app5i I_app5 I_app ;
                    
                    run eigen_values.m;
                    
                    eigphasic(:,z)= min(min(eignvalues(:,:)));
                    eigtonic(:,z)= min(eignvalues(:,40000));
                    E(:,z)=eigenvalues;
                    
                    z=z+1;
                end
            end
        end
        
    elseif modelno=='l'
        SeroGlu=0;
        for SeroDA = 0:1
            for serotype=1:2
                for rew=0:1
                    ave=abs(rew-1);
                    load modelparametrs.mat;
                    [wi1,wi2,wi3,wi4,w5e1,w5e2,w5edi,w5i1,w5i2,Jd_5ht3,Jg_5ht3,Jd5e,J55e,Jd5i,J55i,Jdi,Jd5,J5d,J5di,w5ii,w5ee,wii, wdd,w55]=connectdstbl(modelno, rew, SeroDA, SeroGlu);
                    for k=1:nsamples-1
                        if serotype==1
                            %% Task protocols (Type I 5-HT neurons)
                            
                            % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                            I_app = (expe==1)*(rew==1)*dI_bias ;
                            %Expected rewarding stimulus schedule on 5-HT neural pop (at CS)
                            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (expe==1)*(rew==1)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext)));
                            %Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at CS and US with waiting signal)
                            I_appi(k) = (expe==1)*(rew==1)*(200)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + ...
                                (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
                            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                            
                            I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext))-1*(rew==1)*dI_bias;% for * case
                            
                            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
                                (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
                            
                            
                            
                        else
                            % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                            % External stimulus to VTA's DA(baseline signal)
                            I_app = (expe==1)*(rew==1)*dI_bias ;
                            
                            
                            % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
                            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
                            
                            
                            % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
                            I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
                            
                            
                            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                            I_app5i(k)= -(rew==1)*(800)*(t(k)>4500 & t(k)<5900)*(1-exp(-((t(k)-4500))/(8*tau_ext_slow)))-1*(rew==1)*dI_bias + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));%for * case
                            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
                            
                        end
                        %Total input current to non 5-HT neurons
                        I5i(k) =  -w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;    % Overall (weighted) input to local GABAergic population in DRN
                        I5e(k) =  w5e1*Id5(k) + w5e2*I5d(k) + w5ee*F5e(k)-w5edi*Fi(k) + I_appe(k) ;                     % Overall (weighted) input to local glutamatergic population in DRN
                        
                        
                        
                        Ii(k)  =  wi1*Id5(k) + Jg_5ht3*F5(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                       % FOR MORALES NEW PAPER; Overall (weighted) input to local GABAergic population in VTA
                        
                        if SeroDA==0
                            I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)- Jd_5ht3*F5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;
                        else
                            I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)+ Jd_5ht3*F5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;   % FOR MORALES NEW PAPER, input current to DA
                        end
                        
                        
                        % Threshold linear input-output function
                        F(k) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);
                        % population firing rate
                        r(k) = F(k);                                                                          % Assuming quasi-steady state
                        
                        
                        %Total input current to 5-HT
                        I5(k) =-0*I5d(k)-J55i*F5i(k)+J55e*F5e(k)-J5di*Fi(k)+wi4*I5d(k)+ I_5_bias+I_app5(k)-w55*I_ad5(k)+c*randn;
                        % Threshold linear input-output function
                        F5(k) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);
                        % population firing rate
                        r5(k) = F5(k);                                                                        % Assuming quasi-steady state
                        
                        
                        
                        %updating..
                        
                        d(k+1) = d(k) + (dt)*(Cp*r(k)/1000 - Vmax./(1+Km./d(k)));                             % microM (baseline about 1.5nM) of [DA]
                        I_ad(k+1) =I_ad(k) + (dt/tau_d_auto)*(-I_ad(k)+k_ad./(1+exp(-(10*(d(k)-0.1)))));      % adaptive current of DA
                        I5d(k+1) = I5d(k) + (dt)*(-I5d(k)/tau_5d + A5d/(1+exp(-(20*((d(k)-0.3))))));          % Current due to DA receptors
                        s(k+1) = s(k) + (dt)*(Cp5*r5(k)/1000 - Vmax5./(1+Km5./s(k)));                         % microM (baseline about 10nM) of [5HT]
                        I_ad5(k+1) = I_ad5(k) + (dt/tau_5_auto)*(-I_ad5(k)+k_a5./(1+exp(-(10*(s(k)-0.1)))));  % adaptive current for 5-HT
                        Id5(k+1) = Id5(k) + (dt)*(-Id5(k)/tau_d5 + Ad5/(1+exp(-(20*((s(k)-0.1))))));          % Current due to 5-HT receptors in DA
                        F5i(k+1) = (g_5i.*(I5i(k)-I_05i)).*((I5i(k)-I_05i)>0);                                % Input-output function for Local GABAergic population in DRN
                        Fi(k+1) = (g_di.*(Ii(k)-I_0i)).*((Ii(k)-I_0i)>0);                                     % Input-output function for Local GABAergic population in VTA
                        F5e(k+1) = (g_5e.*(I5e(k)-I_05e)).*((I5e(k)-I_05e)>0);                                % Input-output function for Local glutamatergic population
                        F(k+1) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);                                           % Input-output function for Dopaminergic population in VTA
                        F5(k+1) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);                                      % Input-output function for Serotonergic population in DRN
                        
                    end % inner for loop
                    save variables.mat g_5 g_d w5ee w5edi wii Jd_5ht3 Jg_5ht3 J5d J55e J5di J55i Jd5e Jdi Jd5i Jd5 w5ii w5e2 g_5e w5e1 wi3 wi2 g_di g_5i w5i1 g_5i w5i2 g_5 wi4 I_appe I_appi I_app5i I_app5 I_app ;
                    
                    run eigen_values.m;
                    eigphasic(:,z)= min(min(eignvalues(:,:)));
                    eigtonic(:,z)= min(eignvalues(:,40000));
                    E(:,z)=eigenvalues;
                    
                    z=z+1;
                    
                    
                end
            end
        end
        
    else % all models except a, b, l
        SeroGlu=0;
        SeroDA=0;
        for serotype=1:2
            for rew=0:1
                ave=abs(rew-1);
                load modelparametrs.mat;
                [wi1,wi2,wi3,wi4,w5e1,w5e2,w5edi,w5i1,w5i2,Jd_5ht3,Jg_5ht3,Jd5e,J55e,Jd5i,J55i,Jdi,Jd5,J5d,J5di,w5ii,w5ee,wii, wdd,w55]=connectdstbl(modelno, rew, SeroDA, SeroGlu);
                for k=1:nsamples-1
                    if serotype==1
                        %% Task protocols (Type I 5-HT neurons)
                        
                        % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                        I_app = (expe==1)*(rew==1)*dI_bias ;
                        %Expected rewarding stimulus schedule on 5-HT neural pop (at CS)
                        I_app5(k) = (expe==1)*(rew==1)*dI_bias + (expe==1)*(rew==1)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext)));
                        %Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at CS and US with waiting signal)
                        I_appi(k) = (expe==1)*(rew==1)*(200)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + ...
                            (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
                        % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                        I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));
                        
                        % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                        I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
                            (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
                        
                        
                        
                    else
                        %      Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
                        
                        % External stimulus to VTA's DA(baseline signal)
                        I_app = (expe==1)*(rew==1)*dI_bias ;
                        
                        
                        % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
                        I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
                        
                        
                        % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
                        I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
                        
                        
                        % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
                        I_app5i(k) =  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
                        
                        % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
                        I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
                        
                    end
                    %Total input current to non 5-HT neurons
                    I5i(k) =  -w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;    % Overall (weighted) input to local GABAergic population in DRN
                    I5e(k) =  w5e1*Id5(k) + w5e2*I5d(k) + w5ee*F5e(k)-w5edi*Fi(k) + I_appe(k) ;                     % Overall (weighted) input to local glutamatergic population in DRN
                    
                    if modelno=='l'
                        
                        Ii(k)  =  wi1*Id5(k) + Jg_5ht3*F5(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                       % FOR MORALES NEW PAPER; Overall (weighted) input to local GABAergic population in VTA
                        I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)+ Jd_5ht3*F5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;   % FOR MORALES NEW PAPER, input current to DA
                    else
                        Ii(k)  =  wi1*Id5(k) + wi2*I5d(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                          % Overall (weighted) input to local GABAergic population in VTA
                        I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)- wi3*Id5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;      % Total input current to DA
                    end
                    
                    % Threshold linear input-output function
                    F(k) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);
                    % population firing rate
                    r(k) = F(k);                                                                          % Assuming quasi-steady state
                    
                    
                    %Total input current to 5-HT
                    I5(k) =-0*I5d(k)-J55i*F5i(k)+J55e*F5e(k)-J5di*Fi(k)+wi4*I5d(k)+ I_5_bias+I_app5(k)-w55*I_ad5(k)+c*randn;
                    % Threshold linear input-output function
                    F5(k) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);
                    % population firing rate
                    r5(k) = F5(k);                                                                        % Assuming quasi-steady state
                    
                    
                    
                    %updating..
                    
                    d(k+1) = d(k) + (dt)*(Cp*r(k)/1000 - Vmax./(1+Km./d(k)));                             % microM (baseline about 1.5nM) of [DA]
                    I_ad(k+1) =I_ad(k) + (dt/tau_d_auto)*(-I_ad(k)+k_ad./(1+exp(-(10*(d(k)-0.1)))));      % adaptive current of DA
                    I5d(k+1) = I5d(k) + (dt)*(-I5d(k)/tau_5d + A5d/(1+exp(-(20*((d(k)-0.3))))));          % Current due to DA receptors
                    s(k+1) = s(k) + (dt)*(Cp5*r5(k)/1000 - Vmax5./(1+Km5./s(k)));                         % microM (baseline about 10nM) of [5HT]
                    I_ad5(k+1) = I_ad5(k) + (dt/tau_5_auto)*(-I_ad5(k)+k_a5./(1+exp(-(10*(s(k)-0.1)))));  % adaptive current for 5-HT
                    Id5(k+1) = Id5(k) + (dt)*(-Id5(k)/tau_d5 + Ad5/(1+exp(-(20*((s(k)-0.1))))));          % Current due to 5-HT receptors in DA
                    F5i(k+1) = (g_5i.*(I5i(k)-I_05i)).*((I5i(k)-I_05i)>0);                                % Input-output function for Local GABAergic population in DRN
                    Fi(k+1) = (g_di.*(Ii(k)-I_0i)).*((Ii(k)-I_0i)>0);                                     % Input-output function for Local GABAergic population in VTA
                    F5e(k+1) = (g_5e.*(I5e(k)-I_05e)).*((I5e(k)-I_05e)>0);                                % Input-output function for Local glutamatergic population
                    F(k+1) = (g_d.*(I(k)-I_0)).*((I(k)-I_0)>0);                                           % Input-output function for Dopaminergic population in VTA
                    F5(k+1) = (g_5.*(I5(k)-I_05)).*((I5(k)-I_05)>0);                                      % Input-output function for Serotonergic population in DRN
                    
                end%inner for loop ends
                save variables.mat g_5 g_d w5ee w5edi wii Jd_5ht3 Jg_5ht3 J5d J55e J5di J55i Jd5e Jdi Jd5i Jd5 w5ii w5e2 g_5e w5e1 wi3 wi2 g_di g_5i w5i1 g_5i w5i2 g_5 wi4 I_appe I_appi I_app5i I_app5 I_app ;
                
                run eigen_values.m;
                eigphasic(:,z)= min(min(eignvalues(:,:)));
                eigtonic(:,z)= min(eignvalues(:,40000));
                E(:,z)=eigenvalues;
                
                z=z+1;
                
                
                
            end
        end
        
    end % particular model
end %for loop ends for all models

figure;
hold on;
%stem(eigphasic,'x');
plot(eigphasic,'kx','MarkerSize',8);
%stem(eigtonic,'o');
plot(eigtonic,'ko','MarkerSize',8);
plot([32.5 32.5],[-0.06 0.005],'k--');
plot([40.5 40.5],[-0.06 0.005],'k--');
plot([44.5 44.5],[-0.06 0.005],'k--');
plot([48.5 48.5],[-0.06 0.005],'k--');
plot([52.5 52.5],[-0.06 0.005],'k--');
plot([56.5 56.5],[-0.06 0.005],'k--');
plot([60.5 60.5],[-0.06 0.005],'k--');
plot([64.5 64.5],[-0.06 0.005],'k--');
plot([68.5 68.5],[-0.06 0.005],'k--');
plot([72.5 72.5],[-0.06 0.005],'k--');
plot([76.5 76.5],[-0.06 0.005],'k--');
plot([84.5 84.5],[-0.06 0.005],'k--');
text(16.5,-0.05,'a');
text(36.5,-0.05,'b');
text(42.5,-0.05,'c');
text(46.5,-0.05,'d');
text(50.5,-0.05,'e');
text(54.5,-0.05,'f');
text(58.5,-0.05,'g');
text(62.5,-0.05,'h');
text(66.5,-0.05,'i');
text(70.5,-0.05,'j');
text(74.5,-0.05,'k');
text(80.5,-0.05,'l');
hold off;