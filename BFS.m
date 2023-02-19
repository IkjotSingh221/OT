%nCm=nchoosek(n,m);
%pair=nchoosek(1:n,m)
%B=A(:,pair(i,:))
%y=zeros(n)
%y=B\b
%sol=[sol y]
%if all(y>=0 and y~=-inf and y~=inf)
clc;
close all;
m=input('no. of constraints: ');
n=input('no. of unknowns: ');
% b=[1;2];
% A=[-1 1 1 0;1 1 0 1];
% C=[1 2 0 0];
b=input('b');
A=input('A');
C=input('C');
sol=[];
nCm=nchoosek(n,m);
pair=nchoosek(1:n,m);
for i=1:length(pair)
    y=zeros(n,1);
    B=A(:,pair(i,:));
    if det(B)==0
        fprintf('not a basic solution')
        break;
    end
    if det(B)~=0
        x=B\b;
    if all (x>=0 & x~=-inf & x~=inf)
        y(pair(i,:))=x;
        sol=[sol y];
    end
    end
end
fprintf('BFS')
disp(sol);
Z=C*sol;
[Zmax,Zind] = max(Z);
BFS = sol(:,Zind);
fprintf('optimal soln \n')
disp(BFS);

