function posterior_x = kalman_filter( k, x_0, p_0, input )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

format long;

if k<= 0
    exception = MException('KalmanFilter:InvalidK', ...
       'The value of K must be positive');
    throw(exception);
end

i_k = 1;

posterior_x = x_0;
posterior_error = p_0;

while i_k <= k
    % time update (prediction)
    prior_x = posterior_x;
    prior_error = posterior_error;
    
    % measurement update (correction)
    k_k = prior_error / (prior_error + 0.1);
    posterior_x = prior_x + (k_k * (input(i_k) - prior_x)); 
    posterior_error = (1 - k_k) * prior_error;

    % counter
    i_k = i_k + 1;
end

end

