function [lambda_vec, error_train, error_val] = ...
      validationCurve(X, y, Xval, yval)
  lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';
  
  error_train = zeros(length(lambda_vec), 1);
  error_val = zeros(length(lambda_vec), 1);
  
  
  m = size(X, 1);
  

  



  for j = 1:length(lambda_vec)
      lambda = lambda_vec(j);
      
      theta = trainLinearReg(X, y, lambda);
      error_train(j) = linearRegCostFunction(X, y, theta, 0);
      error_val(j)   = linearRegCostFunction(Xval, yval, theta, 0); 
  end

  
end