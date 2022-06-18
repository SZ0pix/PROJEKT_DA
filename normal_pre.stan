generated quantities {
   real mu = normal_rng(12.5,2.5);
   real sigma = fabs(normal_rng(0,0.6));
   real alcohol =  normal_rng(mu, sigma);
}