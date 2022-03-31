% Source code for a simplified model of the VTA-DRN system, consisting
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

% The code analyses the stability of a particular model
% It calculates the eigenvalues of the model and plots activity profiles
close all; 

run template.m;
clearvars -except rew ave serotype;
%%%%%%%%%%%%%%%%%% VTA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ============ Model parameters for DA =======================

tau_d_auto = 150; % Time constant of DA autoreceptor induced current. 
                  % According to D2 autoreceptor-induced (K+) current in 
                  % VTA (Benoid-Marand, Borrelli & Gonon, 2001)

g_d=0.019;        % Input-output function gain parameter of DA neurons

k_ad=80;          % Conversion factor from [DA] to DA-induced current, fit to 
                  % baseline concentration (50-100 nM/L), 1 Hz spont firing

I_0=-10;          % Overall excitatory/Offset current to create positive 
                  % spont activity
                  
I_d_bias=200;     % Bias current to the DA neural pop

Cp = 0.1;         % microM (per liter), concentration release due to DA 
                  % neuronal firing rate ; different from voltammetry 
                  % experiments; fit to baseline concentration (50-100 nM/L

Vmax = 4/1000;    % microM/ms (per litre) Maximal reuptake [DA] from 
                  % voltammetry experiments(Wightman's papers) %%Fixed even 
                  % with antidepressant

Km = 0.15;        % microM (per litre) (Wightman's papers) Half max reuptake 
                  % [DA] from voltammetry experiments %%Fixed unless there 
                  % is antidepressant applied

% ============== GABAergic neurons in VTA ==========

g_di = 0.06; % Gain of input-output function in the GABA pop in VTA 
             % (gain of 'firing rate' vs the 'current' graph for GABA in VTA)

I_0i = -200; % Base/threshold current of GABA pop in VTA


%%%%%%%%%%%%%%%%%% DRN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ============ Model parameters for 5-HT ==================

tau_5_auto = 500; % Time constant of 5-HT(1A) autoreceptor induced current. 
                  % (~ 0.5-1 sec) (Courtney & Ford 2016 paper)

g_5 = 0.033;      % Input-output function gain parameter (cf. F-I curves of 
                  % DA and 5-HT neurons, about ~1-4 times steeper than DA 
                  % neuron) Carlizo et al.?

k_a5 = 80;        % Conversion factor from [5-HT] to 5-HT-induced current, 
                  % fit to adjust 5-HT firing and [5-HT] baselines
                  
I_05 = 0.13;      % Threshold current for input-output function of 5-HT 
                  % neural pop, to create positive spont activity ~0.5-2 Hz or less
                  
I_5_bias = 100;   % Bias current to the 5-HT neuron

Cp5 = Cp/1.25;    % Different from experiments; fit to baseline concentration 
                  %(10 nM/L), and ~1.25 smaller than Cp 
                  % 300 times less release than DA, according to Hashemi et al. 
                  % PNAS (2012)
                  
Vmax5 = 1.3/1000; % microM/ms (per litre) (Bunin et al. 1998)

Km5 = 0.17;       % microM (per litre) (Bunin et al. 1998)

% ============= Glutamatergic neurons in DRN =========

g_5e = 0.04;      % Gain parameter of input-output function of Glu neurons in DRN

I_05e = -100;     % Threshold current to create positive spontaneous activity in Glu


%%%%%%%%%%%%%%% OTHER COUPLING PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Coupling parameters between VTA and DRN

Ad5 = 0.03;       % Conversion from [5-HT] to 5-HT receptor induced current 
                  % for DA neurons (also exploited for other 5-HT targeted pops)
                  
tau_d5 = 1200 ;   % Time constant in ms for 5-HT induced current on DA neurons 
                  % (also used for other 5-HT targeted pops)
                  
A5d = 0.03;       % Coupling from 5-HT firing to DA receptor current

tau_5d = 1000 ;   % Time constant in ms for DA induced current on 5-HT neurons 
                  % (also used for other DA targeted pops)


g_5i = 0.06;      % Gain parameter for the input-output function of GABA in DRN

I_05i = -200;     % Overall inhibitory current to create negative spontaneous 
                  % activity in GABA 


% External input profile to mimick un/expected rewarding/aversive outcomes

tau_ext = 50;        % Time constant due to external input
tau_ext_slow = 350;  % Slower ramping time constant e.g. via frontal cortex
expe = 1 ;           % Expected rewarding or aversive outcome
unexp = abs(1-expe); % Unexpected rewarding or aversive outcome
%rew = 1;            % Presence of rewarding outcome
% ave = abs(1-rew) ;   % Presence of aversive outcome
dI_bias = 50 ;       % Change in bias inputs based on overall block is rewarding/aversive



dt = 0.1;             % Time step (ms) Smaller timestep checked without changing results

T_total = 12000;    % Total time taken (ms)
nsamples = round(T_total/dt) + 1;
t = linspace(0, T_total, nsamples);


% Vectorizing variables

% Vectorize population firing rate
r = 0.*ones(1,nsamples);        % Firing rate of DA in VTA

% Vectorize adaptive current (autoreceptor-mediated)
I_ad = 0.1.*ones(1,nsamples);   % VTA's adaptive current in DA
F = 0.004.*ones(1,nsamples);    % Threshold linear input-output function of
% DA in VTA, in microM (per litre)
d = 0.01.*ones(1,nsamples);     % microM concentration of DA in VTA
Id5 = 0.*ones(1,nsamples);      % Current due to 5-HT receptors in VTA

% Vectorize population firing rate
r5 = 0.*ones(1,nsamples);       % Firing rate of 5-HT in DRN
% Vectorize adaptive current (autoreceptor-mediated)
I_ad5 = 0.*ones(1,nsamples);    % DRN's adaptive current in 5-HT
F5 = ones(1,nsamples);          % Threshold linear input-output function of
% 5-HT in DRN, in microM (per litre)
s = 0.1.*ones(1,nsamples);      % microM concentration of 5-HT in DRN
I5d = 0.*ones(1,nsamples);      % Current due to dopamine receptors in DRN

F5e = zeros(1,nsamples);        % Local Glutametergic population in DRN
F5i = zeros(1,nsamples);        % Local GABAergic population in DRN
Fi = zeros(1,nsamples);         % Local GABAergic population in VTA

I = 0.*ones(1,nsamples);        % Total input current to DA
I5 = 0.*ones(1,nsamples);       % Total input current to 5HT
I5i = 0.*ones(1,nsamples);      % Overall (weighted) input current to local GABAergic population in DRN
Ii = 0.*ones(1,nsamples);       % Overall (weighted) input current to local GABAergic population in VTA
I5e = 0.*ones(1,nsamples);      % Overall (weighted) input to local glutamatergic population in DRN

I_app5 = 0.*ones(1,nsamples);   % Current due to DRN's 5-HT neural population
I_app5i = 1.*ones(1,nsamples);  % Current due to DRN's GABAergic neural popluation

c = 0; % No noise for BOTH DA and 5-HT neurons, assuming the same background noise
%====================================================================================================================================
% rew = 0 ;            % Presence of rewarding outcome
% ave = abs(1-rew) ;   % Presence of aversive outcome
% Time loop
load temp_data.mat;
%====================================================================================================================================

% Weight values linked to function "connectdv3models"
modelno = input('enter a model name from "a" to "l"  ', 's');
% modelno = 'model number';
% modelno = input(modelno);
if modelno=='a'
    con= input('for excitatory DA to VTAGABA and 5HT to DRN GABA connections enter 1 else 0 ');
    
end

[wi1,wi2,wi3,wi4,w5e1,w5e2,w5edi,w5i1,w5i2,Jd_5ht3,Jg_5ht3,Jd5e,J55e,Jd5i,J55i,Jdi,Jd5,J5d,J5di,w5ii,w5ee,wii, wdd,w55]=connectdv3modelsf2(modelno, rew); 

%====================================================================================================================================
for k=1:nsamples-1
    
    if  modelno=='l'
       
        if serotype==1
            %% Task protocols (Type I 5-HT neurons)
            
            % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
            I_app = (expe==1)*(rew==1)*dI_bias ;
            %Expected rewarding stimulus schedule on 5-HT neural pop (at CS)
            
            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (expe==1)*(rew==1)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext)))+(ave==1)*(0)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
            %Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at CS and US with waiting signal)
            I_appi(k) = (expe==1)*(rew==1)*(200)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + ...
                (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
            %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));
            I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext))-1*(rew==1)*dI_bias;% for * case
            %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((t(k)-5700)/tau_ext)*exp(-((t(k)-5700))/tau_ext)+(rew==1)*(350)*(t(k)>4500 & t(k)<5900)*(1-exp(-(t(k)-4500)/(15*tau_ext_slow)));% for extra case
            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
                (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
            
            
            
        else
            %      Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
            %I_app = (expe==1)*(rew==1)*(2000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(2000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500)/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
            % External stimulus to VTA's DA(baseline signal)
            I_app = (expe==1)*(rew==1)*dI_bias ;
            %I_app=0; % No external stimulus to DA neurons
            
            % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
            %I_app5 = 0; % No external stimulus to 5-HT neurons
            
            % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
            I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
            %I_appi = 0; % No external stimulus to VTA's GABAergic neurons
            
            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
            %I_app5i(k) =  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
            I_app5i(k)= -(rew==1)*(800)*(t(k)>4500 & t(k)<5900)*(1-exp(-((t(k)-4500))/(8*tau_ext_slow)))-1*(rew==1)*dI_bias + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));%for * case
            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
            
        end
    elseif modelno=='a'
        if serotype==1
            %% Task protocols (Type I 5-HT neurons)
            
            % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
            I_app = (expe==1)*(rew==1)*dI_bias ;
            %Expected rewarding stimulus schedule on 5-HT neural pop (at CS)
            
            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (expe==1)*(rew==1)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext)))+(ave==1)*(80)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
            %Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at CS and US with waiting signal)
            I_appi(k) = (expe==1)*(rew==1)*(200)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + ...
                (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
            %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));
            I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext))-1*(rew==1)*dI_bias;% for * case
            %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((t(k)-5700)/tau_ext)*exp(-((t(k)-5700))/tau_ext)+(rew==1)*(350)*(t(k)>4500 & t(k)<5900)*(1-exp(-(t(k)-4500)/(15*tau_ext_slow)));% for extra case
            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
                (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
            
            
            
        else
            %      Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
            %I_app = (expe==1)*(rew==1)*(2000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(2000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500)/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
            % External stimulus to VTA's DA(baseline signal)
            I_app = (expe==1)*(rew==1)*dI_bias ;
            %I_app=0; % No external stimulus to DA neurons
            
            % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
            %I_app5 = 0; % No external stimulus to 5-HT neurons
            
            % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
            I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
            %I_appi = 0; % No external stimulus to VTA's GABAergic neurons
            
            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
            %I_app5i(k) =  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
            I_app5i(k)= -(rew==1)*(800)*(t(k)>4500 & t(k)<5900)*(1-exp(-((t(k)-4500))/(8*tau_ext_slow)))-1*(rew==1)*dI_bias + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));%for * case
            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
            
        end
            
    else
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
            %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext))-4*(rew==1)*dI_bias;% for * case
            %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((t(k)-5700)/tau_ext)*exp(-((t(k)-5700))/tau_ext)+(rew==1)*(350)*(t(k)>4500 & t(k)<5900)*(1-exp(-(t(k)-4500)/(15*tau_ext_slow)));% for extra case
            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
                (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
            
            
            
        else
            %      Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
            %I_app = (expe==1)*(rew==1)*(2000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(2000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500)/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
            % External stimulus to VTA's DA(baseline signal)
            I_app = (expe==1)*(rew==1)*dI_bias ;
            %I_app=0; % No external stimulus to DA neurons
            
            % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
            I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
            %I_app5 = 0; % No external stimulus to 5-HT neurons
            
            % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
            I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
            %I_appi = 0; % No external stimulus to VTA's GABAergic neurons
            
            % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
            I_app5i(k) =  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
            %I_app5i(k)= -(rew==1)*(800)*(t(k)>4500 & t(k)<5900)*(1-exp(-((t(k)-4500))/(8*tau_ext_slow)))-4*(rew==1)*dI_bias + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));%for * case
            % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
            I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
            
        end
       
        
        
    end
        
