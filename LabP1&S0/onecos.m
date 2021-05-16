function [xx, tt] = onecos(freq, camp, dur, tstart)
    tt = tstart:1/(16*dur*freq):(tstart+dur);
    xx = real(camp*exp(1j*2*pi*freq*tt));
end