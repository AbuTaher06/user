clc;
clear all;
close all;

x = input('Enter sequence: ');
subplot(2,1,1);
stem(x);
ylabel('Amplitude');
title('Input Sequence');

subplot(2,1,2);
y = xcorr(x,x);
stem(y);
ylabel('Amplitude');
title('Auto correlation of the Sequence');

disp("Auto correlation: ");
disp(y);
