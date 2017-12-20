function q = Trapezi(f,a,b)
% Input: 
%        f      funzione da appossimare.
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.      
% Output: 
%        q      valore approssimato dell'integrale della funzione f.
% Appartiene alla famiglia delle formule di quadratura di Newton-Cotes
% chiuse.
% Calcola un'approssimazione dell'integrale della funzione f
% sull'intervallo [a,b] utilizzando la formula del trapezio.
% Viene sostituita f con il suo polinomio interpolatore di grado 1 
% costruito sui nodi x0 e x1 (n+1 nodi).
% Su questo intervallo viene integrato al posto di f il suo polinomio
% interpolatore.

% Costante di integrazione (alpha(1) + alpha(2) = n )
alpha = [1/2 1/2];

% Grado di precisione (numero di intervalli)
n = 1;

% Ampiezza intervallo punti utilizzati
h = (b-a)/n;

% Intervallo su cui costruire la quadratura. Costruisco i valori su cui
% andare a valutare la funzione la funzione f(x) che mi rappresenta i punti
% in cui passerà il mio polinomio interpolatore di grado 1.
% x contiene due punti, il primo in a e il secondo in b.
x = [a:h:b];

% Valuto la funzione nei punti di interpolazione, agli estremi a e b.
% y contiene i valori f(a) e f(b).
y = f(x);

% Calcolo integrale sul polinomio interpolatore.
% Questo sarà un approssimazione dell'integrale della funzione f data.
q = h * ((alpha(1) * y(1)) + alpha(2) * y(2));

return



