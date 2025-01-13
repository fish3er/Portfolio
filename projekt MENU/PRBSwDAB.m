 %Generowanie sekwencji PRBS w radiu DAB. 
N = 9; % elementy bufora
n_bits=100; % liczba generowanych bitów
%inicjalizcja rejestru opresównego jedynkami
rejestr_przesuwny = ones(1,N);
%sekwencja wyjściowa po PRBS
%prbs= zeros(1, n_bits)
%prbs = [1 0 1 0 1 1 0 1 0]
prbs = randi([0,1], 1, N)

for i=1:n_bits
    %sprzężenie zwrotne 
    odopowiedx_ukladu= xor(rejestr_przesuwny(5),rejestr_przesuwny(9));
    %przesuniecie w prawko
    rejestr_przesuwny(2:N)=rejestr_przesuwny(1:N-1);
    %wstawinie bitu sprzężenia zwrotnego
    rejestr_przesuwny(1) = odopowiedx_ukladu;
    prbs(i) = odopowiedx_ukladu;
end

% Opcjonalne: Wykres sekwencji PRBS
figure;
stem(prbs, 'filled');
title('Wizualizacja RPBS w radiu DAB');
xlabel('Próbka');
ylabel('Wartość');
grid on;