%save trajectories
clear all
clc
parameters;
load sampling_result_fitting.mat
y20=[];
mf_prev_end =[];
j1=find((5-K).^2<0.5^2);
% j1= find(K>0);
j2=randsample(j1,250);
for j=1:length(j2)
k00=J(j2(j),:);
param = k00;
S_h0 = 100000-1;  % total pop - 242187
E_h0 = 0; %assumed
W_h0 = 0;
M_h0 = 1;  % total pop - 242187
C_h0 = 0; %assumed
R_h0 = 0; %assumed
S_v0 = 100000*3 - 1;
E_v0 = 0;
I_v0 = 1; 
y0=[S_h0 E_h0 W_h0 M_h0 C_h0 R_h0 S_v0 E_v0 I_v0]; %intial conditions
options = odeset('AbsTol',1e-8,'RelTol',1e-11);
[t2,y2]=ode15s(@LF_ode,[1:1:2000*52],y0, options, param);
y20(:,j)=y2(end,:);
plot((100*y2(:,5))/(pi_h/mu_h))
hold on
% mf_prev_end(j)= y2(end, 4);
end
% save('initial_conditions_accepted_prev_10.mat', 'y20', 'j2', 'J', 'K')