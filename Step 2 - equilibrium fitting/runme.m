clear all
options = optimset('MaxFunEvals',10000, 'TolX', 1e-8,'MaxIter',10000);

%sample size............................. :)
runs=100000;
%some initial guess of unknowns..........
theta_vh0 = 0.3104;
lambda_E0 = 0.3945;
omega_E0 = 0.9225;
lambda_W0 = 0.0389;
omega_W0 = 0.8087;
% alpha10 = 2.111e-05;
% alpha20 = 9.541e-06;
% % Parameter Labels 
%PRCC_var={'b','r', '\eta', '\mu_na','\mu_F', 'k_1', 'S_h0','A_h0', 'D_h0','P_h0''R_h0'};
% % LHS MATRIX..........................
% beta1_LHS=LHS_Call(1, beta10, 100, 0 ,runs,'unif'); 
% VoverH_LHS=LHS_Call(1e-1, VoverH0, 10, 0 ,runs,'unif'); 
% omega_E_LHS=LHS_Call(omega_E0-0.05, omega_E0, omega_E0+0.05, 0, runs,'unif'); 
% lambda_W_LHS=LHS_Call(lambda_W0-0.05,lambda_W0,lambda_W0+0.05, 0 ,runs,'unif'); 
% omega_W_LHS=LHS_Call(omega_W0-0.05, omega_W0, omega_W0+0.05, 0, runs,'unif'); 
theta_vh_LHS=LHS_Call(1e-7, theta_vh0, 0.37, 0 ,runs,'unif'); 
lambda_E_LHS=LHS_Call(1e-7, lambda_E0, 1, 0 ,runs,'unif'); 
omega_E_LHS=LHS_Call(1e-7, omega_E0, 1, 0, runs,'unif'); 
lambda_W_LHS=LHS_Call(1e-7,lambda_W0,1, 0 ,runs,'unif'); 
omega_W_LHS=LHS_Call(1e-7, omega_W0, 1, 0, runs,'unif');
% alpha1_LHS=LHS_Call(1e-7, alpha10, 1/(7.5*52), 0,runs,'unif'); 
% alpha2_LHS=LHS_Call(1e-7, alpha20, 1/(5*52), 0, runs,'unif'); 

% LHS MATRIX and PARAMETER LABELS................
LHSmatrix=[theta_vh_LHS lambda_E_LHS omega_E_LHS lambda_W_LHS omega_W_LHS]';
          J=zeros(runs,5);
          K=zeros(runs,1);
% lb= [theta_vh0-0.05,1e-7,omega_E0-0.05,lambda_W0-0.05,omega_W0-0.05, 1e-7, 1e-7];
% ub= [theta_vh0+0.05,lambda_E0+0.05,omega_E0+0.05,lambda_W0+0.05,omega_W0+0.05, 1/(7.5*52), 1/(5*52)];
lb= [1e-7, 1e-7, 1e-7, 1e-7, 1e-7];
ub= [0.37, 1, 1, 1, 1];
% Number of workers for parallel pool settings
% NumWorkers = 16; % dependent on system capabilities
      
parfor i=1:runs
i
k0=LHSmatrix(:,i);
J(i,:)=k0';
K(i)=LF_ss(k0);
end

save('sampling_result_fitting.mat','J','K')

% options = optimset('PlotFcns',@optimplotfval);
% %parfor i=1:runs
% %i
% k00=LHSmatrix(:,1);
% J(1,:)=k00';
% [k0,ss0] = fminsearchbnd(@LF_ss,k00,lb,ub,options);