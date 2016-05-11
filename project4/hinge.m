function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
temp=ones(1,n)-w'*xTr.*yTr;
temp(temp<0)=0;
loss=sum(temp)+lambda*w'*w;
temp(temp>0)=1;
k=xTr*(yTr.*temp)';
gradient=-k+2*lambda*w;

