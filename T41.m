t=-0.04:0.001:0.04;
x=20*exp(j*(80*pi*t-0.4*pi));

%Grafica 3D
figure;
plot3(t, real(x), imag(x)); grid on;
title('20*e^{j*(80\pit-0.4\pi)}')
xlabel('Tiempo, s'); ylabel('Real'); zlabel('Imag')

%Grafica 2D
figure;
plot(t, real(x), 'b'); hold on
plot(t, imag(x), 'r'); grid
title('Rojo - componente Imaginario, Azul - componente Real de la exponencial')
xlabel('Tiempo'); ylabel('Amplitud')



