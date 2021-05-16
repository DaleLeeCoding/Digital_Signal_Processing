%%
%3.1
k = linspace(1,200,200);
sig = exp(1j*2*pi*(sqrt((k/60).*(k/60)-1)));
figure;
plot(k/60, real(sig),'mo-',k/60, imag(sig),'go-')


%%
%3.2
[xx0, tt0] = onecos([2], [5*exp(1j*pi/4)], 2, -1);
figure;
plot(tt0, xx0)
title('One Sinusoid');
xlabel("Time");
ylabel("Amplitude");


%%
%3.3
[xx0, tt0] = add_sines([12,9,0], [exp(j*pi/4), 2i, -4], 1, -0.5);
figure;
plot(tt0, xx0)
title('Sum of Sinusoids');
xlabel("Time");
ylabel("Amplitude");
hold on
localmax = islocalmax(xx0);
plot(tt0(localmax), xx0(localmax), '*r');
xx0_localmax = xx0(find(localmax == 1))
tt0_localmax = tt0(find(localmax == 1))
%위를 근거로 period 계산
period = tt0_localmax(4)-tt0_localmax(1)
DC_value = mean(xx0)

%the value of fundamental frequency for xx0?
% (My opinion)
% When waveforms with multiple frequencies merge, 
% the combined waveform has the lowest frequency and has the characteristics of different frequencies within it.
% In other words, a created waveform has the frequency which is the repeatition of the fundamental frequency.

