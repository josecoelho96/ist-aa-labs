%% 4.1 Polynomial kernel
clear

load spiral
% 
% p_max = 20;
% % first column: error
% % # of support vectors
% results_polynomial = zeros(p_max, 2);
% 
% for p=1:p_max
%     % 'Showplot', true
%     SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'polynomial', 'polyorder', p);
%     Y_classifiedPol = svmclassify(SVMStruct, X);
% 
%     error_quantity = 0;
%     support_vectors_qty = size(SVMStruct.SupportVectors, 1);
% 
%     if isequal(Y, Y_classifiedPol)
%         fprintf('Y was successfully classified!\n')
%     else
%         error_quantity = ((sum((Y-Y_classifiedPol) ~= 0))/length(Y))*100;
%         fprintf('Y was not successfully classified!\n')
%     end
% 
%     fprintf('Error: %d%%\n', error_quantity);
%     fprintf('Number of support vectors: %d\n', support_vectors_qty);
%     results_polynomial(p, 1) = error_quantity;
%     results_polynomial(p, 2) = support_vectors_qty;
% 
% end
% 
% figure;
% plot(results_polynomial(:,1))
% hold on;
% plot(results_polynomial(:,2))
% title('Error and number of support vectors evolution with p');
% legend('Error', 'Number of support vectors');
% xlabel('p');
% 
% 
% figure;
% best_p = 6;
% SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'polynomial', 'polyorder', best_p, 'Showplot', true);
% Y_classify_best_p = svmclassify(SVMStruct, X, 'Showplot', true);
% title(sprintf('Polynomial kernel, order %d', best_p));

%% 4.2 RBF kernel

clear

load spiral

rbf_sigma_min = 0.01;
rbf_sigma_max = 1.5;
rbf_sigma_step = 0.01;
rbf_sigmas = rbf_sigma_min:rbf_sigma_step:rbf_sigma_max;

% % first column: error
% % # of support vectors
results_rbf = zeros(size(rbf_sigmas, 2), 2);

for i = 1:size(rbf_sigmas, 2)
    % 'Showplot', true
    SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'rbf', 'rbf_sigma', rbf_sigmas(i));
    Y_classifiedRBF = svmclassify(SVMStruct, X);
    
    error_quantity = 0;
    support_vectors_qty = size(SVMStruct.SupportVectors, 1);
    
    if isequal(Y, Y_classifiedRBF)
        fprintf('Y was successfully classified!\n')
    else
        error_quantity = ((sum((Y-Y_classifiedRBF) ~= 0))/length(Y))*100;
        fprintf('Y was not successfully classified!\n')
    end
    
    fprintf('Error: %d%%\n', error_quantity);
    fprintf('Number of support vectors: %d\n', support_vectors_qty);
    results_rbf(i, 1) = error_quantity;
    results_rbf(i, 2) = support_vectors_qty;
    
end

figure;
plot(rbf_sigmas, results_rbf(:,1))
hold on;
plot(rbf_sigmas, results_rbf(:,2))
title('Error and number of support vectors evolution with sigma');
legend('Error', 'Number of support vectors');
xlabel('rbf sigma');

% plot best one
figure;
sigma = 0.89;
SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
Y_classifiedRBF_test = svmclassify(SVMStruct, X, 'Showplot', true);



%% 4.3 

clear

load chess33

rbf_sigma_min = 0.5;
rbf_sigma_max = 2.5;
rbf_sigma_step = 0.1;
rbf_sigmas = rbf_sigma_min:rbf_sigma_step:rbf_sigma_max;

% % first column: error
% % # of support vectors
results_rbf = zeros(size(rbf_sigmas, 2), 2);

for i = 1:size(rbf_sigmas, 2)
    sigma = rbf_sigmas(i);
    SVMStruct = svmtrain(X, Y, 'method', 'QP', 'boxconstraint', Inf, 'kernel_function', 'rbf', 'rbf_sigma', sigma);
    Y_classifiedChess = svmclassify(SVMStruct, X);
    
    error_quantity = 0;
    support_vectors_qty = size(SVMStruct.SupportVectors, 1);
    
    if isequal(Y, Y_classifiedChess)
        fprintf('Y was successfully classified!\n')
    else
        error_quantity = ((sum((Y-Y_classifiedChess) ~= 0))/length(Y))*100;
        fprintf('Y was not successfully classified!\n')
    end
    
    fprintf('Error: %d%%\n', error_quantity);
    fprintf('Number of support vectors: %d\n', support_vectors_qty);
    results_rbf(i, 1) = error_quantity;
    results_rbf(i, 2) = support_vectors_qty;
end

figure;
plot(rbf_sigmas, results_rbf(:,1))
hold on;
plot(rbf_sigmas, results_rbf(:,2))
title('Error and number of support vectors evolution with sigma');
legend('Error', 'Number of support vectors');
xlabel('rbf sigma');


% plot best one
figure;
sigma = 1;
SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
svmclassify(SVMStruct, X, 'Showplot', true);
title(sprintf('Sigma=%d',sigma));

figure;
sigma = 1.4;
SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
svmclassify(SVMStruct, X, 'Showplot', true);
title(sprintf('Sigma=%d',sigma));

figure;
sigma = 1.8;
SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
svmclassify(SVMStruct, X, 'Showplot', true);
title(sprintf('Sigma=%d',sigma));

figure;
sigma = 2.3;
SVMStruct = svmtrain(X,Y, 'method', 'QP', 'boxconstraint', 10^4, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
svmclassify(SVMStruct, X, 'Showplot', true);
title(sprintf('Sigma=%d',sigma));


%% 4.4
clear

load chess33n
figure;
sigma = 1;
SVMStruct = svmtrain(X, Y, 'method', 'QP', 'boxconstraint', Inf, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
Y_classifiedChess = svmclassify(SVMStruct, X, 'Showplot', true);
support_vectors_qty = size(SVMStruct.SupportVectors, 1);
title(sprintf('Sigma=%d #sv=%d',sigma, support_vectors_qty));

figure;
sigma = 1.4;
SVMStruct = svmtrain(X, Y, 'method', 'QP', 'boxconstraint', Inf, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
Y_classifiedChess = svmclassify(SVMStruct, X, 'Showplot', true);
support_vectors_qty = size(SVMStruct.SupportVectors, 1);
title(sprintf('Sigma=%d #sv=%d',sigma, support_vectors_qty));



%% 4.5
clear

load chess33n
figure;
sigma = 2.3;
val = 10^7;

SVMStruct = svmtrain(X, Y, 'method', 'QP', 'boxconstraint', val, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Showplot', true);
Y_classifiedChess = svmclassify(SVMStruct, X, 'Showplot', true);
support_vectors_qty = size(SVMStruct.SupportVectors, 1);
title(sprintf('Sigma=%d #sv=%d',sigma, support_vectors_qty));