%     
%      % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
%         %I_app = (expe==1)*(rew==1)*(2000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(2000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500)/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
%         % External stimulus to VTA's DA(baseline signal)
%         I_app = (expe==1)*(rew==1)*dI_bias ;
%         %I_app=0; % No external stimulus to DA neurons
%     
%         % Unexpected or expected rewarding stimulus schedule on DRN's 5-HT neural pop (at CS and US, with waiting signal)
%         I_app5(k) = (expe==1)*(rew==1)*dI_bias + (unexp==1)*(rew==1)*0*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (rew==1)*(100)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext))) ;% + (rew==1)*(100)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) % Short pulse
%         %I_app5 = 0; % No external stimulus to 5-HT neurons
%     
%         % Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at US)
%         I_appi(k) = (expe==1)*(rew==1)*(0)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ;
%         %I_appi = 0; % No external stimulus to VTA's GABAergic neurons
%     
%         % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
%         I_app5i(k) =  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
%         %I_app5i(k)= -(rew==1)*(800)*(t(k)>4500 & t(k)<5900)*(1-exp(-((t(k)-4500))/(8*tau_ext_slow)))-4*(rew==1)*dI_bias + (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));%for * case 
%         % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
%         I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext))) + (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*((((t(k)-5500))/tau_ext)*exp((-((t(k)-5500))/tau_ext))) ; % Short pulse
%     
       
%    %% Task protocols (Type I 5-HT neurons)
%     
%   % Unexpected rewarding stimulus schedule of VTA's DA neural pop (at CS and US)
%     I_app = (expe==1)*(rew==1)*dI_bias ;
%     %Expected rewarding stimulus schedule on 5-HT neural pop (at CS)
%     I_app5(k) = (expe==1)*(rew==1)*dI_bias + (expe==1)*(rew==1)*(t(k)>4500 & t(k)<4700)*((((t(k)-4500))/tau_ext)*exp((-((t(k)-4500))/tau_ext)));
%     %Expected rewarding stimulus schedule on VTA's GABAergic neural pop (at CS and US with waiting signal)
%     I_appi(k) = (expe==1)*(rew==1)*(200)*(t(k)>4500 & t(k)<5700)*(1-exp((-((t(k)-4500))/tau_ext_slow))) + ...
%                 (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp((-((t(k)-5700))/tau_ext)));
%     % Unexpected aversive stimulus schedule on DRN's GABAergic neural pop (at US)
%     I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext));
%     %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((((t(k)-5700))/tau_ext)*exp(-((t(k)-5700))/tau_ext))-4*(rew==1)*dI_bias;% for * case 
%     %I_app5i(k)=  (ave==1)*(1000)*(t(k)>5700 & t(k)<5900)*((t(k)-5700)/tau_ext)*exp(-((t(k)-5700))/tau_ext)+(rew==1)*(350)*(t(k)>4500 & t(k)<5900)*(1-exp(-(t(k)-4500)/(15*tau_ext_slow)));% for extra case
%     % Unexpected rewarding stimulus schedule of DRN's glutamatergic neural pop (same as would be for VTA's DA neural pop)
%     I_appe(k) = (expe==1)*(rew==1)*(1000)*(t(k)>4500 & t(k)<4700)*((t(k)-4500)/tau_ext)*exp(-(t(k)-4500)/tau_ext) + ...
%                 (unexp==1)*(rew==1)*(1000)*(t(k)>5500 & t(k)<5700)*(((t(k)-5500)/tau_ext)*exp(-(t(k)-5500)/tau_ext)) ; % Short pulse
%      
%  
%   %%
    %Total input current to non 5-HT neurons
    if modelno == 'a'
        if con == 0
            I5i(k) =  -w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;    % Overall (weighted) input to local GABAergic population in DRN
        else
            I5i(k) =  w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;
        end
    else
        I5i(k) =  -w5i1*Id5(k) + w5i2*I5d(k) - w5ii*F5i(k) + 0*F5e(k)-Jd5*Fi(k) + I_app5i(k) + 250 ;
    end
    I5e(k) =  w5e1*Id5(k) + w5e2*I5d(k) + w5ee*F5e(k)-w5edi*Fi(k) + I_appe(k) ;                     % Overall (weighted) input to local glutamatergic population in DRN
    
    if modelno=='l'
        
        Ii(k)  =  wi1*Id5(k) + Jg_5ht3*r5(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                       % FOR MORALES NEW PAPER; Overall (weighted) input to local GABAergic population in VTA
        I(k)= -Jdi*Fi(k)-(Jd5i*F5i(k))+Jd5e*F5e(k)- Jd_5ht3*r5(k)+I_d_bias+I_app-wdd*I_ad(k)+c*randn;   % FOR MORALES NEW PAPER, input current to DA
    else
        if modelno == 'a'
            if con==1
                Ii(k)  =  wi1*Id5(k) + wi2*I5d(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;                          % Overall (weighted) input to local GABAergic population in VTA
            else
                Ii(k)  =  wi1*Id5(k) - wi2*I5d(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;
            end
        else
            Ii(k)  =  wi1*Id5(k) + wi2*I5d(k) - wii*Fi(k) + I_appi(k)-J5d*F5i(k) ;
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
 %calculating difference in firing rates from the template data


save variables.mat g_5 g_d w5ee w5edi wii Jd_5ht3 Jg_5ht3 J5d J55e J5di J55i Jd5e Jdi Jd5i Jd5 w5ii w5e2 g_5e w5e1 wi3 wi2 g_di g_5i w5i1 g_5i w5i2 g_5 wi4 I_appe I_appi I_app5i I_app5 I_app ;

 run eigen_values.m;

eigphasic= min(min(eignvalues(:,:)));
eigtonic= min(eignvalues(:,40000));
%barchart for eigen values
figure;
tonic=(eignvalues(:,40000));
[row,col]=min(min(eignvalues(:,:)));
phasic=eignvalues(:,col);
phasic=sort(phasic);
tonic=sort(tonic);
bar([phasic tonic]);box off;
legend('Phasic', 'Tonic');
ylabel('Eigenvalues','FontSize',20);
set(gca,'TickDir','out');
% E=eigenvalues;


