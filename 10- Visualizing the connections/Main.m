clear; clc; close all; 
A=ovspheres();
Res=5; %Spatial Resolution (micron/pixel)
B=segment(A);
[Network,Connections]=netcon(B); %extracting the network and connections

Coordinations=sum(Network);
figure; spy(Network); title('Connectivity matrix');

% calculating center and size of the pores
REG=regionprops(B); 
for I=1:max(B(:)); Centers(I,:)=REG(I).Centroid; end
Equiv_Rad=([REG(:).Area].*3./4./pi).^(1/3)*Res;
Property=Equiv_Rad';

% visualizing the pore network
netvis(Connections,Centers,Property)

% visualizing the pore network on top of the original geometry
netvis(Connections,Centers,Property)
vol2(A); alpha .75;