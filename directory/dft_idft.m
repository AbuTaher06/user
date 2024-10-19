clc;
close all;
clear all;

xn=input('Enter the sequence x(n): '); 
ln=length(xn); 
xk=zeros(1,ln); 

for k=0:ln-1
    for n=0:ln-1
        xk(k+1)=xk(k+1)+(xn(n+1)*exp(-(1i)*2*pi*k*n/ln));
    end
end

t=0:ln-1;
subplot(2, 2, 1);
stem(t,xn);
ylabel ('Amplitude');
xlabel ('Time Index');
title('Input Sequence');

magnitude=abs(xk); 
t=0:ln-1;
subplot(2, 2, 2);
stem(t,magnitude);
ylabel ('Amplitude');
xlabel ('K');
title('Magnitude Response');

phase=angle(xk); 
t=0:ln-1;
subplot(2, 2, 3);
stem(t,phase);
ylabel ('Phase');
xlabel ('K');
title ('Phase Response');

ixk=zeros(1,ln); 
for n=0:ln-1
    for k=0:ln-1
        ixk(n+1)=ixk(n+1)+real((xk(k+1)*exp((1i)*2*pi*k*n/ln)));    
    end
end

ixk=ixk./ln;

t=0:ln-1;
subplot(2, 2, 4);
stem(t,ixk);
ylabel ('Amplitude');
xlabel ('Time Index');
title ('IDFT sequence');
