N = 513;
k = (N-1)/2;
x = linspace(-k,k,N);

omega = pi/2;

hd = sin(omega*(x))./(pi*(x));
hd(k+1) = omega/pi;

rectwind = 0:N-1;
rectwind = rectwind*0+1;
trangwind = 2-2*(0:N-1)/(N-1);
x = 0:N-1;
hanningwind1 = 0.5 -0.5*cos(2*pi*x/(N-1));
hanningwind2 = 0.54 -0.46*cos(2*pi*x/(N-1));
blackmanwind = 0.42 - 0.5*cos(2*pi*x/(N-1)) + 0.08*cos(4*pi*x/(N-1));

hn_rect = hd.*rectwind;
hn_triang = hd.*trangwind;
hn_hanning1 = hd.*hanningwind1;
hn_hanning2 = hd.*hanningwind2;
hn_blackmanwind = hd.*blackmanwind;

n = x;
w = -pi:.001:pi; 

% rectangular window
figure;
subplot(3,1,1);
plot(n,hd);
xlim([0 N]);
title("LPF: hd[n]");
subplot(3,1,2);
plot(n, rectwind);
xlim([0 N]);
title("rectangular window");
hf1 = freqz(hn_rect,1,w);
hf_abs1 = 20*log10(abs(hf1));
subplot(3,1,3);
plot(w/pi, hf_abs1);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

% triangular window
figure;
subplot(3,1,1);
plot(n,hd);
xlim([0 N]);
title("LPF: hd[n]");
subplot(3,1,2);
plot(n, trangwind);
xlim([0 N]);
title("triangular window");
hf1 = freqz(hn_triang,1,w);
hf_abs1 = 20*log10(abs(hf1));
subplot(3,1,3);
plot(w/pi,hf_abs1);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

% hanning1 window
figure;
subplot(3,1,1);
plot(n,hd);
xlim([0 N]);
title("LPF: hd[n]");
subplot(3,1,2);
plot(n, hanningwind1);
xlim([0 N]);
title("hanning window");
hf1 = freqz(hn_hanning1,1,w);
hf_abs1 = 20*log10(abs(hf1));
subplot(3,1,3);
plot(w/pi,hf_abs1);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

% hanning2 window
figure;
subplot(3,1,1);
plot(n,hd);
xlim([0 N]);
title("LPF: hd[n]");
subplot(3,1,2);
plot(n, hanningwind2);
xlim([0 N]);
title("hamming window");
hf1 = freqz(hn_hanning2,1,w);
hf_abs1 = 20*log10(abs(hf1));
subplot(3,1,3);
plot(w/pi,hf_abs1);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

% blackman window
figure;
subplot(3,1,1);
plot(n,hd);
xlim([0 N]);
title("LPF: hd[n]");
subplot(3,1,2);
plot(n, blackmanwind);
xlim([0 N]);
title("blackman window");
hf1 = freqz(hn_blackmanwind,1,w);
hf_abs1 = 20*log10(abs(hf1));
subplot(3,1,3);
plot(w/pi,hf_abs1);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')


