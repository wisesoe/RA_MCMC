function Y = logsumexp(X,dim)
% LOGSUMEXP    returns log(sum(exp(X),dim)) while avoiding numerical underflow

% Written by J.Mao
%%
if nargin<2, dim = 1; end

MX = max(X,[],dim); 
XShift = bsxfun(@minus,X,MX); %subtract the largest in dim
Y = MX + log(sum(exp(XShift),dim));
Y(any(isnan(X),dim)) = NaN;