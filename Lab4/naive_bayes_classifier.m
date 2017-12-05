% Lab 4 - AA - Naive Bayes Classifiers
% 81013 - 81398
% Tuesday, Group 2
%
% 2. A simple example - Naive Bayes Classifier
% Bayes classifier works by selecting the class i
% that has maximum probability P(Ci|x), given a observation x
% 
% By Bayes Law: P(Ci|x) = (P(x|Ci)*P(Ci))/P(x)
% P(x|Ci) = distribution of the feature vector x associated to class Ci 
% P(Ci) = a priori distribution of the classes
% P(x) = normalization term, does not affect the decision
% 
% P(x|Ci) might be hard to compute! 
% That's because the feature vector x=[x1, ..., xp] contains many features. 
% 
% Naïve Bayes 
% This simplifies the problem by assuming that features are independent
% Then, the distribution of the feature vector x associated to a class C 
% P(x|C) can be computed as:
% P(x|C) = P(x_1|C)*P(x_2|C)*....*P(x_(p-1)|C)*P(x_p|C)

% Close all figures and clean workspace
close all;
clear;

% load data file
load data1.mat

% counter to separate x data by classes (3)
class_size = zeros(1, 3);

% separate by class
for i=1:length(ytrain)   
    class_size(ytrain(i)) = class_size(ytrain(i)) + 1;
    class_xtrain(ytrain(i), :, class_size(ytrain(i))) = xtrain(:,i);
end

% Holds the estimative of mean and standard deviation in a structure like this
%     x1  x2
% C1  --  --
% C2  --  --
% C3  --  --
estimative_mean = zeros(3, 2);
estimative_std_dev = zeros(3, 2);

% 3 classes
for i=1:3
    % 2D features
    for j=1:2
        % mean = sum(x_i)/N
        % std_dev = sqrt(sum(x_i-mean)/N)
       estimative_mean(i,j) = sum(class_xtrain(i, j, :))/length(class_xtrain(i, j, :));
       estimative_std_dev(i,j) = sqrt(sum((class_xtrain(i, j, :)-estimative_mean(i, j, :)).^2)/length(class_xtrain(i, j, :)));
    end
end

% Get a priori distribution of the classes P(C_i)
P_c = class_size/sum(class_size);

% Test the classifier using xtest and ytest
% save classifier predictions
y_predicted = zeros(size(ytest));
misses = 0;

for i=1:length(ytest)
    
    % observation to classify
    xt = xtest(:,i);
    
    % temporarily save probabilities P(Cj|xi)
    P_C_x = zeros(1,3);
    % temporarily save probabilities P(x|Cj)
    P_x_C = ones(1,3);
    
    % calculate probability for each class
    for j=1:3
        % get conditional distribution P(x|Cj)
        % using Naïve Bayes: P(x|Cj) = P(x_1|Cj)*P(x_2|Cj) 
        for k=1:2
            % P(x_k|Cj) has a gaussian distribution
            % Using values calculated before
            P_x_C(j) = P_x_C(j) * normpdf(xt(k), estimative_mean(j, k), estimative_std_dev(j, k));
        end
        % Get P(Cj|xi)
        P_C_x(j) = P_x_C(j)*P_c(j);
    end
    
    % get class with maximum probability
    [~, I] = max(P_C_x);
    y_predicted(i) = I; 
        
    % check if there is an error, and if so, update it
    if y_predicted(i) ~= ytest(i)
        misses = misses + 1;
    end
end

% plot data
plot(y_predicted, '.')
title('Data classification')
xlabel('Data Index')
ylabel('Estimated classifier')
error = (misses/length(ytest))*100;
fprintf('Error: %f%% \n', error)