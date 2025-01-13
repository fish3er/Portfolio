% Przekształcenie Boxa-Millera

N = 10000;
r1 = rand(1,N);
r2 = rand(1,N);
% zaminana rozkąłdu równomiernego na n
n1 = sqrt(-2*log(r1)) .* cos(2*pi*r2);
n2 = sqrt(-2*log(r1)) .* sin(2*pi*r2);

% Parametry nowego rozkładu na normalny
mu = 5;  % Nowa średnia
sigma = 2;  % Nowe odchylenie standardowe

% Transformacja na nowy rozkład
n1_prime = sigma * n1 + mu;
n2_prime = sigma * n2 + mu;

% Rysowanie histogramów dla nowych danych
figure;
subplot(211); hist(n1_prime, 20); title('n1''');
subplot(212); hist(n2_prime, 20); title('n2''');
