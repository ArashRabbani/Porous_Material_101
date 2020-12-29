function B=novspheres(S,N,Rad) 
if nargin==0
S=[100,100,100];
N=5000;
Rad=10;
end
A=zeros(S);

Points=randi(prod(S),N,1);
[x,y,z]=ind2sub(S,Points);
C=[x,y,z];
I=0;
while I<=size(C,1)-1
I=I+1;
Dist=sqrt(sum((C(I:end,:)-repmat(C(I,:),size(C,1)-I+1,1)).^2,2));
Neig=find(Dist<2*Rad)+I-1; 
Neig=setdiff(Neig,I);
if size(Neig,2)==0; continue; end
C(I,:)=round(mean(C([Neig;I],:)));
C(Neig,:)=[];
end
IND=sub2ind(S,C(:,1),C(:,2),C(:,3));
A(IND)=1;


B=bwdist(A);
B=B<Rad;
end