% Odbiornik cyfrowy radia FM mono
% Octave: >>pkg load signal[ENTER} 
  clear all; close all;
  

% Read recorded IQ signal - choose one

% IMPORTANT !
% Load dataIQ.zip file from the page:
% http://kt.agh.edu.pl/~tzielin/books/DSPforTelecomm/
% and extract SDRSharp_FMRadio_xxxxxxkHz_IQ.wav files from the ZIP

  FileName = 'SDRuno_20200907_184033Z_88110kHz.wav';  T=1;  demod=1; % FM Radio signal

    inf = audioinfo(FileName) % odbiór inforamcji
    pause 
    fs = inf.SampleRate; % liczba probek na sekunde
    [x,fs] = audioread(FileName,[1,T*fs]); % wczytanie zadanego okresu czasu
    Nx = length(x); % dlugosc sygnalu
% odtwarzamy zespolony wygnał
[dummy,M] = size(x); % dummy - długość,  M - liczba komumn
if(M==2) % sprawdzamy czy jest częśc im, jeśli nie dodajemy ją
    x = x(:,1) - 1j*x(:,2);
else 
    x = x(1:Nx,1) + 1j*zeros(Nx,1);
end
% Zdemoduluj i odtworz jedna, wybrana stacje radia FM - tylko mono
bwSERV=200e+3; bwAUDIO=25e+3; % Parametry: czestotliwosci w Hz
% bwSERV - szerokość pasma FM (200kHz)
% bwAUDIO - szerokość pasma dla sygnału audio po demodulacji FM.
D1 = round(fs/bwSERV); % zaokrągla do l. całkowitych, nie może być ułamkiem
% zmniejszenie próbkowanania aby dopasować sygnał do szerokości pasma stacji FM
% redukuje szumy spoza pasma FM
D2 = round(bwSERV/bwAUDIO);
%ponownie zmniejsza próbkowanie aby otrzymać sygnał audio o szer 25kHz
f0 = 0e+6; x = x .* exp(-j*2*pi*f0/fs*(0:Nx-1)'); 
% częstotliwość nośna oraz przesunięcie sygnału na linię nośną

x = resample(x,1,D1); % zmniejszamy prókowanie zgodnie z D1 
%demod FM
x = real(x(2:end)).*imag(x(1:end-1))-real(x(1:end-1)).*imag(x(2:end));
% różnica fazy między kolejnymi próbkami sygnału
% przybliżona rożnica faz   
% różnica faz odpowiada zmianie częstotliwości chwilowej jest proporcjonalna do sygnału modulującego 
%demodulacja FM - obliczenie chwilowej różnicy faz która niesie informacje

x = resample(x,1,D2); % zmniejszenie próbkowania do szer syg audio
soundsc(x,bwAUDIO); % odtworzenie