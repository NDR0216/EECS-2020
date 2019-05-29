clc; clear; close all;

t = -20: 0.001: 20;
f = -2: 0.001: 2;

b1 = 0.1;
b2 = 1;
b3 = 10;
ht1 = exp(-b1*t).*heaviside(t);
Hf1 = 1./(b1+j*2*pi*f);
ht2 = exp(-b2*t).*heaviside(t);
Hf2 = 1./(b2+j*2*pi*f);
ht3 = exp(-b3*t).*heaviside(t);
Hf3 = 1./(b3+j*2*pi*f);

figure(1)
plot(t, ht1, 'r')
hold on
plot(t, ht2, 'g')
hold on
plot(t, ht3, 'b')
xlabel('t')
ylabel('h(t)')
title('h(t)')
legend('b = 0.1', 'b = 1', 'b = 10')

figure(2)
subplot(2, 1, 1)
plot(f, abs(Hf1), 'r')
hold on
plot(f, abs(Hf2), 'g')
hold on
plot(f, abs(Hf3), 'b')
xlabel('f')
ylabel('|H(f)|')
title('|H(f)|')
legend('b = 0.1', 'b = 1', 'b = 10')
subplot(2, 1, 2)
plot(f, phase(Hf1), 'r')
hold on
plot(f, phase(Hf2), 'g')
hold on
plot(f, phase(Hf3), 'b')
xlabel('f')
ylabel('phase(H(f))')
title('phase(H(f))')
legend('b = 0.1', 'b = 1', 'b = 10')

xt = 0;
for n = 1: 2: 10000
    xt = xt + 4/pi/n*sin(n*t);
end

yt1 = 0;
for n = 1: 2: 10000
    yt1 = yt1 + 4/pi*abs(1/(b1+j*n))/n*sin(n*t+phase(1/(b1+j*n)));
end

yt2 = 0;
for n = 1: 2: 10000
    yt2 = yt2 + 4/pi*abs(1/(b2+j*n))/n*sin(n*t+phase(1/(b2+j*n)));
end

yt3 = 0;
for n = 1: 2: 10000
    yt3 = yt3 + 4/pi*abs(1/(b3+j*n))/n*sin(n*t+phase(1/(b3+j*n)));
end

figure(3)
plot(t, xt)
xlabel('t')
ylabel('x(t)')
title('x(t)')
figure(4)
plot(t, yt1, 'r')
hold on
plot(t, yt2, 'g')
hold on
plot(t, yt3, 'b')
xlabel('t')
ylabel('y(t)')
title('y(t)')
legend('b = 0.1', 'b = 1', 'b = 10')