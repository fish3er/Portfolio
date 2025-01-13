% obliczanenie wartości liczby pi metodą monte carlo

clear all; close all;
format long;
N = 10000; % liczba strzałów
Nk = 0; % liczba trafien w kolo


for i = 1 : N
    x = rand(1,1)*2.0 - 1.0; % # kwadrat o boku 2
    y = rand(1,1)*2.0 - 1.0; % #
    if( sqrt( x*x + y*y ) <= 1.0) % kolo o promieniu 1
        Nk = Nk + 1; % zwieksz liczbe trafien o 1
    end
end

mypi = 4.0 * Nk / N, % obliczone pi
