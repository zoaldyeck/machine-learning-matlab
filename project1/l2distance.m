function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    D=l2distance(X,X);
else  % case when there are two inputs (X,Z)
	%% fill in code here
    G=innerproduct(X,Z);
    Ss=diag(innerproduct(X,X));
    Rr=diag(innerproduct(Z,Z));
    [~,n]=size(X);
    [~,m]=size(Z);
    S=repmat(Ss,1,m);
    R=repmat(Rr',n,1);
    D=sqrt(S+R-2*G);
end;
%



