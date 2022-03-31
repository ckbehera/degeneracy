load variables.mat
% x(1) is [5HT]
% x(2) is [DA]
a=exp(4);
gain=[g_5 0;0 g_d];
if modelno=='l'
    J=[J55e -J5di -J55i;Jd5e-Jd_5ht3*J55e -Jdi+J5di*Jd_5ht3 -Jd5i+J55i*Jd_5ht3];
    Con=[1-g_5e*w5ee g_5e*w5edi 0;J55e*g_di*Jg_5ht3 1+wii+J5di*g_di*g_5*Jg_5ht3 J5d+J55i*g_di*g_di*g_5*Jg_5ht3;0 g_5i*Jd5 1+g_5i*w5ii];
    itype=5;
else
    J=[J55e -J5di -J55i;Jd5e -Jdi -Jd5i];
    Con=[1-g_5e*w5ee g_5e*w5edi 0;0 1+g_di*wii g_di*J5d;0 g_5i*Jd5 1+g_5i*w5ii];
    itype=4;
end
A = (gain*J*inv(Con))';

% flag = (I_app5(1:end-1)~=0 | I_app5i(1:end-1)~=0 | I_appe~=0 | I_appi~=0);                    % taking time segments when currents are nonzero
Iap = [I_app5(1:end-1); I_app5i(1:end-1); I_appe; I_appi];                                      % concatenating nonzero currents
% Iap = [zeros(size(Iap,1),1) Iap(:,flag)];                                                     % add the zero case at beginning
% I= [zeros(size(I,1),1) I(:,flag)];                                                            % non zero total input currents for DA
% I5= [zeros(size(I5,1),1) I5(:,flag)];                                                         % non zero total input currents for 5HT
% Ii= [zeros(size(Ii,1),1) Ii(:,flag)];                                                         % non zero total input currents for VTA GABA
x = zeros(2,size(Iap,2));
J = zeros(6,6,size(Iap,2));
eignvalues=zeros(6,size(Iap,2));
feval_x = zeros(2,size(Iap,2));
exitflag = zeros(1,size(Iap,2));
Frate=zeros(2,size(Iap,2));
for it = 1:size(Iap,2)
    disp([it size(Iap,2)]);
    c = [A(:)', g_5, a, wi4, g_5e, w5e2, g_di, wi3, g_5i, w5i2, w5e1, w5i1,...
        g_d, wi2, Iap(1,it), Iap(3,it), Iap(4,it), Iap(2,it), I_app,wii,J55e,J55i,Jd5e,...
        J5di,J5d,Jd5,Jd_5ht3,Jg_5ht3,wi1];
    [x(:,it), feval_x(:,it), exitflag(it)] = fsolve(@(x) myfun(x,c,itype),[0 0]);
    
    J = [-1/500, 0, 0, 0,  8/5*(exp(-10*(x(1,it)-0.1)))./(1+(exp(-10*(x(1,it)-0.1))).^2), 0;
        0, -1/150,0,0,0,  80/15*(exp(-10*(x(2,it)-0.1)))./(1+(exp(-10*(x(2,it)-0.1))).^2);
        0,0,-1/1200,0,0.03*20/1200*(exp(-20*(x(1,it)-0.1)))./(1+(exp(-20*(x(1,it)-0.1))).^2), 0;
        0,0,0,-1/1000,0,0.03*20/1000*(exp(-20.*(x(2,it)-0.3)))./(1+(exp(-20*(x(2,it)-0.3)))).^2;
        0.008/1000*c(7),0,0,0.08/1000*c(7),-0.0013./(0.17+x(1,it))+0.0013.*(x(1,it))./(0.17+x(1,it)).^2,0;
        0,0.1/1000*c(18),-0.1/1000*c(18),0,0,-0.004./(0.15+x(2,it))+0.004*(x(2,it))./(0.15+x(2,it)).^2;
        ];
    eignvalues(:,it) = eig(J);
end


% disp('eigen values');
eigenvalues=eig(J)

