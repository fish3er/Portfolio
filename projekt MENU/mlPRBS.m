N = 5;  % Change N as needed: 2,3,4,5,9,12 (or other values)
L = 2*(2^N);
buf = ones(1, N);

for n = 1:L
    if(N==1)
        y(n) = xor(buf(1), buf(2));
    elseif(N==2)
        y(n) = xor(buf(1), buf(2)); % Octal 7, feedback: 111
    elseif(N==3)
        y(n) = xor(buf(2), buf(3)); % Octal 13, feedback: 1011
    elseif(N==4)
        y(n) = xor(buf(3), buf(4)); % Octal 23, feedback: 10011
    elseif(N==5)
        y(n) = xor(buf(3), buf(5)); % Octal 45, feedback: 100101
    elseif(N==6)
        y(n) = xor(buf(1), xor(buf(6), buf(7))); % Octal 103, feedback: 10000011
    elseif(N==7)
        y(n) = xor(buf(1), xor(buf(2), xor(buf(5), buf(7)))); % Octal 211
    elseif(N==8)
        y(n) = xor(buf(1), xor(buf(3), xor(buf(5), buf(8)))); % Octal 435
    elseif(N==9)
        y(n) = xor(buf(5), buf(9)); % Octal 1021, feedback: 1000010001
    elseif(N==10)
        y(n) = xor(buf(1), xor(buf(3), xor(buf(7), buf(10)))); % Octal 2011
    elseif(N==11)
        y(n) = xor(buf(1), xor(buf(5), xor(buf(8), xor(buf(10), buf(11))))); % Octal 4005
    elseif(N==12)
        y(n) = xor(buf(6), xor(buf(8), xor(buf(11), buf(12)))); % Octal 10123
    end
    
    buf = [y(n), buf(1:N-1)];
end

figure;
subplot(211); 
stem(y, 'bo'); 
title('y(n)');
subplot(212); 
stem(-L+1:L-1, xcorr(y-mean(y))); 
grid; 
title('Ryy(k)'); % autokorelacja
% -miara podobieństwa sygnału do samego siebie
% przy różnych opóźnieniach 
axis tight;
