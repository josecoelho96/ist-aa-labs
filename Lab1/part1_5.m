% Lab1
% Least Square Fitting
% Question 5
load data2a.mat

% find the polynomial coefficients
[b, sse] = polynomial_fit(x, y, 2);

% plot the given data
plot(x, y, '.')
hold on;

% calculate and plot the polynomial found
w = linspace(-1, 1);
y_exp = b(1) + b(2)*w + b(3)*w.^2;
plot(w, y_exp, '--')

title('x and y data and second degree polynomial fit')
legend('Data collected', 'Second degree polynomial fit')
xlabel('x')
ylabel('y')