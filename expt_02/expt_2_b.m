

t = 0: 1 : 1000;
x = 2*cos(0.1*pi*t) + 3*cos(0.8*pi*t);
noise = 2*randn(1,length(x));
x_noise = x + noise;

figure;
subplot(2,2,1);
plot(t,x);
title('original signal');

x1 = fftshift(abs(fft(x,1024)));
f = -1/2:1/1023:1/2;
subplot(2,2,2);
plot(f,x1);
title('FFT of original signal');

subplot(2,2,3);
plot(t,x_noise);
title('original signal with noise');

x1_noise = fftshift(abs(fft(x_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(2,2,4);
plot(f,x1_noise);
title('FFT of original signal with noise');


% plotting outputs
figure;
N = 65;
k = (N-1)/2;
p = linspace(-k,k,N);
omega = pi*0.3;
hd = sin(omega*(p))./(pi*(p));
hd(k+1) = omega/pi;

rectwind = 0:N-1;
rectwind = rectwind*0+1;
trangwind = 2-2*(0:N-1)/(N-1);
p = 0:N-1;
hanningwind1 = 0.5 -0.5*cos(2*pi*p/(N-1));
hanningwind2 = 0.54 -0.46*cos(2*pi*p/(N-1));
blackmanwind = 0.42 - 0.5*cos(2*pi*p/(N-1)) + 0.08*cos(4*pi*p/(N-1));

hn_rect = hd.*rectwind;
hn_triang = hd.*trangwind;
hn_hanning1 = hd.*hanningwind1;
hn_hanning2 = hd.*hanningwind2;
hn_blackmanwind = hd.*blackmanwind;


% rectangular
y = filtfilt(hn_rect,1,x);
y1 = fftshift(abs(fft(y,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,1);
plot(f,y1);
title('filtered signal rectangular');

y_noise = filtfilt(hn_rect,1,x_noise);
y1_noise = fftshift(abs(fft(y_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,2);
plot(f,y1_noise);
title('filtered noisy signal rectangular');
disp(['SNR rectangular is equal to ',num2str(snr(y1_noise, y1_noise-y1)),'.']);



% triangular
y = filtfilt(hn_triang,1,x);
y1 = fftshift(abs(fft(y,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,3);
plot(f,y1);
title('filtered signal triangular');

y_noise = filtfilt(hn_triang,1,x_noise);
y1_noise = fftshift(abs(fft(y_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,4);
plot(f,y1_noise);
title('filtered noisy signal triangular');
disp(['SNR triangular is equal to ',num2str(snr(y1_noise, y1_noise-y1)),'.']);


% hanning
y = filtfilt(hn_hanning1,1,x);
y1 = fftshift(abs(fft(y,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,5);
plot(f,y1);
title('filtered signal hanning');

y_noise = filtfilt(hn_hanning1,1,x_noise);
y1_noise = fftshift(abs(fft(y_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,6);
plot(f,y1_noise);
title('filtered noisy signal hanning');
disp(['SNR hanning is equal to ',num2str(snr(y1_noise, y1_noise-y1)),'.']);


% hamming
y = filtfilt(hn_hanning2,1,x);
y1 = fftshift(abs(fft(y,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,7);
plot(f,y1);
title('filtered signal hamming');

y_noise = filtfilt(hn_hanning2,1,x_noise);
y1_noise = fftshift(abs(fft(y_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,8);
plot(f,y1_noise);
title('filtered noisy signal hamming');
disp(['SNR hamming is equal to ',num2str(snr(y1_noise, y1_noise-y1)),'.']);


% blackman
y = filtfilt(hn_hanning2,1,x);
y1 = fftshift(abs(fft(y,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,9);
plot(f,y1);
title('filtered signal blackman');

y_noise = filtfilt(hn_hanning2,1,x_noise);
y1_noise = fftshift(abs(fft(y_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(5,2,10);
plot(f,y1_noise);
title('filtered noisy signal blackman');
disp(['SNR blackman is equal to ',num2str(snr(y1_noise, y1_noise-y1)),'.']);

