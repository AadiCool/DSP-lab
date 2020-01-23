Fs = 5e3;
t = -1:1/Fs:1;

wave = 10*cos(2*pi*1e3*t) + 6*cos(2*pi*2e3*t) +2*cos(2*pi*4e3*t);
figure();

subplot(4,1,1);
%plot(wave)
Y=abs(fftshift(fft(wave',12)))/12;
df = Fs/length(Y);
freqvec = -Fs/2:df:Fs/2-df;
stem(freqvec,abs(fftshift(fft(wave',12)))/12);
xlabel('Angular frequency');
ylabel('Amplitude- 64 point DFT');

title(['Freq ',num2str(Fs/1e3),'KHz']);


subplot(4,1,2);
%plot(wave)
Y=abs(fftshift(fft(wave',64)))/64;
df = Fs/length(Y);
freqvec = -Fs/2:df:Fs/2-df;
stem(freqvec,abs(fftshift(fft(wave',64)))/64);
xlabel('Angular frequency');
ylabel('Amplitude- 64 point DFT');


subplot(4,1,3);
Y=abs(fftshift(fft(wave',128)))/128;
df = Fs/length(Y);
freqvec = -Fs/2:df:Fs/2-df;
stem(freqvec,abs(fftshift(fft(wave',128)))/128);

xlabel('Angular frequency');
ylabel('Amplitude- 128 point DFT');



subplot(4,1,4);

Y=abs(fftshift(fft(wave',256)))/256;
df = Fs/length(Y);
freqvec = -Fs/2:df:Fs/2-df;
stem(freqvec,abs(fftshift(fft(wave',256)))/256);

xlabel('Angular frequency');
ylabel('Amplitude- 256 point DFT');
