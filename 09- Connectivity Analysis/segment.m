function [L]=segment(A)
A=double(A);
A=1-A;
B=bwdist(1-A);
B=imgaussfilt3(B,2);
L=watershed(-B);
L=double(L).*double(A);
end