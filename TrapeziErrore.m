function e = TrapeziErrore(fd2,a,b)
% Input: 
%        df2    derivata seconda della funzione.  
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.
% Output: 
%        e      errore di quadratura.

% Grado di precisione (numero di intervalli)
n = 1;

% Ampiezza intervallo punti utilizzati
h = (b-a)/n;

% 10 punti equispaziati nell'intervallo [a,b]
x_e = linspace(a,b,100);

% Prendo il massimo valore dell'errore calcolato nell'intervallo [a,b].
e = -1/12 * norm(fd2(x_e),inf)* h^3;
return