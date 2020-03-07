sigma = 1;
noise = sigma.*normrnd(0,1,1,N);
x = filter(1, [1, -0.9, 0.81, -0.729], noise).';
f = fftshift(fft(x, 1024));
f_hat=linspace(-1,1,1024)*1/2;