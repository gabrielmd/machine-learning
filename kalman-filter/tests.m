function [ output_args ] = tests(  )

x_0 = 0;
p_0 = 1;

input = [0.39	0.50	0.48	0.29	0.25	0.32	0.34	0.48	0.41	0.45];

% k > 0 -- it does not make sense having k <= 0
try
    kalman_filter(0, x_0, p_0, input);
    assert(false, 'Failed in test for k = 0');
    
    kalman_filter(-1, x_0, p_0, input);
    assert(false, 'Failed in test for k < 0');
catch
    % success
end

% estimate x_1
x_1 = kalman_filter(1, x_0, p_0, input);
assert(floor((x_1 * 10000)) == 3545);

% estimate x_10
x_10 = kalman_filter(10, x_0, p_0, input);
assert(floor((x_10 * 10000)) == 3871);

end

