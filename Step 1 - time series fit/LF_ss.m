function ss = LF_ss(param,data)
parameters;
load bihar_data.mat
S_h0 = 100000-1;  % total pop - 1
E_h0 = 0; %assumed
W_h0 = 0; %assumed
M_h0 = 1; % purterbation
C_h0 = 0; %assumed
R_h0 = 0; %assumed
S_v0 = 100000*3 - 1;
E_v0 = 0;
I_v0 = 1; 
y0=[S_h0 E_h0 W_h0 M_h0 C_h0 R_h0 S_v0 E_v0 I_v0]; %intial conditions

ymodel = LF_sol(param,y0);
 ss=sum(([data.ydata'; data.zdata']-ymodel).^2);
 