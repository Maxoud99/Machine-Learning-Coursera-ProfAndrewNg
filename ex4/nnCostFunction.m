function [J, grad] = nnCostFunction(nn_params, ...
      input_layer_size, ...
      hidden_layer_size, ...
      num_labels, ...
      X, y, lambda)

  
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
      hidden_layer_size, (input_layer_size + 1));
  
  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
      num_labels, (hidden_layer_size + 1));
  

  m = size(X, 1);
  

  J = 0;
  Theta1_grad = zeros(size(Theta1)); 
  Theta2_grad = zeros(size(Theta2)); 
  
  

  
  X = [ones(m,1), X];  
  
  a1 = X;
  
  z2 = a1 * Theta1';  
  a2 = sigmoid(z2); 
  a2 = [ones(size(a2,1),1), a2];
  
  z3 = a2 * Theta2';  
  a3 = sigmoid(z3); 
  
  h_x = a3; 
  

  
  y_Vec = (1:num_labels)==y; 
  

  J = (1/m) * sum(sum((-y_Vec.*log(h_x))-((1-y_Vec).*log(1-h_x))));  
  
  

  

  A1 = X;
  
  Z2 = A1 * Theta1'; 
  A2 = sigmoid(Z2);
  A2 = [ones(size(A2,1),1), A2];
  
  Z3 = A2 * Theta2';  
  A3 = sigmoid(Z3); 
  
  
  y_Vec = (1:num_labels)==y; 
  
  DELTA3 = A3 - y_Vec; 
  DELTA2 = (DELTA3 * Theta2) .* [ones(size(Z2,1),1) sigmoidGradient(Z2)]; 
  DELTA2 = DELTA2(:,2:end); 
  
  Theta1_grad = (1/m) * (DELTA2' * A1); % 25 x 401
  Theta2_grad = (1/m) * (DELTA3' * A2); % 10 x 26
  
  reg_term = (lambda/(2*m)) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2))); 
  

  J = J + reg_term;
  
  Theta1_grad_reg_term = (lambda/m) * [zeros(size(Theta1, 1), 1) Theta1(:,2:end)];
  Theta2_grad_reg_term = (lambda/m) * [zeros(size(Theta2, 1), 1) Theta2(:,2:end)]; 
  Theta1_grad = Theta1_grad + Theta1_grad_reg_term;
  Theta2_grad = Theta2_grad + Theta2_grad_reg_term;
  
  grad = [Theta1_grad(:) ; Theta2_grad(:)];

end