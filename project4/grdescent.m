function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%
tic;
if nargin<5,tolerance=1e-02;end;
for i=1:maxiter
    [loss2,gradient]=func(w0);
    if i>1
        if loss2<=loss1
            stepsize=1.01*stepsize;
        else
            stepsize=0.5*stepsize;
        end
    end
    w1=w0-stepsize*gradient;
    w0=w1;
    if norm(gradient)<tolerance
        w=w0;
        break;
    end
    loss1=loss2;
end
w=w0;
toc;