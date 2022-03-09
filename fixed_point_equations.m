
function Z = fixed_point_equations(X, param)

    %unpack
    delta1 = X(1); delta2 = X(2);
   
    omegag = param.omegag;
    omega1 = omegag; omega2 = omegag;

    Ug = param.Ug;
    rho1 = param.rho1; rho2 = param.rho2;
    phi1 = param.phi1; phi2 = param.phi2;
    alpha1 = param.alpha1; alpha2 = param.alpha2;
    p = param.p; q = param.q;

    %equations
    eq1 = -Ug*sin(delta1)+alpha1+rho2*sin(delta2-delta1+phi2);
    eq2 = -Ug*sin(delta2)+alpha2+rho1*sin(delta1-delta2+phi1);

    Z = zeros(2,1);
    Z(1) = eq1;
    Z(2) = eq2;
end