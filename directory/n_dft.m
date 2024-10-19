clc;
close all;
clear all;

x = input('Enter the sequence: ');
n = input('Enter the value of N: ');
ndft = fft(x,n);

subplot(2,2,1);
stem(x);
xlabel("n--->");
ylabel("Amplitude");
title("Input Sequence");

m = abs(ndft);
N = 0:1:n-1;
subplot(2,2,2);
stem(N,m);
xlabel('Length');
ylabel('Amplitude of x(k)');
title('Magnitude of N-Point DFT');

p = angle(ndft);
subplot(2,2,3);
stem(N,p);
xlabel('Length');
ylabel('Phase of x(k)');
title('Phase of N-Point DFT');
