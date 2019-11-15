function time_constant = get_time_constant(values, interval_time)
% function returns the time_constant of the values input. 

% constants
time_frequency = 16*10^6;


if values(1) < values(length(values))
    % time_constant
    time_constant_y_value = values(1) + (values(length(values))-values(1))*0.63;

    % find the time where values is closest to time_constant_y_value
    prev_value = values(1);
    for i = 1:1:length(values)
        if (prev_value < time_constant_y_value && time_constant_y_value < values(i))
            % time_constant_y_value is between last and this value. 
            % set this time i to be the time constant
            time_constant = i;
    
        elseif values(i) == time_constant_y_value
            % time_constant_y_value was equal to a value in values
            % we set this time i to be the time constant
            time_constant = i;
    

        end
            prev_value = values(i);
    end
    
elseif values(1) > values(length(values)) 
    % annen metode
    
    % time_constant
    time_constant_y_value = values(length(values))+(values(1)-values(length(values)))*0.63;

    % find the time where values is closest to time_constant_y_value
    prev_value = values(1);
    for i = 1:1:length(values)
        if (prev_value > time_constant_y_value && time_constant_y_value > values(i))
            % time_constant_y_value is between last and this value. 
            % set this time i to be the time constant
            time_constant = i;
    
        elseif values(i) == time_constant_y_value
            % time_constant_y_value was equal to a value in values
            % we set this time i to be the time constant
            time_constant = i;
    
        end
        prev_value = values(i);
    end 
end 

time_constant = time_constant*interval_time;

end