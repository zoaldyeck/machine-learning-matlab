function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
%[d,n]=size(xTe);
%[d,ntr]=size(xTr);
%if k>ntr,k=ntr;end;

%currently assigning random predictions
%un=unique(yTr);
%preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here
[indices,dists]=findknn(xTr,xTe,k);
if k==1
   preds=yTr(indices);
else
   [~,n]=size(indices);
   temp=yTr(indices);
   preds=zeros(1,n);
   if n==1
       temp=temp';
   end;
   for i = 1:n
       tem=temp(:,i);
       dis=dists(:,i);
       ui=unique(tem);
       [m,~]=size(ui);
       wt=zeros(m,1);
       for j=1:m
           index=find(tem==ui(j));
           [number,~]=size(index);
           wt(j)=sum(dis(index))/number-1.6*number;
       end;
       [~,x]=min(wt);
       preds(1,i)=ui(x);
   end;   
end;


