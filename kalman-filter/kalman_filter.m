function posterior_x = kalman_filter( k, x_0, p_0, input )
% KALMAN_FILTER - this is a very simple implementation of a Kalman Filter
% It considers that the input is constant with a Gaussian error
%
% Based on the description from:
% http://bilgin.esme.org/BitsBytes/KalmanFilterforDummies.aspx
format long;

if k<= 0
    exception = MException('KalmanFilter:InvalidK', ...
       'The value of K must be positive');
    throw(exception);
end

i_k = 1;

% Initial values
posterior_x = x_0;
posterior_error = p_0;

while i_k <= k
    % Time update (prediction)
    %  - the posterior values from the last time interval are now
    %    considered as priors
    prior_x = posterior_x; 
    prior_error = posterior_error;
    
    % Measurement update (correction)
    %  - calculating the value of the posterior based on the observed value
    %    at time k (the value at 'input(i_k)')
    k_k = prior_error / (prior_error + 0.1);
    posterior_x = prior_x + (k_k * (input(i_k) - prior_x)); 
    posterior_error = (1 - k_k) * prior_error;

    % counter
    i_k = i_k + 1;
end

end

