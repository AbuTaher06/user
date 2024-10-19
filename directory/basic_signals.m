% sine wave
t=0:0.01:1;
a=2; 
b=a*sin(2*pi*2*t); 
subplot(3,3,1); 
stem(t,b); 
xlabel('time'); 
ylabel('Amplitude'); 
title('sinewave');

% Cosine wave
t=0:0.01:1;
a=2; 
b=a*cos(2*pi*2*t); 
subplot(3,3,2); 
stem(t,b); 
xlabel('time'); 
ylabel('Amplitude'); 
title ('Coswave');

% Square wave
t=0:0.01:1;
a=2; 
b=a*square(2*pi*2*t); 
subplot(3,3,3); 
stem(t,b); 
xlabel('time'); 
ylabel('Amplitude'); 
title('square wave');

% Exponential waveform
t=0:0.01:1;
a=2;
b=a*exp(2*pi*2*t); 
subplot(3,3,4);
stem(t,b);
xlabel('time'); 
ylabel('Amplitude');
title ('exponential wave');

%sawtooth
t=0:0.01:1;
a=2; 
b=a*sawtooth(2*pi*2*t);
subplot(3,3,5); 
stem(t,b); 
xlabel('time'); 
ylabel('Amplitude'); 
title ('sawtooth wave');

% unit step signal
n=-5:5;
a = [zeros(1,5),ones(1,6)]; 
subplot(3,3,6);
stem(n,a);
xlabel ('time');
ylabel ('amplitude'); 
title('Unit step');

% unit impulse
n=-5:5;
a = [zeros(1,5),ones(1,1),zeros(1,5)]; 
subplot(3,3,7);
stem(n,a);
xlabel ('time');
ylabel ('amplitude');
title('Unit impulse');