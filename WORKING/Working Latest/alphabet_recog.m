function [pred] = alphabet_recog(X,Theta1, Theta2)
% fprintf('\nLoading Saved Neural Network Parameters ...\n')
pred = [];
m = size(X, 1);
for i = 1:m
    % Display 
    %fprintf('\nDisplaying Example Image\n');
%     displayData(X(i, :));

    pred = [pred, predict(Theta1, Theta2, X(i,:))];
    % fprintf('\nNeural Network Prediction: %d (digit %d)\n', pred);
    
end
end