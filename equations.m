
function Y = equations(X,t,param)
    
    %unpack
    delta1 = X(1); delta2 = X(2);
    omega1 = X(3); omega2 = X(4);

    omegag = param.omegag;
    Ug = param.Ug;
    rho1 = param.rho1; rho2 = param.rho2;
    phi1 = param.phi1; phi2 = param.phi2;
    alpha1 = param.alpha1; alpha2 = param.alpha2;
    p = param.p; q = param.q;


    %equations
    Y = zeros(4,1);
    Y(1) = omega1-omegag;
    Y(2) = omega2-omegag;
    Y(3) = -q*Ug*sin(delta1) + q*rho2*sin(delta2-delta1+phi2)+alpha1*q... 
    - p*Ug*(omega1-omegag)*sin(delta1+pi/2)+p*rho2*(omega2-omega1)*sin(delta2-delta1+phi2+pi/2);
    Y(4) = -q*Ug*sin(delta2) + q*rho1*sin(delta1-delta2+phi1)+alpha2*q... 
    - p*Ug*(omega2-omegag)*sin(delta2+pi/2)+p*rho1*(omega1-omega2)*sin(delta1-delta2+phi1+pi/2);

end