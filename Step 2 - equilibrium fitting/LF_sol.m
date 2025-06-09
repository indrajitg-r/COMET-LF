function y=LF_sol(param,y0)

T=2000*52;
parameters;

options = odeset('AbsTol',1e-8,'RelTol',1e-11);
[t2,y2]=ode15s(@LF_ode,[1:1:T],y0, options, param);

y=[(y2(end, 4)*100)/(pi_h/mu_h)];
