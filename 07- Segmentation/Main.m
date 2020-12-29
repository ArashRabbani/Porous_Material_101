clear; close all
A=ovspheres();
A=1-A;

B=bwdist(1-A);
B=imgaussfilt3(B,2);
L=watershed(-B);
L=double(L).*double(A);
surf(L)
REG=regionprops(L);
Equiv_Rad=([REG(:).Area].*3./4./pi).^(1/3);

figure; hist(Equiv_Rad); 
xlabel('radius (voxel)');
ylabel('frequency')