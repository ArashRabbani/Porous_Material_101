function SP=sps(A)
se=zeros(3,3,3); se(2,2,2)=1; se(2,2,3)=1; se(2,2,1)=1; se(2,3,2)=1; se(2,1,2)=1; se(3,2,2)=1; se(1,2,2)=1;
B=imdilate(A,se);
C=B-A;
SP= sum(C(:))/sum(A(:));
end
