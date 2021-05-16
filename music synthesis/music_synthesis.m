%%
% 4 Lab Exercise : Synthesis of Musical Notes
% theVoices(i).noteNumbers : Key Number
% theVoices(i).startPulses : Starting Pulse
% theVoices(i).durations : durations in Pulses

load('bach_fugue.mat')

f_s = 11025;
T_s = 1/f_s;

bpm = 80;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat / 4;


dur = 0;
for i = 1:length(theVoices)
    dur = dur + sum(theVoices(i).durations);
end
size = dur*f_s*seconds_per_pulse;
xx = zeros(1, int64(size));
for i = 1:length(theVoices)
    for j = 1:length(theVoices(i).noteNumbers)
        keynum = theVoices(i).noteNumbers(j);
        tone = key2note(1, keynum, theVoices(i).durations(j)*seconds_per_pulse);
        n1 = round(theVoices(i).startPulses(j)*f_s*seconds_per_pulse);
        n2 = n1 + length(tone) -1;
        xx(n1:n2) = xx(n1:n2) + tone;
    end
end




%% result;
soundsc(xx, f_s)
plotspec(xx, f_s, 512); xlim([0 50]);