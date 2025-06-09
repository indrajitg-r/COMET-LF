%%%%%%%fixed parameter%%%%%%%
b_h = 0.0277/52; % census 2011 
b_v = 1.25; % Norman et al - 5 per month # 10 for socio economic
mu_h = 0.0067/52; % census 2011
mu_v = 1.25; % Norman et al - 5 per month
pi_h = mu_h*100000; % pop 711445
pi_v = mu_v*100000*3; % singh et al
lambda_v = 7/11; % MDA ppt suchita
theta_hv = 0.37; % 
i1 = 0.00000; % Singh et al
% alpha1 = 1/(7.5*52); % development of ADL after developing microfilaria 1/(7.5)
% alpha2 = 1/(5*52); % after fecund period of 5 years vanamail et al 1996
alpha1 = 1.5642e-4;
alpha2 = 4.9382e-5;
beta1 = 2.5; %
% theta_vh = 0.3104;
% %assumed parameters
% omega_E = 0.9225; %assumed 
% lambda_E = 0.3945; % n*psi_2/time
% omega_W = 0.8087; % probality that a person has only male or only 
% %                 % female adult worms taking total worm number is 5
% lambda_W = 0.0389; % probality that a person has atleat one male and one 
%                 % female adult worm taking total worm number is 5 2/(3*10.2*52)

%q=0;

q1 = 0.0; % bed nets
q2 = 0.0; %IRS

p1 = 0.15; %clearance rate of adult worms by DA and IDA
p2 =0.84; % 0.618 for DA and 0.84 for IDA