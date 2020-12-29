clear; close all
load('A.mat')
% porosity
Porosity=1-mean(A(:))

% specific surface
B=bwperim(A);
figure; imagesc(B(:,:,20)); % visualize the perimeter
SPS1=sum(B(:))/sum(A(:)) % simplified specific surface (1/pixel)
se=zeros(3,3,3); se(2,2,2)=1; se(2,2,3)=1; se(2,2,1)=1; se(2,3,2)=1; se(2,1,2)=1; se(3,2,2)=1; se(1,2,2)=1;
B=imdilate(A,se);
C=B-A;
SPS2= sum(C(:))/sum(A(:)) % more accurate specific surface (1/pixel)

% erosion and dilation of the structure 
% to change porosity and specific surface

D=imerode(A,ones(3,3,3));
G=imdilate(A,ones(3,3,3));

% visualizations of the original, and modified structures
surf(A); title('original')
surf(D); title('eroded structure')
surf(G); title('dilated structure')

