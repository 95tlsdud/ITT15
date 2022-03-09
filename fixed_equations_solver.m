% solving fixed point equations

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
X0 = zeros(2,1);
X0(1) = 0;
X0(2) = 0;


%Solving equations
fun = @(X) fixed_point_equations(X, param);
X_out = fsolve(fun, X0);



lambda = eig(num_jacobian(X_out,param));
