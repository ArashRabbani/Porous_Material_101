function A=randgauss(S,Poro,STD)
if nargin==0
S=[100,100,100];
Poro=.2;
STD=2;
end
if nargin==1
Poro=.2;
STD=2;
end
if nargin==2
STD=2;
end
A=rand(S);
A=imgaussfilt3(A,STD,'Padding','replicate');
Q=quantile(A(:),Poro);
A=A>Q;
end