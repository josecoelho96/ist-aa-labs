% Lab3 AA - 81013 - 81398
% Shift: Tuesday
clear
load digits
N_tests = 1;
epochs = zeros(N_tests, 1);

for i=1:N_tests
    net = patternnet([15]);
    net.performFcn='mse';   
    net.layers{1}.transferFcn='tansig';
    net.layers{2}.transferFcn='tansig';
    net.divideFcn='divideind';
    net.divideParam.trainInd=1:400;
    net.divideParam.testInd=401:560;
    net.trainFcn = 'traingdx';
    net.trainParam.lr=2; % learning rate
    net.trainParam.mc=0.9; % Momentum constant
  
    net.trainParam.show=10000; % # of epochs in display
    net.trainParam.epochs=10000; % max epochs
    net.trainParam.goal=0.05; % training goal
    [net,tr] = train(net,X,T);
    epochs(i) = tr.best_epoch;
end
 
median(epochs)

% plot the confusion matrix if only 1 test performed
if N_tests == 1
    x_test=X(:,tr.testInd);
    t_test=T(:,tr.testInd);
    y_test = net(x_test);
    plotconfusion(t_test,y_test);
end

