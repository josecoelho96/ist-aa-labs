% Lab3 AA - 81013 - 81398
% Shift: Tuesday
clear
load regression_data
net = fitnet(40);
net.layers{2}.transferFcn='purelin';
net.performFcn='mse';
net.trainParam.goal=0.005; % training goal
net.trainParam.show=10000; % # of epochs in display
net.trainParam.epochs=10000; % max epochs

net.divideFcn='divideind';
net.divideParam.trainInd=1:70;
% net.divideParam.valInd=71:85;
net.divideParam.testInd=86:100;

[net,tr] = train(net,X,T);

% data plotting
% training data
plot(X(net.divideParam.trainInd), T(net.divideParam.trainInd), '.')
hold on
% test data
plot(X(net.divideParam.testInd), T(net.divideParam.testInd), '.')
% estimate of function (HOW)
x_plot = -1:0.001:1;
y_plot = net(x_plot);
plot(x_plot, y_plot, '--')
legend('Train data', 'Test data', 'Estimated function')
xlabel('x')
ylabel('f(x)')
title('Regression data')