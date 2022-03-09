%Solving PLL equations

%Parameters
Ug = 1;
omegag = 1; %no idea 
I1 = 0.09-1i*0.12; I2 = 0.36-1i*0.48;
p = 0.5; q = 1; %no idea what these are 
Z1 = 0.01+1i*0.04; Z2 = 0.15+1i*0.6; Zt = 0.004+1i*0.1; Zg = 0.05+1i*0.3;

alpha1 = imag((Zg + Z1 + Zt)*I1); alpha2 = imag((Zg + Z1 + Z2 + Zt)*I2);
rho1 = abs((Zg+Z1)*I1); rho2 = abs((Zg + Z1)*I2);
phi1 = angle((Zg+Z1)*I1); phi2 = angle((Zg+Z1)*I2);

param =struct('omegag', omegag, 'Ug', Ug, 'rho1', rho1, 'rho2', rho2,...
    'phi1', phi1, 'phi2', phi2, 'alpha1', alpha1, 'alpha2', alpha2,...
    'p', p, 'q', q);

%Initial conditions
X0 = zeros(4,1);
X0(1) = x(11);
X0(2) = y(11);
X0(3) = omegag;
X0(4) = omegag;

t_span = [0,30];

%Solving equations
eq = @(t, X) equations(X, t, param);
[t, Y] = ode45(eq, t_span, X0);

%plot - need to check x,y coordinates
figure(1)
plot(Y(:,1), Y(:,2))
xlabel('delta1');
ylabel('delta2');
hold on
plot(X0(1), X0(2), 'ro');
hold off

figure(2)
plot(Y(:,3), Y(:,4))
xlabel('omega1');
ylabel('omega2');
hold on
plot(1, 1, 'ro');
hold off

figure(3)
plot(t, Y,'LineWidth',2)
xlabel('time');
legend('\delta_1', '\delta_2', '\omega_1', '\omega_2')

figure(4)
plot(t,mod(Y(:,1),2*pi),t,mod(Y(:,2),2*pi))
