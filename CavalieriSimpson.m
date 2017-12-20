function q = CavalieriSimpson(f,a,b)
% Input: 
%        f      funzione da appossimare.  
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.      
% Output: 
%        q      valore approssimato dell'integrale della funzione f.
% Appartiene alla amiglia delle formule di quadratura di Newton-Cotes
% chiuse.
% Calcola un'approssimazione dell'integrale della funzione f
% sull'intervallo [a,b] utilizzando la formula di Cavalieri-Simpson.
% Viene sostituita f con il suo polinomio interpolatore di grado 2 
% costruito sui nodi x0 , x1 e x2.
% Su questo intervallo viene integrato al posto di f il suo polinomio
% interpolatore di 2 grado (parabola).
% Costante di integrazione (alpha(1) + alpha(2) + alpha(3) = n)
alpha = [1/3 4/3 1/3];

% Grado di precisione ( numero di intervalli )
n = 2;

% Ampiezza intervallo punti utilizzati
h = (b-a)/n;

% Intervallo su cui costruire la quadratura. Costruisco i valori su cui
% andare a valutare la funzione la funzione f(x) che mi rappresenta i punti
% in cui passerà il mio polinomio interpolatore di grado 2.
% x contiene 3 punti, il primo in a e il secondo in (a+b)/2 ed il terzo in
% b
x = [a:h:b];

% Valuto la funzione nei punti di interpolazione, agli estremi a e b e nel
% punto centrale.
% y contiene i valori f(a), f((a+b)/2) e f(b).
y = f(x);

% Calcolo integrale sul polinomio interpolatore.
% Questo sarà un approssimazione dell'integrale della funzione f data.
q = h * ((alpha(1) * y(1)) + alpha(2) * y(2) + alpha(3) * y(3));