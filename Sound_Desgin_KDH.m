%1. 차량 방향 지시등 소리를 녹음한 뒤 , Matlab으로 불러들이고
%2. 소리르 조작하여 자신만의 방향지시등 소리를 만들 것
%3. 이것을  .wav 파일로 제작하고 matlab 코드 및 구현과정을 정리한 ppt와 함께 제출할 것 
% load handel.mat
% audiowrite('handel.wav',y,Fs)
% clear y Fs
% 
% [y,Fs] = audioread('car_sound.wav');
% sound(y,Fs)
% 
% t = 0:seconds(1/Fs):seconds(info.Duration);
% t = t(1:end-1);
% plot(t,y)
% xlabel('Time')
% ylabel('Audio Signal')



% [sound_array, fs] = audioread('DD.m4a'); 
% a = sound_array(fs*0.7:fs*0.85)*25;     %원래 소리
% sound_array=[a*0;a;]+ 0.0000001;
% soundsc(sound_array,fs);
% 
% 
% sound_array=[a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0;a;a*0]+ 0.0000001;
% soundsc(sound_array,fs);

% [y, fs] = audioread('car_sound.m4a'); 
% soundsc(y,fs);

 [sound_array, fs] = audioread('DD.m4a'); 
y = sound_array(fs*0.7:fs*0.85)*25;     %원래 소리
length(y)
whos y;
whos Fs;
TotalTime = length(y)./Fs;
t = 0:TotalTime/(length(y)):TotalTime-TotalTime/length(y);
figure(1);plot(t,y)

Mono = mean(y,2);
figure(2)
subplot(2,1,1)
%plot(t, y(:,1))
grid
subplot(2,1,2)
%plot(t, y(:,2))
grid
%soundsc(out.yout,Fs);
[sound_array, fs] = audioread('DD.m4a'); 
[sound_array1, fs] = audioread('vjdvjd.wav'); 
y = sound_array(fs*0.7:fs*0.85)*25;
soundsc(y,fs);