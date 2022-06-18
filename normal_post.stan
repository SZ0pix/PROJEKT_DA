data {
    int N;
    real alcohol_val[N];
}
parameters {
    real<lower=0> mu;
    real<lower=0> sigma;
}

model {
    mu ~ normal(12.5,2.5);
    sigma ~ normal(0,0.6);
    alcohol_val[N] ~ normal(mu,sigma); 
    for(i in 1:N)
    target += normal_lpdf(alcohol_val[i] | mu, sigma);
}
generated quantities {
    real alcohol[N];
    vector[N] log_lik;
    for (i in 1:N){
    alcohol[i] =  normal_rng(mu, sigma);
    log_lik[i] =  normal_lpdf(alcohol_val[i]| mu, sigma);
}}