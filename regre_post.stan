data {
    int N;
    real gdp[N];
    real alcohol_val[N];
}
parameters{
    real alpha;
    real<upper=0> beta;
    real<upper=0> beta2;
    real<lower=0> sigma;
}

transformed parameters {
   vector[N] mu;
   for (i in 1:N){
    mu[i]=gdp[i]*beta+gdp[i]*gdp[i]*beta2+alpha;
   }
}

model{
    alpha ~ normal(12,2.5);
    beta ~ normal(0,0.01);
    beta2 ~ normal(0,1.1);
    sigma ~ normal(0,0.6);
    for (i in 1:N){
    alcohol_val[i] ~ normal(mu[i],sigma); 
}}

generated quantities {
   real alcohol[N];
   real log_lik[N];
   for (i in 1:N){
    alcohol[i] =  normal_rng(mu[i], sigma);
    log_lik[i] =  normal_lpdf(alcohol_val[i]| mu[i], sigma);
}
}