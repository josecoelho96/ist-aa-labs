% Lab1
% Least Square Fitting
% Question 3

load data1.mat

% find the polynomial coefficients
[b, sse] = polynomial_fit(x, y, 1);

% plot the given data
plot(x, y, '.')
hold on;

% calculate and plot the polynomial found
w = linspace(-1, 1);
y_exp = b(1) + b(2)*w;
plot(w, y_exp, '--')
title('x and y data and straight line fit')
legend('Data collected', 'Straight line fit')
xlabel('x')
ylabel('y')
