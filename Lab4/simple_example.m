% Lab 4 - AA - Naive Bayes Classifiers

% 2. A simple example
close all;
clear;
load data1.mat

gscatter(xtrain(1,:), xtrain(2,:), ytrain, 'rgb', '...', 18);
title('Training data scatter plot')
xlabel('X(1)')
ylabel('X(2)')

figure;
gscatter(xtest(1,:), xtest(2,:), ytest, 'rgb', '...', 18);
title('Test data scatter plot')
xlabel('X(1)')
ylabel('X(2)')