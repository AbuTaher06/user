clc;
clear all;
close all;

x=input('Enter the sequence : ');
N=length(x);
xk=fft(x);

n=0:N-1;
subplot (2,2,1);
stem(n,x);
xlabel('n---->');
ylabel('Amplitude');
title('Input sequence');

subplot (2,2,2);
stem(n,abs(xk));
xlabel('n---->');
ylabel('Magnitude');
title('Magnitude response');

subplot (2,2,3);
stem(n,angle(xk));
xlabel('n---->');
ylabel('Phase');
title('Phase responce');