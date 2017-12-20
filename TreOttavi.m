function q = TreOttavi(f,a,b)
% Input: 
%        f      funzione da appossimare.  
%        a      estremo inferiore intervallo.
%        b      estremo superiore intervallo.      
% Output: 
%        q      valore approssimato dell'integrale della funzione f.
% Appartiene alla amiglia delle formule di quadratura di Newton-Cotes
% chiuse.
% Calcola un'approssimazione dell'integrale della funzione f
% sull'intervallo [a,b] utilizzando la formula dei Tre Ottavi.
% Viene sostituita f con il suo polinomio interpolatore di grado 3 
% costruito sui nodi x0 , x1 e x2 x3.
% Su questo intervallo viene integrato al posto di f il suo polinomio
% interpolatore di 3° grado.
% Costante di integrazione (alpha(1) + alpha(2) + alpha(3) + alpha(4) = n)
alpha = [3/8 9/8 9/8 3/8];

% Grado di precisione (numero di intervalli)
n = 3;

% Ampiezza intervallo punti utilizzati
h = (b-a)/n;

% Intervallo su cui costruire la quadratura. Costruisco i valori su cui
% andare a valutare la funzione la funzione f(x) che mi rappresenta i punti
% in cui passerà il mio polinomio interpolatore di grado 3.
% x contiene 4 punti, il primo in a ,il secondo in (a+((b-a)/3)) , il terzo
% in (a+(2(b-a)/3)) ed il quarto in b.
x = [a:h:b];

% Valuto la funzione nei punti di interpolazione, agli estremi a e b e nel
% punto centrale.
% y contiene i valori f(a), f((a+b)/2) e f(b).
y = f(x);

% Calcolo integrale sul polinomio interpolatore.
% Questo sarà un approssimazione dell'integrale della funzione f data.
q = h * ((alpha(1) * y(1)) + alpha(2) * y(2) + alpha(3) * y(3) + alpha(4) * y(4));