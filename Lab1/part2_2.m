% Lab1
% Regularization
% Question 2-3

load data3.mat

[B,FitInfo] = lasso(X,Y);
lassoPlot(B,FitInfo,'PlotType','Lambda','XScale','log');

[B_LS,FitInfo_LS] = lasso(X,Y, 'Lambda', 0);
hold on

y = B_LS*ones(size(FitInfo.Lambda));
plot(FitInfo.Lambda, y)

legend('B_1', 'B_2', 'B_3', 'B_1(LS)', 'B_2(LS)', 'B_1(LS)')
ylabel('Coefficient value')