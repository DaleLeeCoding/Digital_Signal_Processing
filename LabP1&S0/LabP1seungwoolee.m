%% 3.Lab Exercise
%(a) 
freq = 4000;
T = 1/freq;
ts = T/100;
tt = -3*T:ts:3*T; %period 당 25 샘플 이상입니다.

%(b) A1= 26, D = 30, M = 9 (1996/09/30)
A1 = 26;
A2 = 1.2*A1;
D = 30;
M = 9;
tm1 = (37.2/M)*T;
tm2 = -(41.3/D)*T;
x1 = A1*cos((2*pi*4000)*(tt-tm1));
x2 = A2*cos((2*pi*4000)*(tt-tm2));

figure;
subplot(3,1,1);
plot(tt, x1)
title('SEUNGWOO LEE , x1');
xlabel("Time");
ylabel("Amplitude");
grid on
hold on
subplot(3,1,2);
plot(tt, x2)
title('SEUNGWOO LEE , x2');
xlabel("Time");
ylabel("Amplitude");
grid on
hold on

%(c)
x3 = x1 + x2;
subplot(3,1,3);
plot(tt, x3)
title('SEUNGWOO LEE , x3 = (x1+x2)');
xlabel("Time");
ylabel("Amplitude");
grid on
%(d)
fig = figure;
surf(peaks)
orient(fig,'tall')
print(fig, 'LabP1.pdf', '-dpdf')

%%

%3.1-(a)
[x1_value,x1_time] = max(x1);
[x2_value,x2_time] = max(x2);
amplitude1 = x1_value %x1최댓값
amplitude2 = x2_value %x2최댓값

w1 = 2*pi/T
%shift 계산과정 w1*tt(x1_time)+phase_1 = 0
phase_1 = -w1*tt(x1_time)
% -pi <= phase <= pi
phase_1 = phase_1- 6*pi
w2 = 2*pi/T
%shift 계산과정 w2*tt(x2_time)+phase_2 = 0
phase_2 = -w2*tt(x2_time) 
% -pi <= phase <= pi
phase_2 = phase_2 -2 *pi 


figure;
subplot(2,1,1);
plot(x1)
title('SEUNGWOO LEE , x1');
ylabel("Amplitude");
grid on
s1 = sprintf("Amplitude1: %f\nPhase1 : %f\n",amplitude1,phase_1);
dim = [.6 .7 .1 .1];
annotation('textbox',dim,'String',s1,'FitBoxToText','on');
hold on


subplot(2,1,2);
plot(x2)
title('SEUNGWOO LEE , x2');
ylabel("Amplitude");
grid on
s2 = sprintf("Amplitude2: %f\nPhase2 : %f\n",amplitude2,phase_2);
dim = [.6 .3 .1 .1];
annotation('textbox',dim,'String',s2,'FitBoxToText','on');

%%
%3.1-(b)
[x3_value,x3_time] = max(x3);

amplitude3 = x3_value %x3최댓값
w3 = 2*pi/T
%shift 계산과정 w3*tt(x3_time)+phase_3 = 0
phase_3 = -w3*tt(x3_time) 
% -pi <= phase <= pi
phase_3 = phase_3 + 4*pi

figure;
plot(x3)
title('SEUNGWOO LEE , x3');
ylabel("Amplitude");
grid on
s1 = sprintf("Amplitude3: %f\nPhase3 : %f\n",amplitude3,phase_3);
dim = [.6 .3 .1 .1];
annotation('textbox',dim,'String',s1,'FitBoxToText','on');



%%
%3-1-(c)
X1 = A1*(cos(phase_1) + 1j*sin(phase_1));
X2 = A2*(cos(phase_2) + 1j*sin(phase_2));
X3 = X1 + X2
abs_X3=abs(X3)
angle_X3=angle(X3)
X3 =abs_X3*exp(j*angle_X3)
%verify that my previous calculations of A3 and A3 are correct.


%%
%3-2
x1_t = A1*real(exp(j*2*pi*4000*(tt-tm1)));
figure();
plot(tt,x1_t);
title('Complex Amplitude');
ylabel("Amplitude");
grid on

