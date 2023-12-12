n=-3:7;
x=0.55.^(n+3);
h=[1,1,1,1,1,1,1,1,1,1,1]; %Se define una secuencia de impulso discreto
y=conv(x,h);

subplot(3,1,1);
stem(x)
title('Señal Original');

subplot(3,1,2);
stem(h) %usa stem para secuencias discretas
title('Respuestta al impulso/Segunda Señal');

subplot(3,1,3);
stem(y)
title('Convolucion Resultante');

