function [cost, grad] = softmaxCost(theta, numClasses, inputSize, lambda, data, labels)


%

% Unroll the parameters from theta
theta = reshape(theta, numClasses, inputSize);

numCases = size(data, 2);
sparse(labels, 1:numCases, 1)
groundTruth = full(sparse(labels, 1:numCases, 1));
cost = 0;

thetagrad = zeros(numClasses, inputSize);

%% ---------- YOUR CODE HERE --------------------------------------
%  Instructions: Compute the cost and gradient for softmax regression.
%                You need to compute thetagrad and cost.
%                The groundTruth matrix might come in handy.






M = theta * data;
% max(M,[],1)，求出来M每一列的最大值；M-每一列的最大值；
 %max(M,[],2)，求出来M每一行的最大值；M-每一行的最大值；
M = bsxfun(@minus, M, max(M, [], 1));
% p = exp(theta*data) ./ repmat(sum(exp(theta*data)), numClasses, 1);
p = exp(M) ./ repmat(sum(exp(M)), numClasses, 1);
cost = -(1. / numCases) * sum(sum(groundTruth .* log(p))) + (lambda / 2.) * sum(sum(theta.^2));
thetagrad = -(1. / numCases) * (groundTruth - p) * data' + lambda * theta;






% ------------------------------------------------------------------
% Unroll the gradient matrices into a vector for minFunc
grad = [thetagrad(:)];
end

