function plotData(X, y)

  

  pos = find(y==1); 
  neg = find(y==0); 
  

  figure;
  

  plot(X(pos,1),X(pos,2),'g+');
  
  hold on;  
  
  plot(X(neg,1),X(neg,2),'ro');
  
  
  hold off;
end