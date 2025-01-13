% generowanie liczb o rozkładzie wykładniczym 
% R[0,1) --> Dowolny rozklad o zadanej dystrybuancie
% F(x) = 1-exp(-lamb*x) = r 
x = 0 : 0.01 : 3;
lamb = 2; F = 1-exp(-lamb*x);
plot( x, F ); xlabel('x'); ylabel('r'); title('F(x)'); grid;  
N = 10000;
lamb = 2;
r = rand(1,N);
x = - (1/lamb)*log(1 - r);
figure;

% Wykres punktowy rozkładu równomiernego r
subplot(221); 
plot(r, 'b.');
title('Punktowy rozkładu równomiernego');
xlabel('Indeks losowy');
ylabel('Wartość r');

% Histogram rozkładu równomiernego r
subplot(222); 
hist(r, 20);
title('Histogram równomiernego');
xlabel('Wartości r');
ylabel('Częstotliwość');

% Wykres punktowy rozkładu wykładniczego x
subplot(223); 
plot(x, 'b.');
title('Punkty rozkładu wykładniczego');
xlabel('Indeks losowy');
ylabel('Wartość x');

% Histogram rozkładu wykładniczego x
subplot(224); 
hist(x, 20);
title('Histogram wykładniczego');
xlabel('Wartości x');
ylabel('Częstotliwość');

pause;