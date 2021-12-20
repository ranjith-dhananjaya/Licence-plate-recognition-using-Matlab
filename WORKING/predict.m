function p = predict(Theta1, Theta2, X)

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

X = [ones(m,1) X];
A = sigmoid(X * Theta1');
A = [ones(m,1) A];
[B, p] = max(A * Theta2', [] , 2);

% p = readLetter(Ip);
end
