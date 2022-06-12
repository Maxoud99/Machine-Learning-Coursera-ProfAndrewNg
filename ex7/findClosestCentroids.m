function idx = findClosestCentroids(X, centroids)
  K = size(centroids, 1); 
  idx = zeros(size(X,1), 1);
  for i = 1:size(X,1)
      temp = zeros(K,1);
      for j = 1:K
          temp(j)=sqrt(sum((X(i,:)-centroids(j,:)).^2));
      end
      [~,idx(i)] = min(temp);
  end
end