function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%



% X dim 5000 x 400
% Theta1 dim 25 x 401
% Theta2 dim 10 x 26

% First layer
a1 = [[ones(size(X,1), 1)], X]; % Add col of ones to X, a1 dim 5000 x 401
z2 = a1 * Theta1';  % z1 dim 5000 x 401

% Second layer
a2 = [[ones(size(z2,1), 1)], sigmoid(z2)]; % Add col of ones to a1, dim 26 x 5000
z3 = a2 * Theta2'; % a2 dim 10 x 5000
a3 = sigmoid(z3);

% for x:num_labels,
[r_max, c_max] = max(a3, [], 2);  % row, column indices for max prob
p = c_max;                        % col index max == k == predicted class
disp(size(p))



% =========================================================================


end
