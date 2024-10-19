clc;
x1 = input('Enter the first sequence: ');
subplot(3, 1, 1);
stem(x1);
ylabel('Amplitude');
title('Plot of the first sequence');

x2 = input('Enter the second sequence: ');
subplot(3, 1, 2);
stem(x2);
ylabel('Amplitude');
title('Plot of the second sequence');

f = conv(x1, x2);
disp("Convolution: ");
disp(f);

subplot(3, 1, 3);
stem(f);
xlabel('Time index n');
ylabel('Amplitude f');
title('Linear convolution of sequence');