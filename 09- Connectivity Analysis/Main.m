clear; clc; close all; 
A=ovspheres();
Res=5; %Spatial Resolution (micron/pixel)
B=segment(A);
% dilation and shifting the arrays
B=imdilate(B,ones(2,2,2));
C=B; C(:,:,1:end-1)=C(:,:,2:end); 
D=B; D(:,1:end-1,:)=D(:,2:end,:); 
E=B; E(1:end-1,:,:)=E(2:end,:,:);
% detecting neighbours
F=[B(:) C(:); C(:) D(:); B(:) D(:) ;B(:) E(:) ;C(:) E(:) ;D(:) E(:)];
F(F(:,1).*F(:,2)==0,:)=[];
F(F(:,1)==F(:,2),:)=[];
F=unique(F,'rows');
% making the connectivity matrix 
Network=zeros(max(B(:)));
for I=1:size(F,1)
   Network(F(I,1),F(I,2)) =1;
   Network(F(I,2),F(I,1)) =1;
end

% visualizing the connectivity matrix 
Coordinations=sum(Network);
Connections=F;
figure; spy(Network); title('Connectivity matrix');

% visualizing the coordination number distribution 
figure; hist(Coordinations,[0:10]); xlabel('Coordination Number'); ylabel('Frequency');  title('Coordination Number Distribution');
AVERAGE_COORDINATION_NUMBER=mean(Coordinations);
