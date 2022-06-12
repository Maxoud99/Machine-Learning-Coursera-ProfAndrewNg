function [C, sigma] = dataset3Params(X, y, Xval, yval)
  C = 1;
  sigma = 0.3;
  

  C_list     = [0.01 0.03 0.1 0.3 1 3 10 30]';
  sigma_list = [0.01 0.03 0.1 0.3 1 3 10 30]';
  
  prediction_error = zeros(length(C_list), length(sigma_list));
  result = zeros(length(C_list)+length(sigma_list),3);
  row = 1;
  
  for i = 1:length(C_list)
      for j = 1: length(sigma_list)
          C_test = C_list(i);
          sigma_test = sigma_list(j);
          
          model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
          predictions = svmPredict(model, Xval);
          prediction_error(i,j) = mean(double(predictions ~= yval));
          
          result(row,:) = [prediction_error(i,j), C_test, sigma_test];
          row = row + 1;
      end
  end
  sorted_result = sortrows(result, 1);
  
  C = sorted_result(1,2);
  sigma = sorted_result(1,3);

end