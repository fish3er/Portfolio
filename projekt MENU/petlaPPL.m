% Petla cyfrowa PLL - Phase-Locked Loop
clear all; close all;

% PLL parameters
fs = 250000;                                            % czestotliwosc probkowania
fc = 19000; phc = pi/4;                                 % czestotliwosc nosnej
fPLLstart = fc-25; dfreq = 100;                         % poczatkowa czestotl. petli, szerokosc pracy petli
ipll = 1;                                               % 1=real PLL, 2=complex PLL
% Generacja sygnalow
N = 50000; n=0:N-1; A = 0.1;                            % licza probkek, indeksy probek
dt=1/fs; t=dt*n;                                        % okres probkowania, chwile probkowania
%if(ipll==1)
    %s = A * cos(2*pi*fc*t + phc);
%end           % sygnal WE rzeczywisty
%if(ipll==2)
    %s = A * exp(1j*(2*pi*fc*t + phc));
%end       % sygnal WE zespolony

if ipll == 1
    s = A * sign(cos(2*pi*fc*t + phc));                 % Sygnał WE kwadratowy (rzeczywisty)
elseif ipll == 2
    s = A * sign(exp(1j*(2*pi*fc*t + phc)));            % Sygnał WE zespolony (rzeczywisty część)
end

% Obliczenie wartosci wspolczynnikow petli
damp = sqrt(2)/2;                                       % standardowe tlumienie
omeg = (dfreq/fs) / (damp+1/(4*damp));                  % zmienna
mi1 = (4*damp*omeg) / (1 + 2*damp*omeg + omeg*omeg);    % stala adaptacji #1
mi2 = (4*omeg*omeg) / (1 + 2*damp*omeg + omeg*omeg);    % stala adaptacji #2
% PLL
omega = zeros(1,N+1); omega(1) = 2*pi*fPLLstart / fs;
phi = zeros(1,N+1);
smax = max(abs(s));
for n = 1 : N % PETLA ADAPTACJI
    if( ipll==1 )
        delta = -2*sin(phi(n)) * s(n)/smax;
    else 
        delta = -2*imag( exp(j*phi(n)) * conj(s(n) )/smax );
    end
phi(n+1) = phi(n) + omega(n) + mi1*delta; % faza generowana w n tej chwili
omega(n+1) = omega(n) + mi2*delta; % chwilowa częstotliwość generacji
end
%c = cos( phi(1:N) );                                  % odtworzona nosna
c = sign(cos(phi(1:N))); % dla syg kwadratowego
sr = real(s) / smax;                                    % czesc rzeczywista sygnalu wejsciowego
% /smax normalizcaja do amplitudy -1 1 
n = 1:100;                                              % dla czytelności wyświetlamy tylko część próbek
plot(n,sr(n),'r.-',n,c(n),'b.-'); title('Syganał wejściowy i odtworzona nośna na początku pętli'); grid; pause
n= 48000:1:48100;
figure; 
plot(n,sr(n),'b.-',n,c(n),'r.-'); title('Syganał wejściowy i odtworzona nośna'); grid; pause
figure; 
plot(1:N,sr-c,'r-'); title('Rożnica sygnałów'); grid; pause
figure; 
plot(phi); title('phi [rad]');grid; pause
figure; 
plot(omega*fs/(2*pi),'b-'); xlabel('n'); title('częstotliwość generowana przez PLL [Hz]'); grid; pause