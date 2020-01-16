Fs=20e3;

t=0:1/Fs:1;
Y = square(2*pi*1e3*t);
Z = abs(fftshift((fft(Y,256)))/256);
df = Fs/length(Z);
freqvec = -Fs/2:df:Fs/2-df;
plot(freqvec,abs(fftshift((fft(Y,256)))/256));

xlabel('Frequency')
ylabel('Amplitude')
title('Fs=20KHz; N=256')