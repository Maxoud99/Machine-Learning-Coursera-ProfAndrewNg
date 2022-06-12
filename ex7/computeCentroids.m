function centroids = computeCentroids(X, idx, K)

  [m n] = size(X);
  
  centroids = zeros(K, n);
  

  for i = 1:K
      idx_i = find(idx==i);       
      centroids(i,:) = mean(X(idx_i,:));
  end
end