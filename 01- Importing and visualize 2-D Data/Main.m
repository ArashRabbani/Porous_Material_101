clear; close all
% importing mat file and visualization slice by slice
figure; 
load('MAT/A.mat')
S=size(A);
for I=1:S(3)
clf;
imagesc(squeeze(A(I,:,:))); axis equal tight
drawnow;
end

% importing binary png sequence
D=dir('PNG/*.png');
A=zeros(200,200,40);
for I=1:numel(D)
   t=imread(['PNG/' D(I).name]); 
   t=(t==255);
   A(:,:,I)=t;
end


% importing a single jpg, binarize and visualize
A=imread('JPG/A.jpg');
A=mean(A,3);
A=double(A);
A=imgaussfilt(A);
B=A>100;
figure; imagesc(B)






