data {
    int N;
    real gdp[N];
}

generated quantities {
   real alpha = normal_rng(12,2.5);
   real beta = fabs(normal_rng(0,0.01));
   real beta2 = -fabs(normal_rng(0,1));
   real sigma = fabs(normal_rng(0,0.6));
   real alcohol[N];
   for (i in 1:N){
   alcohol[N] =  normal_rng(gdp[N]*beta+gdp[N]^2*beta2+alpha, sigma);
}}
