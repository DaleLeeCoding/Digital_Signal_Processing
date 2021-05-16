function [xx, tt] = add_sines(freqs, Camps, dur, tstart)
    tt = tstart:1/(16*dur* max(freqs)):(tstart+dur);
    
    if length(freqs) ~= length(Camps)
        error('Note: freqs and Camps must be the same length.')
    end
    
    xx = zeros(1, length(tt));
    
    for i = 1:length(freqs)
        xx = xx + real(Camps(i)*exp(1j*2*pi*freqs(i)*tt));
    end
        
end
