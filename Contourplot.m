%%Solving equations for steady state of PLL equations for 2 solar panels
%%and inverters from two houses on a street and their interaction with the
%%grid

%Variables: House 1: omega1 = frequency of signal, del1 = phase of signal,
%etc.

%Parameters
Ug = 0.25;
I1 = 0.09-1i*0.12; I2 = 0.36-1i*0.48;
%p = 0.5; q = 1; %no idea what these are and dont care
Z1 = 0.01+1i*0.04; Z2 = 0.15+1i*0.6; Zt = 0.004+1i*0.1; Zg = 0.05+1i*0.3;

alpha1 = imag((Zg + Z1 + Zt)*I1); alpha2 = imag((Zg + Z1 + Z2 + Zt)*I2);
rho1 = abs((Zg+Z1)*I1); rho2 = abs((Zg + Z1)*I2);
phi1 = angle((Zg+Z1)*I1); phi2 = angle((Zg+Z1)*I2);

%Mesh (delta1, delta2) space
del1 = linspace(0, 2*pi, 100);
del2 = linspace(0, 2*pi, 100);
[Del1,Del2] = meshgrid(del1, del2);

%Our equations
ZZ1 = -Ug*sin(Del1) + alpha1 + rho2*sin(Del2 - Del1 + phi2);
ZZ2 = -Ug*sin(Del2) + alpha2 + rho1*sin(Del1 - Del2 + phi1);

%Plot the 0 contour of both and look for intersections
figure(1)
contour(Del1, Del2, ZZ1, [0 0], 'k', 'LineWidth', 2)
hold on
contour(Del1, Del2, ZZ2, [0 0], 'r', 'LineWidth', 2)
hold off
xlabel('Phase shift of House 1'); ylabel('Phase shift of House 2');
    ylab = get(gca,'YLabel');
    set(ylab,'Rotation',0);
    set(gca,'XTick',[0 pi 2*pi]);
    set(gca,'XTickLabel',{'0','\pi', '2\pi'});
    set(gca,'YTick',[0 pi 2*pi]);
    set(gca,'YTickLabel',{'0','\pi', '2\pi'});
    set(ylab,'Rotation',90);
xlim([-0.1, 2*pi+0.1]); ylim([-0.1, 2*pi+0.1]);
%title('Case A')
