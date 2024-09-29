clc; clear;
tspan = [-20000, 20000];
M0 = -1.54.*10.^6;
[H,M0]=ode45('odeM',tspan,M0);
tspan = [20000, -20000];
M1 = 1.54.*10.^6;
[Hf,Mf] = ode45('odeM_',tspan,M1);
figure(1);plot(H,M); hold on;figure(1); plot(Hf,Mf);