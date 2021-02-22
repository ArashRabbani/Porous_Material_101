close all
A=ovspheres();
vol(A)
L=segment(A);
surf(L)
Res=5; % spatial resolution (micron/pixel)
REG=regionprops(L);
Equiv_Rad=([REG(:).Area].*3./4./pi).^(1/3)*Res;

% plotting the pore size distribution
figure; histogram(Equiv_Rad,20,'Normalization','Probability'); 
xlabel('Pore radius (micron)');
ylabel('Probability')
title('Pore size distribution')

% plotting the fitted pore size distribution
figure; histfit(Equiv_Rad,20,'lognormal'); 
xlabel('Pore radius (micron)');
ylabel('Probability')
title('Pore size distribution')

% plotting both grain and pore size distributions
L=segment(1-A);
surf(L)
vol(L~=0)
REG=regionprops(L);
Equiv_Rad2=([REG(:).Area].*3./4./pi).^(1/3)*Res;
figure; histogram(Equiv_Rad,20,'Normalization','Probability'); 
hold on; histogram(Equiv_Rad2,20,'Normalization','Probability'); 
xlabel('Element radius (micron)');
ylabel('Probability')
legend({'Pore size','Grain size'})
title('Pore and grain size distribution')
