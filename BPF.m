function ratio = BPF(x, fc1, fs, fc2)
    % BPF - Bandpass Filter Ratio Calculation
    %   Calculates a ratio based on the amplitude range of the filtered signal.
    %
    %   Parameters:
    %       x   - Input signal
    %       fc1 - Lower cutoff frequency
    %       fs  - Sampling frequency
    %       fc2 - Upper cutoff frequency
    
    % VALIDATION
    if nargin ~= 4
        error(' !! ERROR : Four input arguments are required. !!');
    end
    
    if ~isnumeric(x) || ~isnumeric(fc1) || ~isnumeric(fs) || ~isnumeric(fc2)
        error('!! ERROR : Input parameters must be numeric. !!');
    end
    
    if fc1 >= fc2 || fc1 <= 0 || fs <= 0
        error(' !! ERROR : Invalid cutoff frequencies or sampling frequency. !!');
    end

    % DESIGNING THE BPF
    bpFilter = designfilt('bandpassfir', 'FilterOrder', 500, 'CutoffFrequency1', fc1, 'CutoffFrequency2', fc2, 'SampleRate', fs);
    
    % APPLYING THE FILTER TO THE INPUT SIGNAL
    filteredData = filter(bpFilter, x);

    % DEFINING THE THRESHOLDS VALUES
    threshold1 = 0.9999999999 * max(abs(filteredData));
    threshold2 = 0.7 * max(abs(filteredData));

%     % ASSIGNING RATIOS BASED ON THE AMPs RANGEs
%     if (max(abs(filteredData)) >= threshold1) 
%         ratio = 1; % NEARLY THE -3DB
%     elseif (max(abs(filteredData)) >= threshold2) && (max(abs(filteredData)) <= threshold1)
%         ratio = 0.7; % NEARLY MULTIPLIED BY ONE
%     else
%         ratio = 0; % NEARLY 0 FOR OUT-OF-RANGE FREQUENCIES
%     end
%Finding the ratio for the power of the InputSignal/OutputSignal
    powerOut = filteredData .*filteredData;
    powerOut = sum(powerOut);
    
    powerIn = x .*x;
    powerIn = sum(powerIn);
    
    ratio = powerOut/powerIn;

end
