function Z = projectData(X, U, K)

  Z = zeros(size(X, 1), K);
  
  
  U_reduce = U(:,[1:K]);   % n x K
  Z = X * U_reduce;        % m x k
  
end