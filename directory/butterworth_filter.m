clc;
clear all;
close all;

fs=100;                  
f=5;                     
t=5;                     
n= 0: 1/fs :t;            
x=2*sin(2*pi*f*n);       
subplot(4,1,1);
plot(n,x);
title('Sinusoidal signal');

z=awgn(x,1);         
subplot(4,1,2);
plot(n,z);
title('Sinusoidal signal with noise added');

wc = 0.1;
o = 1;

%Low - pass Filter
[b,a]=butter(o,wc,'low');   
iir=filter(b,a,z);
subplot(4,1,3);
plot(n,iir);
title("Low-Pass Filtered Signnal");

%High - pass Filter
[b,a]=butter(o,wc,'high'); 
iir=filter(b,a,z);
subplot(4,1,4);
plot(n,iir);
title("High-Pass Filtered Signnal");
%fvtool(b,a);   
