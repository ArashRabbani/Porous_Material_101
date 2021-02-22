function vol2(A)
figure; 
S=size(A);
A=1-A;
B=ones(S+2);
B(2:end-1,2:end-1,2:end-1)=A;
isosurface(B); axis equal tight;
end