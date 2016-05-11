function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;
% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);
[~,n]=size(xTe);
ybar=zeros(1,n);
y=ones(1,n);
%pxy1=normpdf(xTe,0,1);
%pxy2=normpdf(xTe,OFFSET,1);
%py1=1-ceil(n/2)/n;
%py2=ceil(n/2)/n;
%part1=py1*pxy1;
%part2=py2*pxy2;
%dif=mean(part1-part2,1);
%ybar(dif<0)=2
%ybar(dif>0)=1
p1=normpdf(xTe(1,:),0,1).*normpdf(xTe(2,:),0,1)./(normpdf(xTe(1,:),0,1).*normpdf(xTe(2,:),0,1)+normpdf(xTe(1,:),OFFSET,1).*normpdf(xTe(2,:),OFFSET,1));
ybar=p1+(y-p1)*2;



