function [Network,Connections]=netcon(B)
B=imdilate(B,ones(2,2,2));
C=B; C(:,:,1:end-1)=C(:,:,2:end); 
D=B; D(:,1:end-1,:)=D(:,2:end,:); 
E=B; E(1:end-1,:,:)=E(2:end,:,:);
F=[B(:) C(:); C(:) D(:); B(:) D(:) ;B(:) E(:) ;C(:) E(:) ;D(:) E(:)];
F(F(:,1).*F(:,2)==0,:)=[];
F(F(:,1)==F(:,2),:)=[];
F=unique(F,'rows');

Network=zeros(max(B(:)));
for I=1:size(F,1)
   Network(F(I,1),F(I,2)) =1;
   Network(F(I,2),F(I,1)) =1;
end
Connections=F;
end
