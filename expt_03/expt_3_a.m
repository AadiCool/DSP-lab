num = input("Enter a number ", 's');
num = strtrim(num);

omega1 = 0; omega2 = 0;

if(num=='1' || num=='2' || num=='3' || num=='A')
    omega1=697;
end
if(num=='4' || num=='5' || num=='6' || num=='B')
    omega1=770;
end
if(num=='7' || num=='8' || num=='9' || num=='C')
    omega1=852;
end
if(num=='*' || num=='0' || num=='#' || num=='D')
    omega1=941;
end

if(num=='1' || num=='4' || num=='7' || num=='*')
    omega2=1209;
end
if(num=='2' || num=='5' || num=='8' || num=='0')
    omega2=1336;
end
if(num=='3' || num=='6' || num=='9' || num=='#')
    omega2=1477;
end
if(num=='A' || num=='B' || num=='C' || num=='D')
    omega2=1633;
end

t = linspace(0,1,8192);
signal=cos(2*pi*omega1*t)+cos(2*pi*omega2*t);

signal_fft = fftshift(abs(fft(signal,1024)));
f = linspace(-1500, 1500, length(signal_fft));
plot(f, signal_fft);

row_freq = [697 770 852 941];
col_freq = [1209 1336 1477 1633];

i_row = 0; i_col = 0;
x_row_max = 0;
x_col_max = 0;

% t = 0 : 1000;
for i = 1:4
    h_row = cos(2*pi*row_freq(i)*t);
    h_col = cos(2*pi*col_freq(i)*t);
    
    x_row = rms(conv(h_row, signal));
    x_col = rms(conv(h_col, signal));
    
    if(x_row > x_row_max)
        x_row_max = x_row;
        i_row = i;
    end
    
    if(x_col > x_col_max)
        x_col_max = x_col;
        i_col = i;
    end
end

disp(['i_row = ', num2str(i_row), ' i_col = ', num2str(i_col)]);



