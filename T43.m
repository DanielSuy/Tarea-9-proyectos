n=-50:50;
x=cos(pi*0.1*n);
y=cos(pi*0.9*n);
z=cos(pi*2.1*n);

% Subgráfica 1
subplot(3,1,1);
plot(n,x);
title('x[n]=cos(0.1\pin)');
grid;

% Subgráfica 2
subplot(3,1,2);
plot(n,y);
title('x[n]=cos(0.9\pin)');
grid;

% Subgráfica 3
subplot(3,1,3);
plot(n,z);
title('x[n]=cos(2.1\pin)');
grid;

