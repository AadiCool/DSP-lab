function [out] = my_butter_filter(Fc1, Fc2, Fs, y)
[b, a] = butter(3, Fc2/(Fs/2));
out1 = filter(b, a , y);
[b, a] = butter(3, Fc1/(Fs/2), 'high');
out = filter(b, a, out1);
end

