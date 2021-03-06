[signal, Fs] = audioread('fivewo.wav');

figure;
signal_fft = fftshift(abs(fft(signal,2^nextpow2(length(signal)))));
f = linspace(-Fs/2, Fs/2, length(signal_fft));
plot(f, signal_fft);
title('FFT of original signal');

figure;
plot(signal);
title('Original Signal');

noise = rand(1, length(signal));

%figure;
%out1 = my_butter_filter(90, 576, Fs, signal);
%signal_fft = fftshift(abs(fft(out1,2^nextpow2(length(out1)))));
%f = linspace(-Fs/2, Fs/2, length(signal_fft));
%plot(f, signal_fft);
%title('FFT of bandpass signal');

for i = 500:500
    interval = (log(5760)-log(90))/i;
    env_noise = zeros(1, length(signal));
    for j = 1:i
        F_low = exp(log(90)+interval*(j-1));
        F_high = exp(log(90)+interval*j);
        bandpass_signal = my_butter_filter(F_low, F_high, Fs, signal);
        [yup, ylow] = envelope(bandpass_signal, 25, 'analytic'); 
        bandpass_noise = my_butter_filter(F_low, F_high, Fs, noise);
        env_noise = env_noise + my_vector_elementwise_multiply(yup, bandpass_noise);
    end
    figure;
    plot(env_noise);
    title("Number of Filter banks : " + i);
    
end

audiowrite("Env_Noise.wav",env_noise',Fs);
        