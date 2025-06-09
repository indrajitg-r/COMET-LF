function y=LF_sol(param,y0)

T=1000*52;
parameters;

options = odeset('AbsTol',1e-8,'RelTol',1e-11);
[t2,y2]=ode15s(@LF_ode,[1:1:T],y0, options, param);

y_mf_rate = (y2((end-6*52+1):52:end, 4)*100)/(pi_h/mu_h);
y_disease_rate = (y2((end-6*52+1):52:end, 5)*100)/(pi_h/mu_h);

y=[y_mf_rate; y_disease_rate];
