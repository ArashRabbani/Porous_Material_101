clear; close all
S=[100,100,100];
A=zeros(S);
N=500;
Rad=10;

A(randi(prod(S),N,1))=1;
B=bwdist(A);
B=B<Rad;
vol(B)