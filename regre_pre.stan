data {
    int N;
    real gdp[N];
}

generated quantities {
   real alpha = normal_rng(12.5,2.5);
   real beta = fabs(normal_rng(0,1.1));
   real beta2 = -fabs(normal_rng(0,1.3));
   real sigma = fabs(normal_rng(0,0.6));
   real alcohol[N];
   for (i in 1:N){
   alcohol[i] =  normal_rng(gdp[i]*beta+gdp[i]^2*beta2+alpha, sigma);
}}
