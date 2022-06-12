function [X_poly] = polyFeatures(X, p)

  X_poly = zeros(numel(X), p); % m x p
 
  
  X_poly(:,1:p) = X(:,1).^(1:p); % w/o for loop
  
end