clear all

k00 = 0.05;
lb= 0;
ub= 1;

options = optimset('PlotFcns',@optimplotfval);
%options = odeset('AbsTol',1e-8,'RelTol',1e-11);
[k0,ss0] = fminsearchbnd(@LF_ss,k00,lb,ub,options);

save('fitting_result.mat','k0','ss0')

%estimated theta_vh = 0.0014
