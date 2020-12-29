clear; close all
% box surface plot
load('A.mat')
A=A(1:100,1:100,1:100);
A=double(A);
S=size(A);
S=permute(S,[2,1,3]);
figure;
[X,Y,Z]=meshgrid(1:S(1),1:S(2),1:S(3));
xslice=[1,S(1)];
yslice=[1,S(2)];
zslice=[1,S(3)];
h=slice(X,Y,Z,A,xslice,yslice,zslice); axis equal tight
for I=1:6
    h(I).EdgeColor='none';
end

% iso-surface plot
A=1-A;
S=size(A);
B=ones(S+2);
B(2:end-1,2:end-1,2:end-1)=A;
figure
isosurface(B); axis equal tight



