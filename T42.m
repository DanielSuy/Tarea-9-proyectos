n = -1000:1000;
x = exp(1j * 2 * pi * 0.01 * n);
y = exp(1j * 2 * pi * 2.01 * n);

% Crear dos subgráficas en una figura
figure;

% Subgráfica 1
subplot(2, 1, 1);
plot(n, real(x));
title('Parte Real de x[n]');
xlabel('n');
ylabel('Amplitud');
grid on;

% Subgráfica 2
subplot(2, 1, 2);
plot(n, real(y), 'r');
title('Parte Real de y[n]');
xlabel('n');
ylabel('Amplitud');
grid on;
