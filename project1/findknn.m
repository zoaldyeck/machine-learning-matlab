function [indices,dists]=findknn(xTr,xTe,k);
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxm matrix, where indices(i,j) is the i^th nearest neighbor of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors
%

% output random results, please erase this code
[~,ntr]=size(xTr);
%[d,nte]=size(xTe);
%indices=ceil(rand(k,nte)*ntr);
%dists=rand(k,nte);
X=l2distance(xTr,xTe);
[dist,indice]=sort(X,1,'ascend');
if k>=ntr
    indices=indice;
    dists=dist;
else
    indices=indice(1:k,:);
    dists=dist(1:k,:);
end;

%% fill in code here
	
	
%%	%
	
