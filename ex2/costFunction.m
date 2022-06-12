function [J, grad] = costFunction(theta, X, y)
  m = length(y);
  
  J = 0;
  grad = zeros(size(theta));
  
  
  z = X * theta; 
  h_x = sigmoid(z);
  
  J = (1/m)*sum((-y.*log(h_x))-((1-y).*log(1-h_x)));
  
  grad = (1/m)* (X'*(h_x-y));
  
  
end