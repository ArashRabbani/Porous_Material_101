function B=ovspheres(S,N,Rad) 
if nargin==0
S=[100,100,100];
N=500;
Rad=10;
end
A=zeros(S);
A(randi(prod(S),N,1))=1;
B=bwdist(A);
B=B<Rad;
end