

function J = num_jacobian(X,param)
    
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
    J = zeros(4,4);
    t=1;
   
    eps = 1e-6;
    J(:,1) = (equations([delta1+eps,delta2,1,1],t,param)-equations([delta1,delta2,1,1],t,param))/eps;
    J(:,2) = (equations([delta1,delta2+eps,1,1],t,param)-equations([delta1,delta2,1,1],t,param))/eps;
    J(:,3) = (equations([delta1,delta2,1+eps,1],t,param)-equations([delta1,delta2,1,1],t,param))/eps;
    J(:,4) = (equations([delta1,delta2,1,1+eps],t,param)-equations([delta1,delta2,1,1],t,param))/eps;


end