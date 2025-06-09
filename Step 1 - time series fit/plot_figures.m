% Plotting
clear all
load fitting_results_bihar.mat
load bihar_data.mat
parameters;
param = k0;
T=1000*52;
S_h0 = 100000-1;  % total pop - 242187
E_h0 = 0; %assumed
W_h0 = 0; %assumed
M_h0 = 1;  % total pop - 242187
C_h0 = 0; %assumed
R_h0 = 0; %assumed
S_v0 = 100000*3 - 1;
E_v0 = 0;
I_v0 = 1; 
y0=[S_h0 E_h0 W_h0 M_h0 C_h0 R_h0 S_v0 E_v0 I_v0]; %intial conditions
options = odeset('AbsTol',1e-8,'RelTol',1e-11);
[t2,y2]=ode15s(@LF_ode,[1:1:T],y0, options, param);
% y20=y2(end,:);
figure(1)
y_mf_rate = (y2(1:52:end, 4)*100)/(pi_h/mu_h);
y_disease_rate = (y2(1:52:end, 5)*100)/(pi_h/mu_h);

time_data=(1000-6+1):1:1000;

plot(y_mf_rate, 'k', 'linewidth', 2)
hold on
plot(y_disease_rate, 'r', 'linewidth', 2)
hold on
plot(time_data,data.ydata,'ko')
hold on
plot(time_data,data.zdata,'ro')

% MDA coverage to take the infection down to <1% within 10 years
% T1 = 520;
% [t3,y3]=ode45(@LF_ode,[1:1:T1],y20, options, param);
% figure(2)
% plot(y3(:,3), 'r', 'linewidth', 2)
% hold on
% yline_const = 2421*ones(T1,1);
% plot(yline_const,'--')