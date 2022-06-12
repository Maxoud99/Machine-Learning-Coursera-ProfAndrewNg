function [error_train, error_val] = ...
      learningCurve(X, y, Xval, yval, lambda)
  m = size(X, 1);
  

  error_train = zeros(m, 1);
  error_val   = zeros(m, 1);
  
  for i = 1:m
      Xtrain = X(1:i,:);
      ytrain = y(1:i);
      
      theta = trainLinearReg(Xtrain, ytrain, lambda);
      
      error_train(i) = linearRegCostFunction(Xtrain, ytrain, theta, 0);
      error_val(i)   = linearRegCostFunction(Xval, yval, theta, 0);
  end
  

end