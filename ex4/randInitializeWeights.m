function W = randInitializeWeights(L_in, L_out)
  W = zeros(L_out, 1 + L_in);
  epsilon_init = sqrt(6)/(sqrt(L_in)+sqrt(L_out));
  W = - epsilon_init + rand(L_out, 1 + L_in) * 2 * epsilon_init ;

end