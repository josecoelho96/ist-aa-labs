% Lab1
% Regularization
% Question 2-3

load data3.mat

[B,FitInfo] = lasso(X,Y);
[B_LS,FitInfo_LS] = lasso(X,Y, 'Lambda', 0);
B_ridge = ridge(Y, X, FitInfo.Lambda);

lambda_index = 59;
lambda = 0.0633;

y = B_LS*ones(size(FitInfo.Lambda));

semilogx(FitInfo.Lambda, B_ridge);
hold on
plot(FitInfo.Lambda, y)

title('Ridge Trace')
legend('B_1', 'B_2', 'B_3', 'B_1(LS)', 'B_2(LS)', 'B_1(LS)')
ylabel('Coefficient value')
xlabel('Ridge paramater')



Y_Ridge = X(:,1)*B_ridge(1, lambda_index)+X(:,3)*B_ridge(3, lambda_index);
Y_LS = X(:,1)*B_LS(1) + X(:,3)*B_LS(3);

figure()
plot(Y)
hold on
plot(Y_Ridge)
plot(Y_LS)

title('output Y, Ridge regression and LS')
legend('Y', 'Y (Ridge)', 'Y (LS)')
xlabel('index')
ylabel('Y')

error_ridge = 0;
error_ls = 0;
for i=1:length(Y)
    error_ridge = error_ridge + (Y(i)-Y_Ridge(i))^2;
    error_ls = error_ls + (Y(i)-Y_LS(i))^2;
end
