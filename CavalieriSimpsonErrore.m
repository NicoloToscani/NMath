function e = CavalieriSimpsonErrore(fd4,a,b)
% Input: 
%        fd4    derivata quarta della funzione.  
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.
% Output: 
%        e      errore di quadratura.

% Grado di precisione (numero di intervalli)
n = 2;

% Ampiezza intervallo punti utilizzati
h = (b-a)/n;

% 10 punti equispaziati nell'intervallo [a,b]
x_e = linspace(a,b,100);

% Prendo il massimo valore dell'errore calcolato nell'intervallo [a,b].
e = -1/90 * norm(fd4(x_e),inf)* h^5;
return