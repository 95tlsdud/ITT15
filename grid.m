n = 30;

% Mesh (x,y) space
x = linspace(-pi,2*pi,n);
y = linspace(-pi,2*pi,n);

grid_matrix = zeros(n,n);
epss = 1e-2;
for i = 1:1:n
    for j = 1:1:n
        %Initial conditions
        X0 = zeros(4,1);
        X0(1) = x(i);
        X0(2) = y(j);
        X0(3) = omegag;
        X0(4) = omegag;

        t_span = [0,30];

        %Solving equations
        eq = @(t, X) equations(X, t, param);
        [t, Y] = ode45(eq, t_span, X0);
        
        l = length(Y(:,1));
        final_x = Y(l,1);
        final_y = Y(l,2);

        value_x = abs(final_x - X_out(1));
        value_y = abs(final_y - X_out(2));

        if value_x < epss && value_y < epss
            grid_matrix(i,j) = 1;

        end
    end
end

