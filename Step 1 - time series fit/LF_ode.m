function ydot = LF_ode(t,y,param)
parameters;

theta_vh = param(1);
lambda_E=param(2);
omega_E = param(3);
lambda_W=param(4);
omega_W = param(5);
alpha1 = param(6);
alpha2 = param(7);
%beta1 = param(6);
%% state variables 
S_h = y(1);
E_h = y(2);
W_h = y(3);
M_h = y(4);
C_h = y(5);
R_h = y(6);
S_v = y(7);
E_v = y(8);
I_v = y(9);
N_h = S_h + E_h + W_h + M_h + C_h + R_h;
%N_v=S_v + E_v + I_v;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% model equations
dotS_h = pi_h - beta1*theta_vh*I_v*(S_h/N_h) - mu_h*S_h +i1*R_h;
dotE_h = beta1*theta_vh*I_v*(S_h/N_h) - (omega_E + lambda_E + mu_h)*E_h;
dotW_h = lambda_E*E_h - (omega_W + alpha1 + lambda_W + mu_h)*W_h;
dotM_h = lambda_W*W_h -  (alpha2 + mu_h)*M_h;
dotC_h = alpha1*W_h + alpha2*M_h - mu_h*C_h;
dotR_h = omega_E*E_h + omega_W*W_h - (i1+mu_h)*R_h;
dotS_v = pi_v - beta1*theta_hv*S_v*(M_h/N_h) - mu_v*S_v;
dotE_v = beta1*theta_hv*S_v*(M_h/N_h) - (lambda_v + mu_v)*E_v;
dotI_v = lambda_v*E_v - mu_v*I_v;
ydot = [dotS_h; dotE_h; dotW_h; dotM_h; dotC_h; dotR_h; dotS_v; dotE_v; dotI_v];
end