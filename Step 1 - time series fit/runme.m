clear all
options = optimset('MaxFunEvals',10000, 'TolX', 1e-8,'MaxIter',10000);
load bihar_data.mat
%sample size............................. :)
% runs=100;
%some initial guess of unknowns..........
theta_vh0 = 0.1529;
lambda_E0 = 0.0057;
omega_E0 = 0.2487;
lambda_W0 = 0.9316;
omega_W0 = 0.9493;
alpha10 = 2.111e-05;
alpha20 = 9.541e-06;

param = [theta_vh0 lambda_E0 omega_E0 lambda_W0 omega_W0 alpha10 alpha20];

lb= [1e-7,1e-7,1e-7,1e-7,1e-7, 1e-7, 1e-7];
ub= [0.37,1,1,1,1, 1/(10*52), 1/(10*52)];

k00=param;
[k0,ss0] = fminsearchbnd(@LF_ss,k00,lb,ub,options);

save('fitting_results_bihar.mat','k0', 'ss0')
% % Parameter Labels 
%PRCC_var={'b','r', '\eta', '\mu_na','\mu_F', 'k_1', 'S_h0','A_h0', 'D_h0','P_h0''R_h0'};
% % LHS MATRIX..........................
% theta_vh_LHS=LHS_Call(theta_vh0-0.05, theta_vh0, theta_vh0+0.05, 0 ,runs,'unif'); 
% lambda_E_LHS=LHS_Call(1e-7, lambda_E0, lambda_E0+0.05, 0 ,runs,'unif'); 
% omega_E_LHS=LHS_Call(omega_E0-0.05, omega_E0, omega_E0+0.05, 0, runs,'unif'); 
% lambda_W_LHS=LHS_Call(lambda_W0-0.05,lambda_W0,lambda_W0+0.05, 0 ,runs,'unif'); 
% omega_W_LHS=LHS_Call(omega_W0-0.05, omega_W0, omega_W0+0.05, 0, runs,'unif'); 
% theta_vh_LHS=LHS_Call(1e-7, theta_vh0, 0.37, 0 ,runs,'unif'); 
% lambda_E_LHS=LHS_Call(1e-7, lambda_E0, 1, 0 ,runs,'unif'); 
% omega_E_LHS=LHS_Call(1e-7, omega_E0, 1, 0, runs,'unif'); 
% lambda_W_LHS=LHS_Call(1e-7,lambda_W0,1, 0 ,runs,'unif'); 
% omega_W_LHS=LHS_Call(1e-7, omega_W0, 1, 0, runs,'unif');
% alpha1_LHS=LHS_Call(1e-7, alpha10, 1/(10*52), 0,runs,'unif'); 
% alpha2_LHS=LHS_Call(1e-7, alpha20, 1/(10*52), 0, runs,'unif'); 

% LHS MATRIX and PARAMETER LABELS................
% LHSmatrix=[theta_vh_LHS lambda_E_LHS omega_E_LHS lambda_W_LHS omega_W_LHS alpha1_LHS alpha2_LHS]';
%           J=zeros(runs,7);
%           K=zeros(runs,1);
% lb= [theta_vh0-0.05,1e-7,omega_E0-0.05,lambda_W0-0.05,omega_W0-0.05, 1e-7, 1e-7];
% ub= [theta_vh0+0.05,lambda_E0+0.05,omega_E0+0.05,lambda_W0+0.05,omega_W0+0.05, 1/(7.5*52), 1/(5*52)];
