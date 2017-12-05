% Lab1
% Regularization
% Question 4

load data3.mat

[B,FitInfo] = lasso(X,Y);
[B_LS,FitInfo_LS] = lasso(X,Y, 'Lambda', 0);

lassoPlot(B,FitInfo,'PlotType','Lambda','XScale','linear');

lambda_index = 59;
lambda = 0.0633;

% do not consider x2 as it is the irrelevant feature
Y_Lasso = X(:,1)*B(1, lambda_index)+X(:,3)*B(3, lambda_index);
Y_LS = X(:,1)*B_LS(1) + X(:,3)*B_LS(3);

plot(Y)
hold on
plot(Y_Lasso)
plot(Y_LS)
title('output Y, Lasso regression and LS')
legend('Y', 'Y (Lasso)', 'Y (LS)')
xlabel('index')
ylabel('Y')

error_lasso = 0;
error_ls = 0;
for i=1:length(Y)
    error_lasso = error_lasso + (Y(i)-Y_Lasso(i))^2;
    error_ls = error_ls + (Y(i)-Y_LS(i))^2;
end