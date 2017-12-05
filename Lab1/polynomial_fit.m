function [beta, sse] = polynomial_fit(x, y, p)
% fits a polynomial of degree p to the data variables x and y.
% x, y - data variables
% p - polynomial degree

X = zeros(length(x), p+1);
for i = 1:(p+1)
    X(:,i) = x.^(i-1);
end

% beta = inv(X'*X)*X'*y
beta = (X'*X)\X'*y;

sse = norm(y-X*beta)^2;